Feature: Get Message List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Message List Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an message_id "<message_id>" for smoke testing
When a GET request for an endpoint /message/list_details/ is triggered to get details of a messages list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | message_id    |
  | healthngo1       | healthworker   |     1         |





@unit @happyregression  
Scenario Outline: Get Message List Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a message_id "<message_id>" with details filter for "<filter_message_id>" and requesting for message details for "<required_category>" "<required_message_id>" "<required_entity_id>" and "<required_message_body>"
When a GET request for an endpoint /message/list_details/ is triggered to get details of a messages list
Then the result should return following details of entity with its name "<message_id>" "<category>" "<entity_id>" and "<message_body>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | message_id | filter_message_id | required_category | required_message_id | required_entity_id | required_message_body | message_id  | category    | entity_id | message_body                       | 
  | healthngo1   | healthworker   |    1       |    1              | true              | true                | true               | true                  |1            | reminder    | 1         | you have doctor consultation today | 
  

@unit @Negativeregression  
Scenario Outline: Get Message List Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a message_id "<message_id>" with details filter for "<filter_message_id>" and requesting for message details for "<required_category>" "<required_message_id>" "<required_entity_id>" and "<required_message_body>" 
When a GET request for an endpoint /message/list_details/ is triggered to get details of a messages list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id | requestor_role | message_id | filter_message_id | required_category | required_message_id | required_entity_id | required_message_body | status_code |
  | healthngo1   | healthworker   | myresource | 4524453535        | false             | true                | true               | true                  | 400         |
  | healthngo1   | healthworker   | 4524453535 | 4524453535        | true              | true                | true               | true                  | 403         |
  | healthngo1   | healthworker   | 4524453535 | 4524453535        | true              | true                | true               | true                  | 404         |




