Feature: Update a subscriber details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update a subscriber details of Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update a subscriber details with its ID "12345"
When an Update request for an endpoint /subscriber/modifications/ is triggered to update existing subscriber details for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update a subscriber details of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for a subscriber with Id "<subscriber_id>" to update a subscriber details name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<alert_url>" having "<alert_preference>" and "<status_poll_url>" 
When an Update request for an endpoint /subscriber/modifications/ is triggered to update existing subscriber details for scheduler block 
Then response code of Update request is "200"

Examples: 
  | requestor_id | requestor_role | subscriber_id | name  | category | phone      | email         | alert_url   | alert_preference | status_poll_url | 
  | healthngo1   | healthworker   | 12345         |practo | hospital | 9980555504 | abc@gmail.com | www.abc.com | phone            | www.abc.com     | 


@unit @Negativeregression  
Scenario Outline: Update a subscriber details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for a subscriber with Id "<subscriber_id>" to update a subscriber details name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<alert_url>" having "<alert_preference>" and "<status_poll_url>" 
When an Update request for an endpoint /subscriber/modifications/ is triggered to update existing subscriber details for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
  | requestor_id | requestor_role | subscriber_id | name   | category    | phone      | email          | alert_url      | alert_preference | status_poll_url | status_code |
  | healthngo1   | healthworker   | hello         | practo | hospital    | 9980555504 | sree@gmail.com | wwww.alert.com | phone            | www.abc.com     | 400         |
  | healthngo1   | healthworker   | 3456          | practo | education   | 9980555504 | sree@gmail.com | www.alert.com  | email            | www.abc.com     | 403         |
  | healthngo1   | healthworker   | 1234          | practo | agriculture | 9980555504 | sree@gmail.com | www.alert.com  | message          | www.abc.com     | 404         |
  | healthngo1   | healthworker   | 4567          | practo | agriculture | 9980555504 | sree@gmail.com | http://alert.com | phone            | www.abc.com     | 404         |
  
  

