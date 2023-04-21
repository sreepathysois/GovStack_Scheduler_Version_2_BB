Feature: Get Subscriber List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Subscriber List Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a subscriber_id "<subscriber_id>" for smoke testing
When a GET request for an endpoint /subscriber/list_details/ is triggered to get details of a subscribers list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | subscriber_id    |
  | healthngo1       | healthworker   | 12345            |





@unit @happyregression  
Scenario Outline: Get Subscriber List Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a subscriber_id "<subscriber_id>" with details filter for "<filter_subscriber_id>" and requesting for subscriber details for "<required_category>" "<required_subscriber_id>" "<required_name>" "<required_phone>" and "<required_email>"
When a GET request for an endpoint /subscriber/list_details/ is triggered to get details of a subscribers list
Then the result should return following details of entity with its name "<name>" "<category>" "<resource_id>" "<phone>" and "<email>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | subscriber_id | filter_subscriber_id | required_category | required_subscriber_id | required_name | required_email | required_phone |  name  | category | resource_id | phone      | email         |
  | healthngo1   | healthworker   | 12345         | 12345              | true              | true                   | true          | true           | true           |abc     | patient  | 12345       | 9980555504 | abc@gmail.com | 
  

@unit @Negativeregression  
Scenario Outline: Get Subscriber List Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a subscriber_id "<subscriber_id>" with details filter for "<filter_subscriber_id>" and requesting for subscriber details for "<required_category>" "<required_subscriber_id>" "<required_name>" "<required_phone>" and "<required_email>" 
When a GET request for an endpoint /subscriber/list_details/ is triggered to get details of a subscribers list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id | requestor_role | subscriber_id | filter_subscriber_id | required_category | required_subscriber_id | required_name | required_phone | required_email | status_code |
  | healthngo1   | healthworker   | myresource    | 4524453535           | false             | true                   | true          | true           | true           | 400         |
  | healthngo1   | healthworker   | 4524453535    | 4524453535           | true              | true                   | true          | true           | false          | 403         |
  | healthngo1   | healthworker   | 4524453535    | 4524453535           | true              | true                   | true          | true           | yes            | 404         |




