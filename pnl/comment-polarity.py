import requests
import re
import emoji

def get_accessible_hotels_by_city_id(city_id):
  # API credentials
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')

  # initialize loop parameters to iterate to all hotels of a city
  offset = 0
  hotels_length = 1000 
  hotels_ids = []

  # calls API x times, where x is the total number of pages existent
  while hotels_length == 1000:

    api_url = "https://distribution-xml.booking.com/2.4/json/hotels?offset="+str(offset)+"&rows=1000&city_ids=" + city_id + "&hotel_facility_type_ids=25"

    hotels_response = session.get(api_url).json()['result']
    for hotel in hotels_response:
      hotels_ids.append(str(hotel['hotel_id']))

    offset += 1000
    hotels_length = len(hotels_response)

  return hotels_ids

def get_user_reviews_by_city_id(hotel_id):
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')

  offset = 0
  results_length = 1000
  user_reviews = {
    'pros': [],
    'cons': []
  }

  while results_length == 1000:
    api_url = "https://distribution-xml.booking.com/2.4/json/reviews?offset="+ str(offset) + "&rows=1000&headline_word_count=0&hotel_ids=" + hotel_id 
    
    reviews_response = session.get(api_url).json()['result']

    for review in reviews_response:
      if review['pros']:
        user_reviews['pros'].append(review['pros'])
      if review['cons']:
        user_reviews['cons'].append(review['cons'])
    
    results_length = len(reviews_response)
    offset += 1000

  return user_reviews

def clean_review(review):
  # remove new lines and extra spaces
  review = re.sub(r'\n', ' ', review.strip())
  # detect and remove emojis 
  review = emoji.get_emoji_regexp().sub(u'', review)
  # convert ponctuation
  review = re.sub(r'&#39;', "'", review)
  review = re.sub(r'&#47;', "'", review)
  review = re.sub(r'&quot;', '"', review)
  # remove extra ponctuation
  review = re.sub(r'\.{2,}', '.', review)
  review = re.sub(r'\?{2,}', '?', review)
  review = re.sub(r'!{2,}', '!', review)
  return review

def find_keywords(review):
  regexs = ([
    re.compile("accessibility|accessible"),
    re.compile("narrow.*stairs|stairs.*narrow|steep.*stairs|stairs.*steep|reachable.*stairs|stairs.*reachable"),
    re.compile("\bwheelchair\b"),
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
    if find_keywords(review): cons_reviews.append(review)
  return cons_reviews

    
arr = []
hotels_ids = get_accessible_hotels_by_city_id('-2140479')
for hotel_id in hotels_ids:
  reviews_array = get_user_reviews_by_city_id(hotel_id)
  res = analize_user_review(reviews_array)
  print(hotel_id)
  if res:
    import pdb; pdb.set_trace()
    arr.append(res)

# reviews_array = get_user_reviews_by_city_id('10024')
# res = analize_user_review(reviews_array)
# import pdb; pdb.set_trace()