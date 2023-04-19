Feature: Create a new message of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new message of Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new message
When a POST request for an endpoint /message/new/ is triggered to create new message for scheduler block      
Then the result should return message Id as "1" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new message of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a message with details like "<entity_id>" "<category>" with message body as "<message_body>" 
When a POST request for an endpoint /message/new/ is triggered to create new message for scheduler block
Then the result should return message details like "<message_name>" and "<message_id>" for requested message
And response code of POST request is "200"

Examples: 
  | requestor_id | requestor_role | entity_id | category | message_body                        | message_name | message_id |
  | healthngo1   | healthworker   | 67890     | reminder | you have a doctor consultatio today | xyz hospital | 1          |
  

@unit @Negativeregression  
Scenario Outline: Create a new message of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a message with details like "<entity_id>" "<category>" with message body as "<message_body>"
When a POST request for an endpoint /message/new/ is triggered to create new message for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
  | requestor_id | requestor_role | entity_id | category    | message_body                        |  status_code |
  | healthngo1   | healthworker   | 67890     | reminder    | you have a doctor consultatio today |  400         |
  | healthngo1   | healthworker   | 67890     | appointment | you have a doctor consultatio today |  403         |
  | healthngo1   | healthworker   | 67890     | invite      | you have a doctor consultatio today |  404         |
  
  
