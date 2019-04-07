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

def get_hotels_by_country_id(country_id)
  offset = 0
  hotel_ids = []
  hotels = 1000

  while hotels == 1000 do
    url = "https://distribution-xml.booking.com/2.4/json/hotels?offset=#{offset}&rows=1000&country_ids=#{country_id}"

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
