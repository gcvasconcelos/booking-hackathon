# This function is deployed in IBM cloud functions

require 'net/http'
require 'csv'
require 'date'

CITY_IDS = {
    amsterdam: "-2140479",
    tokyo: "-246227",
    berlin: "-1746443"
}

# Main function with unique hash return required by the cloud function documentation. The return is a hash with the minimum, maximum and number of rainy days in a month in a given city. The required parameters are the check-in date and the city_id
def main(param)
  month = Date.parse(param['check_in']).month
  get_max_min_temperature(CITY_IDS[param['city'].to_sym], month.to_s)
end

# Get maximum and minimum temperatures and rainy days of a city during a given month. A csv file is used to get information about the average forecast and the numver of rainy_days in each month of Amsterdam, Tokyo and Berlim
def get_max_min_temperature(city_id, month)
  uri = URI("https://s3.amazonaws.com/dream-team-booking/weather.csv")
  
  csv = Net::HTTP.get_response(uri)

  weather_csv = CSV.parse(csv.body, headers: true)
  weather_csv.each do |row|
    if row['city_id'] == city_id && row['month']== month
      return { 'low': row['low'], 'high': row['high'], 'rainy_days': row['rainy_days'] }
    end 
  end
  return {}
end