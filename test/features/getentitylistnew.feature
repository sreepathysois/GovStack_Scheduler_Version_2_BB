Feature: Get Entity List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Entity List Details for Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an entity_id "<entity_id>" for smoke testing
When a GET request for an endpoint /entity/list_details/ is triggered to get details of an entity list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | entity_id    |
  | healthngo1       | healthworker   | 4524453535   |





@unit @happyregression  
Scenario Outline: Get Entity List Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an entity_id "<entity_id>" with details filter for "<filter_entity_id>" and requesting for entity details for "<required_category>" "<required_entity_id>" "required_name>" and "<required_email>"
When a GET request for an endpoint /entity/list_details/ is triggered to get details of an entity list
Then the result should return following details of entity with its name "<name>" "<category>" "<entity_id>" "<phone>" "<email>" and "<website>"
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | entity_id | filter_entity_id | required_category | required_entity_id | required_name | required_email | name               | category                   | entity_id | phone      | email         | website        |
  | healthngo1   | healthworker   | 4524453535| 4524453535       | true              | true               | true          | true           |doctor_consultation | opd_physician_consultation | 67890     | 9980555504 | abc@gmail.com | http://abc.com |
  

@unit @Negativeregression  
Scenario Outline: Get Entity List Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an entity_id "<entity_id>" with details filter for "<filter_entity_id>" and requesting for entity details for "<required_category>" "<required_entity_id>" "required_name>" and "<required_email>" 
When a GET request for an endpoint /entity/list_details/ is triggered to get details of an entity list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id     | requestor_role | entity_id   |filter_entity_id | required_category | required_entity_id | required_name | required_email | status_code |
  | healthngo1       | healthworker   | myresource  | 4524453535      | false             | true               | true          | true           | 400         |
  | healthngo1       | healthworker   | 4524453535  | 4524453535      | true              | true               | true          | true           | 403         |
  | healthngo1       | healthworker   | 4524453535  | 4524453535      | true              | true               | true          | true           | 404         |




