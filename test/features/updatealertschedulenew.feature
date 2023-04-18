Feature: Update an Alert Schedule for Management of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update an Alert Schedule for Management of Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update an alert schedule with its ID "2"
When an Update request for an endpoint /alert_schedule/modifications/ is triggered to update existing alert schedule for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update an Alert Schedule for Management of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for an alert schedule with Id "<alert_schedule_id>" to update an alert with its details like "<event_id>" for "<target_category>" with "<message_id>" within a "<alert_datetime>"
When an Update request for an endpoint /alert_schedule/modifications/ is triggered to update existing alert schedule for scheduler block 
Then response code of Update request is "200"
Examples:
  
  Examples: 
  | requestor_id | requestor_role | alert_schedule_id | event_id | target_category | message_id | alert_datetime      | 
  | healthngo1   | healthworker   | 2                 | 12345    | subscriber      | 1          | 2018-02-15T09:00:00 | 
  

@unit @Negativeregression  
Scenario Outline: Update an Alert Schedule for Management of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for an alert schedule with Id "<alert_schedule_id>" to update an alert with its details like "<event_id>" for "<target_category>" with "<message_id>" within a "<alert_datetime>"
When an Update request for an endpoint /alert_schedule/modifications/ is triggered to update existing alert schedule for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
  | requestor_id | requestor_role | alert_schedule_id | event_id | target_category | message_id | alert_datetime      | status_code |
  | healthngo1   | healthworker   | 2                 | 12345    | subscriber      | 1          | 2018-02-15T09:00:00 | 400         |
  | healthngo1   | healthworker   | 1                 | 12345    | subscriber      | 1          | 2018-02-15T09:00:00 | 403         |
  | healthngo1   | healthworker   | 2                 | 12345    | subscriber      | 1          | 2018-02-15T09:00:00|  404         |
  
  

