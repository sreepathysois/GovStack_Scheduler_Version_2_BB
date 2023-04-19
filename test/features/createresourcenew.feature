Feature: Create a new resource of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new resource of Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new resource
When a POST request for an endpoint /resource/new/ is triggered to create new resource for scheduler block      
Then the result should return resource Id as "54321" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new resource of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a resource with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<alert_url>" "<alert_preference>" and "<status_poll_url>"
When a POST request for an endpoint /resource/new/ is triggered to create new resource for scheduler block
Then the result should return resource details like "<resource_id>" and "<resource_name>" for requested resource
And response code of POST request is "200"

Examples: 
  | requestor_id | requestor_role | name   | category | phone      | email         | alert_url      | alert_preference | status_poll_url | resource_name | resource_id |
  | healthngo1   | healthworker   | practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com | xyz hospital  | 67890       | 
  

@unit @Negativeregression  
Scenario Outline: Create a new resource of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a resource with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<alert_url>" "<alert_preference>" and "<status_poll_url>"
When a POST request for an endpoint /resource/new/ is triggered to create new resource for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
  | requestor_id | requestor_role | name   | category | phone      | email         | alert_url      | alert_preference | status_poll_url |  status_code |
  | healthngo1   | healthworker   | practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com |  400         |
  | healthngo1   | healthworker   | practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com |  403         |
  | healthngo1   | healthworker   | practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com |  404         |
  
