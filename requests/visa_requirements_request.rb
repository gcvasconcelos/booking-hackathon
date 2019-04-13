require 'csv'
load 'country_parse.rb'

def get_visa_requirements(country_id, target_country_id)
  matrix = CSV.read('resources/passport-index-iso2-matrix.csv')

  indexes = matrix[0].each { |country| country.downcase! }

  country_id_index = indexes.find_index(country_id)
  target_country_id_index = indexes.find_index(target_country_id)

  visa_requirements = matrix[country_id_index+1][target_country_id_index+1].to_i
  
  requirements_options = [
    "for all instances where passport and destination are the same",
    "visa is required",
    "visa can be obtained on arrival (which Passport Index considers visa-free)",
    "eTA is required",
    "visa-free travel"
  ]

  requirements_options[visa_requirements + 1]
end

puts get_visa_requirements('br', 'us')