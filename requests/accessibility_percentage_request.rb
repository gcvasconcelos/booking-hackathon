require 'rest-client'
require 'json'

def get_accessible_hotels_by_city_id(city_id)
	offset = 0
	n_of_hotels = 0
	hotels = 1000

	while hotels == 1000 do
		url = "https://distribution-xml.booking.com/2.4/json/hotels?offset=#{offset}&rows=1000&city_ids=#{city_id}&hotel_facility_type_ids=25"

		response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})
		
		hotels_response = JSON.parse(response)
		hotels = hotels_response["result"].length
		n_of_hotels += hotels

		offset += 1000
	end

	n_of_hotels
end

def get_hotels_by_city_id(city_id)
	offset = 0
	n_of_hotels = 0
	hotels = 1000

	while hotels == 1000 do
		url = "https://distribution-xml.booking.com/2.4/json/hotels?offset=#{offset}&rows=1000&city_ids=#{city_id}"
		
		response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})
		
		hotels_response = JSON.parse(response)
		hotels = hotels_response["result"].length
		n_of_hotels += hotels

		offset += 1000
	end

	n_of_hotels
end

def get_accessibility_percentage_by_city(city_id)
	accessible_hotels = get_accessible_hotels_by_city_id(city_id)
	hotels = get_hotels_by_city_id(city_id)
	
	accessible_hotels.to_f / hotels * 100
end

# puts get_accessibility_percentage_by_city(-2140479)