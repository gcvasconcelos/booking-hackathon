require 'rest-client'
require 'json'

# returns an array of accessible hotels (with hotel info, photos and room info) in a city
def get_accessible_hotels_by_city_id(city_id)
	offset = 0
	hotels_array = []
	hotels = 1000

	# calls API x times, where x is the total number of pages existent
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

# returns an array of top 3 accessible hotels (with hotel info, photos and room info) in a city
def get_best_hotels_by_city_id(city_id)
	top_hotels = []

	hotels = get_accessible_hotels_by_city_id(city_id)
	hotels = hotels.delete_if { |hotel| hotel["room_data"][0]["room_info"]["min_price"] == 0 }
	top_hotels_hash = hotels.max_by(3) { |hotel| hotel["hotel_data"]["review_score"] ? hotel["hotel_data"]["review_score"] : 0 }

	top_hotels_hash.each do |hotel|
		top_hotels << { 
						'name': hotel["hotel_data"]['name'], 
						'url': hotel["hotel_data"]['url'], 
						'photo_url': hotel["hotel_data"]["hotel_photos"][0]["url_original"],
						'price': hotel["room_data"][0]["room_info"]["min_price"],
						'currency': hotel["hotel_data"]['currency']
					}
end

	top_hotels
end

# test result of request using Amsterdam code
puts get_best_hotels_by_city_id(-246227)
