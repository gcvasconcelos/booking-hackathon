require 'rest-client'
require 'json'

def get_hotels_facilities_by_country_id(facilities_id, country_id)
  offset = 0
  hotel_ids = []
  hotels = 1000

  while hotels == 1000 do
    url = "https://distribution-xml.booking.com/2.4/json/hotels?offset=#{offset}&rows=1000&country_ids=#{country_id}&hotel_facility_type_ids=#{facilities_id}"

    response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})
    
    hotels_response = JSON.parse(response)
    hotels = hotels_response["result"].length
  
    hotels_response["result"].each do |hotel|
      hotel_ids << hotel["hotel_id"]
    end
    offset += 1000
  end

  hotel_ids
end

# 25: 'Facilities for disabled guests'
accessible_hotels = get_hotels_facilities_by_country_id(25, 'nl')

def get_hotels_by_country_id(country_id)
  url = "https://distribution-xml.booking.com/2.4/json/hotels?offset=#{offset}&rows=1000&country_ids=#{country_id}"

  response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})

  hotels = JSON.parse(response)

  hotel_ids = []

  hotels["result"].each do |hotel|
    hotel_ids << hotel["hotel_id"]
  end
  hotel_ids
end

city_hotels = get_hotels_by_country_id(-2140479)
