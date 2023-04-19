Feature: Get Alert Schedule List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Alert Schedule List Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an alert_schedule_id "<alert_schedule_id>" for smoke testing
When a GET request for an endpoint /alert_schedule/list_details/ is triggered to get details of an alert schedule list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | alert_schedule_id    |
  | healthngo1       | healthworker   | 1                    |





@unit @happyregression  
Scenario Outline: Get Alert Schedule List Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an alert_schedule_id "<alert_schedule_id>" 
When a GET request for an endpoint /alert_schedule/list_details/ is triggered to get details of an alert schedule list
Then the result should return following list of alert schedule with its details like "<event_id>" "<target_category>" "<message_id>" "<alert_datetime>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | alert_schedule_id | event_id | target_category | message_id | alert_datetime      |
  | healthngo1   | healthworker   | 1                 | 12345    | subscriber      | 1          | 2018-02-15T09:00:00 |
  

@unit @Negativeregression  
Scenario Outline: Get Alert Schedule List Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an alert_schedule_id "<alert_schedule_id>" 
When a GET request for an endpoint /alert_schedule/list_details/ is triggered to get details of an alert schedule list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id     | requestor_role | alert_schedule_id   | status_code |
  | healthngo1       | healthworker   | myresource          | 400         |
  | healthngo1       | healthworker   | 4524453535          | 403         |
  | healthngo1       | healthworker   | 4524453535          | 404         |
