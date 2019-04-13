require 'rest-client'
require 'json'

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