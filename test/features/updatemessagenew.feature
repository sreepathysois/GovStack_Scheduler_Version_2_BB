Feature: Update a message of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update a message of Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update a message with its ID "1"
When an Update request for an endpoint /message/modifications/ is triggered to update existing message details for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update a message of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for a message with Id "<message_id>" to update a message details like "<entity_id>" "<category>" and "<message_body>"
When an Update request for an endpoint /message/modifications/ is triggered to update existing message details for scheduler block 
Then response code of Update request is "200"

Examples: 
  | requestor_id | requestor_role | message_id | entity_id | category | message_body                        | 
  | healthngo1   | healthworker   | 1          | 67890     | reminder | you have a doctor consultatio today | 
  

@unit @Negativeregression  
Scenario Outline: Update a message of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for a message with Id "<message_id>" to update a message details like "<entity_id>" "<category>" and "<message_body>"
When an Update request for an endpoint /message/modifications/ is triggered to update existing message details for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
  | requestor_id | requestor_role | message_id | entity_id | category  | message_body                        | status_code |
  | healthngo1   | healthworker   | 54321       | 67890     | reminder | you have a doctor consultatio today | 400         |
  | healthngo1   | healthworker   | 67890       | 67890     | reminder | you have a doctor consultatio today | 403         |
  | healthngo1   | healthworker   | 67890       | 67890     | reminder | you have a doctor consultatio today | 404         |
  
