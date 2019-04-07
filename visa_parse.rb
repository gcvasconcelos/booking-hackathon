require 'csv'
load 'country_parse.rb'

def get_visa_requirements(country_id, target_country_id)
  matrix = CSV.read("./passport-index-iso2-matrix.csv", headers: true)
  indexes = country_parse('all.json')

  country_id_index = indexes.find_index(country_id)
  visa_requirements = matrix[country_id_index][target_country_id]
  
  requirements_options = [
    "visa-free travel",
    "eTA is required",
    "visa can be obtained on arrival (which Passport Index considers visa-free)",
    "visa is required",
    "for all instances where passport and destination are the same"
  ]

  requirements_options[visa_requirements+1]
end

puts foo = get_visa_requirements('br','jp')