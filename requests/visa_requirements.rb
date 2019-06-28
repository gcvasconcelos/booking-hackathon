# This function is deployed in IBM cloud functions

require 'net/http'
require 'json'
require 'csv'
require 'open-uri'

# Main function with unique hash return required by the cloud function documentation. The return is a hash with string stating the visa requirements between two cities. The parameters are the origin country and destination country in ISO alpha-2
def main(param)
 get_visa_requirements(param['country_name'].capitalize, param['target_country_id'])
end

# Retrieve country id in a json hosted in AWS function using the country name (ISO alpha-2)
def get_country_id(country_name)
 uri = URI('https://s3.amazonaws.com/dream-team-booking/countries.json')
 json = Net::HTTP.get_response(uri)
 countries = JSON.parse(json.body)
 country =  countries.find { |country| country['name'] == country_name}
   
 country["alpha-2"].downcase
end

# Retrieve a string with the visa requirements between two countries, using a csv file with a kind of confusion matrix of contries, all rows (origin country) and column (destination coountry) indexes are a list of countries in alphabetical order in witch each value is a code ranging -1 to 3, signifing the visa requirements
def get_visa_requirements(country_name, target_country_id)
 uri = URI('https://s3.amazonaws.com/dream-team-booking/visa.csv')
 csv = Net::HTTP.get_response(uri)

 visa_data = CSV.parse(csv.body)

 indexes = visa_data[0].each { |country| country.downcase! }

 country_id = get_country_id(country_name)

 country_id_index = indexes.find_index(country_id)
 target_country_id_index = indexes.find_index(target_country_id)

 visa_requirements = visa_data[country_id_index+1][target_country_id_index+1].to_i
 
 requirements_options = [
   "You don't need a visa on domestic travels",
   "A visa is required to your destination",
   "Your visa can be obtained on arrival",
   "An eTA is required on your destination",
   "Your destination is visa-free"
 ]
 
 {
   "visa": requirements_options[visa_requirements+1]
 }
end 
