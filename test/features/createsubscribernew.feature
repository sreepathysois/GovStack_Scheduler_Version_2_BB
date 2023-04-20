Feature: Create a new Subscriber of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new Subscriber of Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new subscriber
When a POST request for an endpoint /subscriber/new/ is triggered to create new subscriber for scheduler block      
Then the result should return subscriber Id as "12345" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new Subscriber of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a subscriber with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<alert_url>" having "<alert_preference>" and "<status_poll_url>"
When a POST request for an endpoint /subscriber/new/ is triggered to create new subscriber for scheduler block
Then the result should return subscriber details like "<subscriber_id>" and "<subscriber_name>" for requested subscriber
And response code of POST request is "200"

Examples: 
  | requestor_id | requestor_role | name   | category | phone      | email         | alert_url   | alert_preference | status_poll_url | subscriber_name    | subscriber_id |
  | healthngo1   | healthworker   | practo | hospital | 9980555504 | abc@gmail.com | www.abc.com | phone            | www.abc.com     | xyz hospital       | 12345         | 
  

@unit @Negativeregression  
Scenario Outline: Create a new Subscriber of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a subscriber with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<alert_url>" having "<alert_preference>" and "<status_poll_url>"
When a POST request for an endpoint /subscriber/new/ is triggered to create new subscriber for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
  | requestor_id | requestor_role | name   | category    | phone      | email          | alert_url        | alert_preference | status_poll_url | status_code |
  | healthngo1   | healthworker   | practo | hospital    | 9980555504 | sree@gmail.com | wwww.alert.com   | phone            | www.abc.com     | 400         |
  | healthngo1   | healthworker   | practo | education   | 9980555504 | sree@gmail.com | www.alert.com    | email            | www.abc.com     | 403         |
  | healthngo1   | healthworker   | practo | agriculture | 9980555504 | sree@gmail.com | www.alert.com    | message          | www.abc.com     | 404         |
  | healthngo1   | healthworker   | practo | agriculture | 9980555504 | sree@gmail.com | http://alert.com | phone            | www.abc.com     | 404         |
  
  
