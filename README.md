# Booking Hackathon Project

This repository is where the functions hosted in IBM cloud functions were implemented in Ruby and shared through the group members.

The functions make specific requests to be called inside the chatbot. The requests use the Booking API and additional data, originally hosted in AWS S3.

## Usage

To use these functions simply execute them. To make it available to the bot to see, we recommend uploading to a platform with a serveless service such as AWS or IBM. This code is within the framework required to run in (IBM Cloud Functions.)[https://cloud.ibm.com/openwhisk]

## Functions
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

Returns top 3 accessible hotels by a given city.

Input example:
```
{'city': 'amsterdam', 'check_in': '2019-09-25', 'check_out': '2019-09-26', 'mobility': 'wheelchair'}
```

Return example:
```
{'first': {'accessibility_review': 'We found some positive reviews of this hotel. Here is a great one:\n "Thoughtful facilities for disabled people, friendly staff. Recommend!"', 'name': 'DoubleTree by Hilton Amsterdam Centraal Station', 'hotel_id': 288883, 'url': 'https://www.booking.com/hotel/nl/double-tree-by-hilton-amsterdam-centraal-station.html', 'image': 'https://q-xx.bstatic.com/xdata/images/hotel/max500/21240434.jpg?k=dcef5759c3e00f0edda28facdadf2648d74c11ec69e10dea29af6ca5a642f8e0&o=', 'price': 256.5, 'currency': 'EUR', 'score': 8.3}, 
'second': {'accessibility_review': 'We found some positive reviews of this hotel. Here is a great one:\n "Facilities for disabled room."', 'name': 'Holiday Inn Express Amsterdam - Sloterdijk Station', 'hotel_id': 341228, 'url': 'https://www.booking.com/hotel/nl/holiday-inn-express-amsterdam-slotendijk-station.html', 'image': 'https://q-xx.bstatic.com/xdata/images/hotel/max500/182157824.jpg?k=2fa2ceed268288ef484f23c8a01506c423addd14255ec51dc802fa0e0b631e30&o=', 'price': 134.0, 'currency': 'EUR', 'score': 8.3}, 
'third': {'accessibility_review': '', 'name': 'NH Collection Amsterdam Barbizon Palace', 'hotel_id': 10362, 'url': 'https://www.booking.com/hotel/nl/nhbarbizon.html', 'image': 'https://q-xx.bstatic.com/xdata/images/hotel/max500/70099507.jpg?k=5482e434ac1b29236e3ffb266dea3e6b0d56a46b90883fa53598e497bb3d2b86&o=', 'price': 279.0, 'currency': 'EUR', 'score': 8.7}}
```
