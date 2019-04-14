require 'net/http'
require 'csv'

<<<<<<< HEAD
CITY_IDS = {
    amsterdam: "-2140479",
    tokyo: "-246227",
    berlin: "-1746443"
}


def get_high_and_low_weather_by_city_id_and_month(city_id, month)
  uri = URI("https://s3.amazonaws.com/dream-team-booking/weather.csv")
  csv = Net::HTTP.get_response(uri)

  weather_csv = CSV.parse(csv.body, headers: true)
  weather_csv.each do |row|
=======
# return min and max temperature by
def get_high_and_low_wheather_by_city_id_and_month(city_id, month)
  wheather_csv = CSV.read("resources/wheather.csv", headers: true)
  wheather_csv.each do |row|
>>>>>>> b91ea50b33aeca4f0c9f38ffe6dab4c39393f634
    if row['city_id'] == city_id && row['month']== month
      return { 'low': row['low'], 'high': row['high'], 'rainy_days': row['rainy_days'] }
    end 
  end
<<<<<<< HEAD
  return {}
end


def main(param)
  get_high_and_low_weather_by_city_id_and_month(CITY_IDS[param['city'].to_sym], param['month'])
end
=======
end

# usage example using Amsterdam code
puts get_high_and_low_wheather_by_city_id_and_month()
>>>>>>> b91ea50b33aeca4f0c9f38ffe6dab4c39393f634
