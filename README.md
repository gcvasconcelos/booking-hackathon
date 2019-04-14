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
{ city: "tokyo", month:"10"}
```

Return example:
```
{ 'low': -5, 'high': 10, 'rainy_days': 10 }
```

### Visa

Returns an array with the visa requirements between two countries

Receives as parameters origin country name and destination country iso2 code

Input example:
```
{ country_name: "Brazil", target_country_id:"nl"}
```