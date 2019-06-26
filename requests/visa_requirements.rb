require 'csv'
require 'rest-client'
require 'json'

# return iso2 country code by coutry name 
def get_country_id(country_name)
  response = RestClient.get('https://raw.githubusercontent.com/lukes/ISO-3166-Countries-with-Regional-Codes/master/all/all.json')
  countries = JSON.parse(response)

  country =  countries.find { |country| country['name'] == country_name}

  country["alpha-2"].downcase
end

# return an array with the visa requirement between two countries 
def get_visa_requirements(country_name, target_country_id)
  response = RestClient.get('https://s3.amazonaws.com/dream-team-booking/visa.csv')
  visa_data = CSV.parse(response)

  indexes = visa_data[0].each { |country| country.downcase! }

  country_id = get_country_id(country_name)

  country_id_index = indexes.find_index(country_id)
  target_country_id_index = indexes.find_index(target_country_id)

  visa_requirements = visa_data[country_id_index+1][target_country_id_index+1].to_i
  
  requirements_options = [
    "for all instances where passport and destination are the same",
    "visa is required",
    "visa can be obtained on arrival (which Passport Index considers visa-free)",
    "eTA is required",
    "visa-free travel"
  ]

  requirements_options[visa_requirements + 1]
end

# usage example using Brazil-United States visa requirements
puts get_visa_requirements('Spain', 'jp')