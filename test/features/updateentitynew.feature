Feature: Update an entity of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update an entity for Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update an entity with its ID "4524453535"
When an Update request for an endpoint /entity/modifications/ is triggered to update existing entity for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update an entity for Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for an entity with Id "<entity_id>" to update an entity with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<website>" 
When an Update request for an endpoint /entity/modifications/ is triggered to update existing entity for scheduler block 
Then response code of Update request is "200"
Examples:
  
  Examples: 
  | requestor_id | requestor_role | entity_id | name      | category | phone          | email         | website     | 
  | healthngo1   | healthworker   | 67890      |practo     | hospital | 9980555504     | abc@gmail.com | www.abc.com | 
  

@unit @Negativeregression  
Scenario Outline: Update an entity for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for an entity with Id "<entity_id>" to update an entity with name "<name>" for "<category>" with following details like "<phone>" "<email>" with "<website>"
When an Update request for an endpoint /entity/modifications/ is triggered to update existing entity for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
  | requestor_id | requestor_role | entity_id | name   | category   | phone        | email          | website          | status_code |
  | healthngo1   | healthworker   | 67890     | practo | hospital   | 9980555504   | sree@gmail.com | http://alert.com | 400         |
  | healthngo1   | healthworker   | 67890     | practo | education  | 9980555504   | sree@gmail.com | http://alert.com | 403         |
  | healthngo1   | healthworker   | 67890     | practo | agriculture| 9980555504   | sree@gmail.com | http://alert.com | 404         |
  
  

