def country_parse(file_name)
  file = File.read(file_name)
  countries = JSON.parse(file)

  country_acronyms = []
  countries.each do |country|
    country_acronyms << country["alpha-2"].downcase
  end
  country_acronyms
end