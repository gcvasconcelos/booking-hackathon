# ACRONIMO
# NMR DE HOTEIS
# NMR DE HOTEIS PARA PESSOAS DESABILITADAS

require 'json'
require 'csv'
load 'country_parse.rb'
load 'requests.rb'


countries = country_parse("all.json")

CSV.open("hotels.csv", "wb") do |csv|
  csv << ["country", "hotels", "accessible_hotels"]
  countries.each do |country|
    hotels = get_hotels_by_country_id(country)
    accessible_hotels = get_hotels_facilities_by_country_id(25, country)
    csv << ["#{country}", "#{hotels.length}", "#{accessible_hotels.length}"]
  end
end