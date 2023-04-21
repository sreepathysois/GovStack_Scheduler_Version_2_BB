Feature: Get Resource List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Resource List Details for Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an resource_id "<resource_id>" for smoke testing
When a GET request for an endpoint /resource/list_details/ is triggered to get details of a resources list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | resource_id    |
  | healthngo1       | healthworker   | 54321          |





@unit @happyregression  
Scenario Outline: Get Resource List Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an resource_id "<resource_id>" with details filter for "<filter_resource_id>" and requesting for resource details for "<required_category>" "<required_resource_id>" "<required_name>" and "<required_email>"
When a GET request for an endpoint /resource/list_details/ is triggered to get details of a resources list
Then the result should return following details of entity with its name "<name>" "<category>" "<resource_id>" "<phone>" and "<email>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | resource_id | filter_resource_id | required_category | required_resource_id | required_name | required_email | name               | category                   | resource_id | phone      | email         | 
  | healthngo1   | healthworker   | 54321       |54321               | true              | true               | true          | true           |doctor_consultation | opd_physician_consultation | 54321       | 9980555504 | abc@gmail.com | 
  

@unit @Negativeregression  
Scenario Outline: Get Resource List Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an resource_id "<resource_id>" with details filter for "<filter_resource_id>" and requesting for resource details for "<required_category>" "<required_resource_id>" "<required_name>" and "<required_email>" 
When a GET request for an endpoint /resource/list_details/ is triggered to get details of a resources list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id | requestor_role | resource_id | filter_resource_id | required_category | required_resource_id | required_name | required_phone | required_email | status_code |
  | healthngo1   | healthworker   | myresource  | 4524453535         | false             | true                 | true          | true           | true           | 400         |
  | healthngo1   | healthworker   | 4524453535  | 4524453535         | true              | true                 | true          | true           | false          | 403         |
  | healthngo1   | healthworker   | 4524453535  | 4524453535         | true              | true                 | true          | true           | yes            | 404         |




