require 'rest-client'
require 'json'

def get_hotels_facilities_by_city_id(city_id)
  offset = 0
  hotels_array = []
  hotels = 1000

  while hotels == 1000 do
    url = "https://distribution-xml.booking.com/2.4/json/hotels?offset=#{offset}&rows=1000&city_ids=#{city_id}&hotel_facility_type_ids=25&extras=hotel_info,hotel_photos,room_info"

    response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})
    
    hotels_response = JSON.parse(response)
    hotels = hotels_response["result"].length
  
    hotels_array << hotels_response["result"]
    offset += 1000
  end

  hotels_array[0]
end

def get_top_hotel_url(hotels)
  parsed_top_five_hotels = []

  top_five_hotels = hotels.max_by(3) { |hotel| hotel["hotel_data"]["review_score"] ? hotel["hotel_data"]["review_score"] : 0 }

  top_five_hotels.each do |hotel|
    parsed_top_five_hotels << { 'name': hotel["hotel_data"]['name'], 
                                'url': hotel["hotel_data"]['url'], 
                                'photo_url': hotel["hotel_data"]["hotel_photos"][0]["url_original"],
                                'price': hotel["room_data"][0]["room_info"]["min_price"],
                                'currency': hotel["hotel_data"]['currency']
                              }
  end

  parsed_top_five_hotels
end

foo = get_hotels_facilities_by_city_id(-2140479)
puts get_top_hotel_url(foo)

def get_hotels_by_city_id(city_id)
  offset = 0
  hotels_array = []
  hotels = 1000

  while hotels == 1000 do
    url = "https://distribution-xml.booking.com/2.4/json/hotels?offset=#{offset}&rows=1000&city_ids=#{city_id}"

    response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})

    hotels_response = JSON.parse(response)
    hotels = hotels_response["result"].length

    hotels_array << hotels_response["result"]
    offset += 1000
  end

  hotels_array[0]
end

def check_hotel_availability(checkin, checkout, city_id, room_code)
  url = "https://distribution-xml.booking.com/2.4/json/hotelAvailability?checkin=#{checkin}&checkout=#{checkout}&city_ids=#{city_id}&hotel_facilities=facilities_for_disabled&room1=#{room_code}&extras=room_details,hotel_details"
  
  response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})

  hotels_response = JSON.parse(response)
  hotels_response["result"]
end

# foo = check_hotel_availability("2019-04-08", "2019-04-10", "-1565670", "A,A")