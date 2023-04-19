Feature: Update a resource of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update a resource for Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update a resource with its ID "54321"
When an Update request for an endpoint /resource/modifications/ is triggered to update existing resource for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update a resource for Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for a resource with Id "<resource_id>" to update a resource details like "<name>" for "<category>" with "<phone>" "<email>"  "<alert_url>" "<alert_preference>" and "<status_poll_url>"
When an Update request for an endpoint /resource/modifications/ is triggered to update existing resource for scheduler block 
Then response code of Update request is "200"

Examples: 
  | requestor_id | requestor_role | resource_id | name  | category | phone      | email         | alert_url      | alert_preference | status_poll_url | 
  | healthngo1   | healthworker   | 54321       |practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com | 
  

@unit @Negativeregression  
Scenario Outline: Update a resource for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for a resource with Id "<resource_id>" to update a resource details like "<name>" for "<category>" with "<phone>" "<email>"  "<alert_url>" "<alert_preference>" and "<status_poll_url>"
When an Update request for an endpoint /resource/modifications/ is triggered to update existing resource for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
  | requestor_id | requestor_role | resource_id | name   | category | phone      | email         | alert_url      | alert_preference | status_poll_url | status_code |
  | healthngo1   | healthworker   | 54321       | practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com | 400         |
  | healthngo1   | healthworker   | 67890       | practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com | 403         |
  | healthngo1   | healthworker   | 67890       | practo | hospital | 9980555504 | abc@gmail.com | psrk@gmail.com | phone            | www.doctor1.com | 404         |
  
  

