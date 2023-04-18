Feature: Create a new Alert Schedule for Management of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new Alert Schedule for Management of Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new alert schedule
When a POST request for an endpoint /alert_schedule/new/ is triggered to create new alert schedule for scheduler block      
Then the result should return alert schedule Id as "1" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new Alert Schedule for Management of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a new alert schedule with event "<event_id>" for "<target_category>" with "<message_id>" within a "<alert_datetime>"
When a POST request for an endpoint /alert_schedule/new/ is triggered to create new alert schedule for scheduler block
Then the result should return alert details like "<alert_schedule_name>" and "<alert_schedule_id>" for requested schedule
And response code of POST request is "200"

Examples: 
  | requestor_id | requestor_role | event_id | target_category | message_id | alert_datetime      | alert_schedule_name | alert_schedule_id |
  | healthngo1   | healthworker   | 12345    | subscriber      | 1          | 2018-02-15T09:00:00 | xyz hospital        | 1                 |
  

@unit @Negativeregression  
Scenario Outline: Create a new Alert Schedule for Management of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a new alert schedule with event "<event_id>" for "<target_category>" with "<message_id>" within a "<alert_datetime>"
When a POST request for an endpoint /alert_schedule/new/ is triggered to create new alert schedule for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
  | requestor_id | requestor_role | event_id | target_category | message_id | alert_datetime     |  status_code |
  | healthngo1   | healthworker   | 12345    | subscriber      | 1          | 2018-02-15T09:00:00|  400         |
  | healthngo1   | healthworker   | 12345    | subscriber      | 1          | 2018-02-15T09:00:00|  403         |
  | healthngo1   | healthworker   |12345     | subscriber      | 1          | 2018-02-15T09:00:00|  404         |
  
