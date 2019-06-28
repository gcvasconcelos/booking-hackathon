# All functions used to improve the performance of the best_hotels cloud function.

import json
import requests
import re

# Retrieve all accessible hotels ('facilities_for_disabled' value in the 'hotel_facility_type_ids' field) using  the hotels endpoint as hotel_id array
def get_accessible_hotels_by_city_id(city_id):
  # API credentials
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')

  # initialize loop parameters to iterate to all hotels of a city
  offset = 0
  hotels_length = 1000 
  hotels_ids = []

  # iterate through all pages of hotels in a city
  while hotels_length == 1000:
    api_url = "https://distribution-xml.booking.com/2.4/json/hotels?offset="+str(offset)+"&rows=1000&city_ids=" + city_id + "&hotel_facility_type_ids=25"

    hotels_response = session.get(api_url).json()['result']
    for hotel in hotels_response:
      hotels_ids.append(str(hotel['hotel_id']))

    offset += 1000
    hotels_length = len(hotels_response)

  return hotels_ids

# Retrive all reviews of a hotel. It returns a dict with all pros and cons of the hotel in an array of reviews 
def get_user_reviews_by_hotel_id(hotel_id):
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')

  offset = 0
  results_length = 100
  user_reviews = {
    'pros': [],
    'cons': []
  }

  # Iterate through all pages of reviews in a hotel.
  while results_length == 100:
    # headline_word_count=0 field makes the text of the reviews truncate > 200 characters (maximum value given by the API backend)
    api_url = "https://distribution-xml.booking.com/2.4/json/reviews?offset="+ str(offset) + "&rows=100&headline_word_count=0&hotel_ids=" + hotel_id 
    
    reviews_response = session.get(api_url).json()
    if reviews_response:
      reviews_response = reviews_response['result']
    else:
      offset += 100
      continue
    for review in reviews_response:
      if review['pros']:
        user_reviews['pros'].append(review['pros'])
      if review['cons']:
        user_reviews['cons'].append(review['cons'])
    results_length = len(reviews_response)
    offset += 100
  return user_reviews

# Used to clean the text of a review so it will be ready to be sent to the chatbot
def clean_review(review):
  # remove new lines and extra spaces
  review = re.sub(r'\s+', ' ', review.strip())
  # convert ponctuation
  review = re.sub(r'&#39;', "'", review)
  review = re.sub(r'&#47;', "/", review)
  review = re.sub(r'&quot;', '"', review)
  return review

# Check if review contains words that talk about accessibility in a bad way
def find_cons_keywords(review):
  regexs = ([
    re.compile("accessibility|not accessible|weren't accessible|isn't accessible|aren't accessible"),
    re.compile("\bwheelchair\b")
  ]) 
  has_keyword = False
  for r in regexs:
    found_expression = re.search(r, review.lower())
    if found_expression:
      has_keyword = True

  return has_keyword

# Check if review contains words that talk about accessibility in a good way
def find_pros_keywords(review):
  regexs = ([
    re.compile("disabled"),
    re.compile("\bwheelchair\b")
  ]) 
  has_keyword = False
  for r in regexs:
    found_expression = re.search(r, review.lower())
    if found_expression:
      has_keyword = True

  return has_keyword

# Get all reviews that talk about accessibility of a hotel user reviews and returns it in a dict of pros and cons
def analize_user_review(user_reviews):
  cons = user_reviews['cons']
  cons_reviews = []
  for review in cons:
    review = clean_review(review)
    if find_cons_keywords(review): cons_reviews.append(review)
  
  pros = user_reviews['pros']
  pros_reviews = []
  for review in pros:
    review = clean_review(review)
    if find_pros_keywords(review): pros_reviews.append(review)
      
  return ({
    'cons': cons_reviews, 
    'pros': pros_reviews
  })

# Get all reviews that talk about accessibility, given a hotel_id and returns it in a dict of negative and positive reviews
def analize_hotel_reviews(hotel_id):
  negative_reviews = []
  positive_reviews = []

  reviews_array = get_user_reviews_by_hotel_id(hotel_id)
  analysis_result = analize_user_review(reviews_array)

  if analysis_result['cons']:
    negative_reviews.append(analysis_result['cons'])
  if analysis_result['pros']:
    positive_reviews.append(analysis_result['pros'])
  
  return ({
    'negative_reviews': negative_reviews, 
    'positive_reviews': positive_reviews
  })

# Get all reviews that talk about accessibility of each hotel in a city, returns an array of dicts with the hotel id and its reviews about accessibility, then saves it all in a json file that is used as cache to improve performance
def analize_city_hotel_reviews(city_id):
  hotel_ids = get_accessible_hotels_by_city_id(city_id)

  analysis = []
  total = 0
  for hotel_id in hotel_ids:
    hotel = {}
    hotel["hotel_id"] = hotel_id
    reviews_array = get_user_reviews_by_hotel_id(hotel_id)
    hotel["review"] = analize_user_review(reviews_array)
    analysis.append(hotel)
    total += 1
    print(total)

  with open('reviews.json', 'w') as outfile:  
    json.dump(analysis, outfile)

# Test function used to open json file and retrieve all reviews of the hotel
def static_review_analysis(hotel_id):
  with open('reviews.json') as json_file:  
    static_reviews = json.load(json_file)
  hotel_review = [review['review'] for review in static_reviews if review['hotel_id'] == hotel_id]  
  return hotel_review[0]

analize_city_hotel_reviews('-246227')
# res = static_review_analysis('10098')
import pdb; pdb.set_trace()

# res = analize_hotel_reviews('11318')
# import pdb; pdb.set_trace()

# res = get_user_reviews_by_hotel_id('11318')
# import pdb; pdb.set_trace()