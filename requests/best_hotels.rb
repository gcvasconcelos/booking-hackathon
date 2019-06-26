require 'net/http'
require 'json'

CITY_IDS = {
    amsterdam: "-2140479",
    tokyo: "-246227",
    berlin: "-1746443"
}

POSITIONS = [
    'first',
    'second',
    'third'
]

def main(param)
  hotels = get_best_hotels_by_city_id(CITY_IDS[param['city'].to_sym])
  clean_hotels = {}
  hotels.take(3).each_with_index do |hotel, index|
    clean_hotels[POSITIONS[index]] = hotels[index]
  end
  clean_hotels
end

def get_best_hotels_by_city_id(city_id)
	top_hotels = []

	hotels = get_accessible_hotels_by_city_id(city_id)
    hotels = hotels.delete_if { |hotel| hotel["room_data"][0]["room_info"]["min_price"] == 0 }
	top_n_hotels = hotels.max_by(3) { |hotel| hotel["hotel_data"]["review_score"] ? hotel["hotel_data"]["review_score"] : 0 }

	top_n_hotels.each do |hotel|
		top_hotels << { 'name': hotel["hotel_data"]['name'], 
						'url': hotel["hotel_data"]['url'], 
						'image': hotel["hotel_data"]["hotel_photos"][0]["url_original"],
						'price': hotel["room_data"][0]["room_info"]["min_price"],
						'currency': hotel["hotel_data"]['currency'],
						'score': hotel["hotel_data"]["review_score"]
					}
    end

	top_hotels
end

def get_accessible_hotels_by_city_id(city_id)
  hotels_array = []
  hotels = 1000

  
    url = URI.parse("https://distribution-xml.booking.com/2.4/json/hotels?rows=10&city_ids=#{city_id}&hotel_facility_type_ids=25&extras=hotel_info,hotel_photos,room_info")
    req = Net::HTTP::Get.new(url.to_s, 'Content-Type' => 'application/json')
    req['Authorization'] = "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    res = http.request(req)
    hotels_response = JSON.parse(res.body)
    hotels = hotels_response["result"].length
    hotels_array << hotels_response["result"]

  hotels_array[0]
end



