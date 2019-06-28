# This function is deployed in IBM cloud functions

import requests
import re
import json

# The following funcions were only implemented and tested to this city_ids. This could be retrieved using the hotel endpoint, but they were saved in memory due to performance issues
CITY_IDS = {
  'amsterdam': "-2140479",
  'tokyo': "-246227",
  'berlin': "-1746443"
}

# Main function with unique hash return required by the cloud function documentation. The return is the three best available hotels chosen by the platform to an user, each with its name, id, url, image, price, currency, score and a string with a positive review about it. The paremeters are the destination city_id, check_in and check_out dates and what type of accessibility needs the user has.
POSITIONS = [
  'first',
  'second',
  'third'
]


MOBILITY = {
  "walk" : {
    "hotel_facilities" : "facilities_for_disabled",
    "room_facilities" : "upper_floors_accessible_by_lift,toilet_with_grab_rails,walk_in_shower,emergency_cord_in_bathroom,accessible_by_lift"
  },
  "stand" : {
    "hotel_facilities" : "facilities_for_disabled",
    "room_facilities" : "upper_floors_accessible_by_lift,entire_unit_wheelchair_accessible,toilet_with_grab_rails,adapted_bath,walk_in_shower,lowered_sink,emergency_cord_in_bathroom,shower_chair,accessible_by_lift"
  },
  "wheelchair" : {
    "hotel_facilities" : "facilities_for_disabled",
    "room_facilities" : "upper_floors_accessible_by_lift,entire_unit_wheelchair_accessible,toilet_with_grab_rails,adapted_bath,roll_in_shower,raised_toilet,lowered_sink,emergency_cord_in_bathroom,shower_chair,accessible_by_lift"
  }
}

def main(param):
  hotels = get_best_hotels_by_city_id(CITY_IDS[param['city']], param['check_in'], param['check_out'], param['mobility'])   
  return {
    'first': hotels[0], 
    'second': hotels[1], 
    'third': hotels[2] 
  }


def static_review_analysis(hotel_id, static_reviews):
  hotel_review = [review['review'] for review in static_reviews if review['hotel_id'] == str(hotel_id)]  
  if hotel_review:
    return {
      'positive_reviews': hotel_review[0]['pros'],
      'negative_reviews': hotel_review[0]['cons']
    }

def get_best_hotels_by_city_id(city_id, check_in, check_out, mobility):
  hotels = get_accessible_hotels_by_city_id(city_id, check_in, check_out, mobility)
  top_n_hotels = []

  json_name = "https://dream-team-booking.s3.amazonaws.com/" + list(CITY_IDS.keys())[list(CITY_IDS.values()).index(city_id)] + "_reviews.json"
  session = requests.Session()
  static_reviews = session.get(json_name).json()

  for hotel in hotels[:]:
    hotel['accessibility_review'] = static_review_analysis(hotel['hotel_id'], static_reviews)
    if hotel['accessibility_review']['positive_reviews'] == []:
      hotels.remove(hotel)

  for i in range(3):
    top_hotel = max(hotels, key=lambda hotel:len(hotel["accessibility_review"]["positive_reviews"]))
    top_n_hotels.append(top_hotel)
    hotels.remove(top_hotel)

  top_hotels = []
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')
  for hotel in top_n_hotels:
    if len(hotel["accessibility_review"]['positive_reviews']) > len(hotel["accessibility_review"]['negative_reviews']):
      hotel_review = 'We found some positive reviews of this hotel. Here is a great one:\n "' + hotel["accessibility_review"]['positive_reviews'][0] + '"'
    else:
      hotel_review = ""

    api_url = "https://distribution-xml.booking.com/2.4/json/hotels?hotel_ids=" + str(hotel['hotel_id']) + "&extras=hotel_photos,hotel_info"
    hotel_info = session.get(api_url).json()['result'][0]

    top_hotels.append({ 
    'accessibility_review': hotel_review, 
    'name': hotel["hotel_name"], 
    'hotel_id': hotel['hotel_id'], 
    'url': hotel_info['hotel_data']['url'], 
    'image': hotel_info["hotel_data"]["hotel_photos"][0]["url_original"],
    'price': hotel['price'],
    'currency': hotel["hotel_currency_code"],
    'score': hotel["review_score"]
  })
  return top_hotels

def get_accessible_hotels_by_city_id(city_id, check_in, check_out, mobility):
  # API credentials
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')

  # initialize loop parameters to iterate to all hotels of a city
  offset = 0
  hotels_length = 1000 
  hotels = []

  # calls API x times, where x is the total number of pages existent
  while hotels_length == 1000:
    api_url = "https://distribution-xml.booking.com/2.4/json/hotelAvailability?offset=" + str(offset) + "&rows=1000&checkin=" + str(check_in) + "&checkout="+ str(check_out) + "&city_ids=" + str(city_id) + "&hotel_facilities=" + str(MOBILITY[mobility]['hotel_facilities']) + "&room1=A,A&extras=hotel_details"

    hotels_response = session.get(api_url).json()['result']
    for hotel in hotels_response:
      hotels.append(hotel)

    offset += 1000
    hotels_length = len(hotels_response)
  return hotels

res = main({'city': 'amsterdam', 'check_in': '2019-09-25', 'check_out': '2019-09-26', 'mobility': 'wheelchair'})
import pdb; pdb.set_trace()
