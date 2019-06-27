import requests
import re

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
  clean_hotels = {}
  i = 0
  for hotel in hotels[:3]:
    clean_hotels[POSITIONS[i]] = hotel
    i+=1
  return clean_hotels

def static_review_analysis(hotel_id):
  with open('reviews.json') as json_file:  
    static_reviews = json.load(json_file)
  hotel_review = [review['review'] for review in static_reviews if review['hotel_id'] == hotel_id]  
  return hotel_review[0]

def get_best_hotels_by_city_id(city_id):
  hotels = get_accessible_hotels_by_city_id(city_id)
  top_n_hotels = []
  for hotel in hotels[:]:
    print(hotel["hotel_id"])
    print(hotel["room_data"][0]["room_info"]["min_price"])
    if hotel["room_data"][0]["room_info"]["min_price"] == 0:
      print('Was removed.')
      hotels.remove(hotel)
      continue
    hotel['accessibility_review'] = static_review_analysis(hotel['hotel_id'])
    print(hotel['accessibility_review'])
    if hotel['accessibility_review']['positive_reviews'] == []:
      print('Was removed.')
      hotels.remove(hotel)
  
  count = 0
  for hotel in hotels:
    import pdb; pdb.set_trace()
    print(hotel["room_data"][0]["room_info"]["min_price"])
    if hotel["accessibility_review"]["positive_reviews"] == []:
      count += 1

  for i in range(3):
    top_hotel = max(hotels, key=lambda hotel:len(hotel["accessibility_review"]["positive_reviews"]))
    top_n_hotels.append(top_hotel)
    hotels.remove(top_hotel)

  import pdb; pdb.set_trace()
  top_hotels = []
  for hotel in top_n_hotels:
    top_hotels.append({ 
    'name': hotel["hotel_data"]['name'], 
    'hotel_id': hotel['hotel_id'], 
    'url': hotel["hotel_data"]['url'], 
    'image': hotel["hotel_data"]["hotel_photos"][0]["url_original"],
    'price': hotel["room_data"][0]["room_info"]["min_price"],
    'currency': hotel["hotel_data"]['currency'],
    'score': hotel["hotel_data"]["review_score"]
  })
  import pdb; pdb.set_trace()
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

def get_user_reviews_by_hotel_id(hotel_id):
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')

  offset = 0
  results_length = 100
  user_reviews = {
    'pros': [],
    'cons': []
  }

  while results_length == 100:
    api_url = "https://distribution-xml.booking.com/2.4/json/reviews?offset="+ str(offset) + "&rows=100&headline_word_count=0&hotel_ids=" + str(hotel_id) 
    if len(session.get(api_url).json()) != 0:
      reviews_response = session.get(api_url).json()['result']
    else:
      continue
    for review in reviews_response:
      if review['pros']:
        user_reviews['pros'].append(review['pros'])
      if review['cons']:
        user_reviews['cons'].append(review['cons'])
    results_length = len(reviews_response)
    offset += 100
  return user_reviews

def clean_review(review):
  # remove new lines and extra spaces
  review = re.sub(r'\n', ' ', review.strip())
  # convert ponctuation
  review = re.sub(r'&#39;', "'", review)
  review = re.sub(r'&#47;', "'", review)
  review = re.sub(r'&quot;', '"', review)
  return review

def find_cons_keywords(review):
  regexs = ([
    re.compile("accessibility|not accessible|weren't accessible|isn't accessible|aren't accessible"),
    re.compile("narrow.*stairs|stairs.*narrow|steep.*stairs|stairs.*steep|reachable.*stairs|stairs.*reachable"),
    re.compile("\bwheelchair\b")
  ]) 
  has_keyword = False
  for r in regexs:
    found_expression = re.search(r, review.lower())
    # check if any of the keywords were found
    if found_expression:
      has_keyword = True

  return has_keyword

def find_pros_keywords(review):
  regexs = ([
    re.compile("disabled"),
    re.compile("\bwheelchair\b")
  ]) 
  has_keyword = False
  for r in regexs:
    found_expression = re.search(r, review.lower())
    # check if any of the keywords were found
    if found_expression:
      has_keyword = True

  return has_keyword

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

def npl_accessibility_analysis(hotel_id):
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

def test_hotels_from_city(city_id):
  hotel_ids = get_accessible_hotels_by_city_id(city_id)
  negative_reviews = []
  positive_reviews = []
  total = 0

  for hotel_id in hotel_ids:
    reviews_array = get_user_reviews_by_hotel_id(hotel_id)
    analysis_result = analize_user_review(reviews_array)
    if analysis_result['cons']:
      negative_reviews.append(analysis_result['cons'])
    if analysis_result['pros']:
      positive_reviews.append(analysis_result['pros'])
    total +=1
  return ({
    'negative_reviews': negative_reviews, 
    'positive_reviews': positive_reviews
  })

res = main({'city': 'amsterdam'})
import pdb; pdb.set_trace()
