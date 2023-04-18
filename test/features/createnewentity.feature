Feature: Create a new entity of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new entity for Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new entity
When a POST request for an endpoint /entity/new/ is triggered to create new entity for scheduler block      
Then the result should return entity Id as "67890" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new entity for Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a entity with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<website>"
When a POST request for an endpoint /entity/new/ is triggered to create new entity for scheduler block
Then the result should return entity details like "<entity_id>" and "<entity_name>" for requested entity
And response code of POST request is "200"

Examples: 
  | requestor_id     | requestor_role | name       | category |phone           | email         | website     | entity_name    | entity_id | 
  | healthngo1       | healthworker   | practo     | hospital | 9980555504     | abc@gmail.com | www.abc.com | hospital       | 67890     | 
  

@unit @Negativeregression  
Scenario Outline: Create a new entity for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a entity with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<website>"
When a POST request for an endpoint /entity/new/ is triggered to create new entity for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
  | requestor_id | requestor_role | name   | category    | phone      | email          | website          |  status_code |
  | healthngo1   | healthworker   | practo | hospital    | 9980555504 | sree@gmail.com | http://alert.com |  400         |
  | healthngo1   | healthworker   | practo | education   | 9980555504 | sree@gmail.com | http://alert.com |  403         |
  | healthngo1   | healthworker   | practo | agriculture | 9980555504 | sree@gmail.com | http://alert.com |  404         |
  
