import requests
import re
import json

CITY_IDS = {
    'amsterdam': "-2140479",
    'tokyo': "-246227",
    'berlin': "-1746443"
}

POSITIONS = [
    'first',
    'second',
    'third'
]

def main(param):
  hotels = get_best_hotels_by_city_id(CITY_IDS[param['city']])   
  return {
    'first': hotels[0], 
    'second': hotels[1], 
    'third': hotels[2] 
  }


def static_review_analysis(hotel_id, city_id):
  json_name = '../src/' + list(CITY_IDS.keys())[list(CITY_IDS.values()).index(city_id)] + '_reviews.json'
  with open(json_name) as json_file:  
    static_reviews = json.load(json_file)
  hotel_review = [review['review'] for review in static_reviews if review['hotel_id'] == str(hotel_id)]  
  if hotel_review:
    return {
      'positive_reviews': hotel_review[0]['pros'],
      'negative_reviews': hotel_review[0]['cons']
    }

def get_best_hotels_by_city_id(city_id):
  hotels = get_accessible_hotels_by_city_id(city_id)
  top_n_hotels = []
  for hotel in hotels[:]:
    if hotel["room_data"][0]["room_info"]["min_price"] == 0:
      hotels.remove(hotel)
      continue
    hotel['accessibility_review'] = static_review_analysis(hotel['hotel_id'], city_id)
    if hotel['accessibility_review']['positive_reviews'] == []:
      hotels.remove(hotel)

  for i in range(3):
    top_hotel = max(hotels, key=lambda hotel:len(hotel["accessibility_review"]["positive_reviews"]))
    top_n_hotels.append(top_hotel)
    hotels.remove(top_hotel)



  top_hotels = []
  for hotel in top_n_hotels:
    if len(hotel["accessibility_review"]['positive_reviews']) > len(hotel["accessibility_review"]['negative_reviews']):
      hotel_review = 'We found some positive reviews of this hotel. Here is a great one:\n "' + hotel["accessibility_review"]['positive_reviews'][0] + '"'
    else:
      hotel_review = ""

    top_hotels.append({ 
    'accessibility_review': hotel_review, 
    'name': hotel["hotel_data"]['name'], 
    'hotel_id': hotel['hotel_id'], 
    'url': hotel["hotel_data"]['url'], 
    'image': hotel["hotel_data"]["hotel_photos"][0]["url_original"],
    'price': hotel["room_data"][0]["room_info"]["min_price"],
    'currency': hotel["hotel_data"]['currency'],
    'score': hotel["hotel_data"]["review_score"]
  })
  return top_hotels

def get_accessible_hotels_by_city_id(city_id):
  # API credentials
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')

  # initialize loop parameters to iterate to all hotels of a city
  offset = 0
  hotels_length = 1000 
  hotels = []

  # calls API x times, where x is the total number of pages existent
  while hotels_length == 1000:
    api_url = "https://distribution-xml.booking.com/2.4/json/hotels?offset="+str(offset)+"&rows=1000&city_ids=" + city_id + "&hotel_facility_type_ids=25&extras=hotel_info,hotel_photos,room_info"

    hotels_response = session.get(api_url).json()['result']
    for hotel in hotels_response:
      hotels.append(hotel)

    offset += 1000
    hotels_length = len(hotels_response)

  return hotels

res = main({'city': 'amsterdam'})
import pdb; pdb.set_trace()
