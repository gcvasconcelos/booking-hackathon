require 'net/http'
require 'json'
require 'csv'
require 'open-uri'

def main(param)
 get_visa_requirements(param['country_name'].capitalize, param['target_country_id'])
end

def get_country_id(country_name)
 uri = URI('https://s3.amazonaws.com/dream-team-booking/countries.json')
 json = Net::HTTP.get_response(uri)
 countries = JSON.parse(json.body)
 country =  countries.find { |country| country['name'] == country_name}
   
 country["alpha-2"].downcase
end

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
