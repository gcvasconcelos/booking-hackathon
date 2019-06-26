import spacy
from textblob import TextBlob
import requests



reviews_response = session.get('https://distribution-xml.booking.com/2.4/json/hotels?offset=0&rows=1000&city_ids=-246227&hotel_facility_type_ids=25&extras=hotel_info,hotel_photos,room_info').json()

def get_user_reviews_by_city_id(hotel_id):
  session = requests.Session()
  session.auth = ('wladimirgramacho', 'nO#1A128ne55U^^Da6')
  offset = 0
  results_length = 0

  while results_length == 1000:
    api_url = offset + hotel_id 
    reviews_response = session.get(api_url).json()['result']
    results_length = reviews_response.


