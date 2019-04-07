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

def check_hotel_availability(checkin, checkout, city_id, room_code)
  url = "https://distribution-xml.booking.com/2.4/json/hotelAvailability?checkin=#{checkin}&checkout=#{checkout}&city_ids=#{city_id}&hotel_facilities=facilities_for_disabled&room1=#{room_code}&extras=room_details,hotel_details"
  
  response = RestClient.get(url, headers={'Authorization': "Basic YW5hc2NpbWVudG9zb3V6YTZAZ21haWwuY29tOjYyMTc2MzIwcGVpeGFv"})

  hotels_response = JSON.parse(response)
  hotels_response["result"]
end

foo = check_hotel_availability("2019-04-08", "2019-04-10", "-1565670", "A,A")

# puts 'Alemanha'
# foo = get_hotels_by_country_id('de')
# goo = get_hotels_facilities_by_country_id(25, 'de')
# puts foo.length + ' ' + goo.length

# puts 'Holanda'
# foo = get_hotels_by_country_id('nl')
# goo = get_hotels_facilities_by_country_id(25, 'nl')
# puts foo.length + ' ' + goo.length

# puts 'Japão'
# foo = get_hotels_by_country_id('jp')
# goo = get_hotels_facilities_by_country_id(25, 'jp')
# puts foo.length + ' ' + goo.length