require 'rest-client'
require 'json'

def old_get_hotels_facilities_by_country_id(facilities_id, country_id)
  url = "https://distribution-xml.booking.com/2.4/json/hotels?country_ids=#{country_id}&extras=hotel_facilities"

  response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})

  hotel_facilities = JSON.parse(response)

  target_facilities = []

  hotel_facilities["result"].each do |hotel|
    facilities = hotel["hotel_data"]["hotel_facilities"]

    facilities.each do |facility|
      target_facilities << hotel["hotel_id"] if facility["hotel_facility_type_id"] == facilities_id
    end
  end
  target_facilities
end


def get_hotels_facilities_by_country_id(facilities_id, country_id)
  url = "https://distribution-xml.booking.com/2.4/json/hotels?country_ids=#{country_id}&hotel_facility_type_ids=#{facilities_id}"

  response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})
  
  hotels = JSON.parse(response)
  
  hotel_ids = []

  hotels["result"].each do |hotel|
    hotel_ids << hotel["hotel_id"]
  end
  hotel_ids
end

# 25: 'Facilities for disabled guests'
# -2140479: Amsterdam
foo = get_hotels_facilities_by_country_id(25, 'nl')
goo = old_get_hotels_facilities_by_country_id(25, 'nl')

puts foo.length
puts goo.length

# def get_hotels_by_country_id(country_id)
#   url = "https://distribution-xml.booking.com/2.4/json/hotels?rows=100&country_ids=#{country_id}"
#   uri = URI(url)

#   response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})

#   hotels = JSON.parse(response)

#   hotel_ids = []

#   hotels["result"].each do |hotel|
#     hotel_ids << hotel["hotel_id"]
#   end
#   hotel_ids
# end

# city_hotels = get_hotels_by_country_id(-2140479)
