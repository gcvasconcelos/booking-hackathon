# Booking Hackathon Project

This repository is where the functions hosted in IBM cloud functions were implemented in Ruby and shared through the group members.

The functions make specific requests to be called inside the chatbot. The requests use the Booking API and additional data, originally hosted in AWS S3.

## Usage

To use these functions simply execute them. To make it available to the bot to see, we recommend uploading to a platform with a serveless service such as AWS or IBM. This code is within the framework required to run in (IBM Cloud Functions.)[https://cloud.ibm.com/openwhisk]

### Weather

Returns to the minimum and maximum temperature and number of rainy days of the month reported for that city. A valuable information for people with accessibility difficulties.

Receives as parameters the city and the month that the person intends to travel

Input example:
```
{ 'city': 'tokyo', 'month': '10'}
```

Return example:
```
{ 'low': '-5', 'high': '10', 'rainy_days': '10' }
```

### Visa

Returns an array with the visa requirements between two countries

Receives as parameters origin country name and destination country iso2 code

Input example:
```
{ 'country_name': 'Brazil', 'target_country_id': 'nl'}
```

Return example:
```
{ 'visa': "A visa is required to your destination" }
```
### Best hotels

Returns top 3 ranking accessible hotels by a given city

Input example:
```
{ 'city': 'tokyo'}
```

Return example:
```
{:name=>"Tokyo inn Sakura An", :url=>"https://www.booking.com/hotel/jp/tokyo-inn-ying-an-dong-jing.html", :photo_url=>"https://q-xx.bstatic.com/xdata/images/hotel/max500/159821991.jpg?k=8b4d14c520ea58a0e2c7ef0b5721ca969413d4138789b2f67ae94ce49383163d&o=", :price=>21000.0, :currency=>"JPY"}

{:name=>"Nestle Tokyo Deluxe Akihabara 04", :url=>"https://www.booking.com/hotel/jp/nestle-tokyo-deluxe-akihabara-04.html", :photo_url=>"https://q-xx.bstatic.com/xdata/images/hotel/max500/165337405.jpg?k=c80c841e3ee38e1b000cd1ee78250934e4f7195293fe747c540b68fca1783ab1&o=", :price=>27360.0, :currency=>"JPY"}

{:name=>"ICI HOTEL Asakusabashi by RELIEF", :url=>"https://www.booking.com/hotel/jp/ici-asakusabashiekimae-by-relief.html", :photo_url=>"https://q-xx.bstatic.com/xdata/images/hotel/max500/181952592.jpg?k=942ef256975e19362c0b432c24eb76e5f1ab03a6c1927523bd14bd90e2f214e8&o=", :price=>7500.0, :currency=>"JPY"}
```