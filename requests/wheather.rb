require 'net/http'
require 'csv'

CITY_IDS = {
    amsterdam: "-2140479",
    tokyo: "-246227",
    berlin: "-1746443"
}


def get_high_and_low_weather_by_city_id_and_month(city_id, month)
  uri = URI("https://s3.amazonaws.com/dream-team-booking/weather.csv")
  
  csv = Net::HTTP.get_response(uri)

  weather_csv = CSV.parse(csv.body, headers: true)
  #return {"high": "0","low": "0","rainy_days": "0"}
  weather_csv.each do |row|
    if row['city_id'] == city_id && row['month']== month
      return { 'low': row['low'], 'high': row['high'], 'rainy_days': row['rainy_days'] }
    end 
  end
  return {}
end


def main(param)
    get_high_and_low_weather_by_city_id_and_month(CITY_IDS[param['city'].to_sym], param['month'].to_s)
end