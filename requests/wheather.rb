require 'csv'

# return min and max temperature by
def get_high_and_low_wheather_by_city_id_and_month(city_id, month)
  wheather_csv = CSV.read("resources/wheather.csv", headers: true)
  wheather_csv.each do |row|
    if row['city_id'] == city_id && row['month']== month
      return { 'low': row['low'], 'high': row['high'] }
    end 
  end
end

# usage example using Amsterdam code
puts get_high_and_low_wheather_by_city_id_and_month()