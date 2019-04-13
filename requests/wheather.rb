require 'net/http'
require 'csv'

def get_high_and_low_wheather_by_city_id_and_month(city_id, month)
  uri = URI("https://s3.amazonaws.com/dream-team-booking/wheather.csv")
  csv = Net::HTTP.get_response(uri)

  wheather_csv = CSV.parse(csv.body, headers: true)
  wheather_csv.each do |row|
    if row['city_id'] == city_id && row['month']== month
      return { 'low': row['low'], 'high': row['high'], 'rainy_days': row['rainy_days'] }
    end 
  end
  return
end

# call example
puts get_high_and_low_wheather_by_city_id_and_month('-2140479', '1')