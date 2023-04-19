Feature: Create a new Log of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new Log of Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new log
When a POST request for an endpoint /log/new/ is triggered to create new log for scheduler block      
Then the result should return log Id as "1" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new Log of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a log for role "<logger_role>" with its Id "<logger_id>" "<entity_id>" for category "<log_category>" from time period of "<datetime>" with data as "<log_data>"
When a POST request for an endpoint /log/new/ is triggered to create new log for scheduler block
Then the result should return log details like "<log_name>" and "<log_id>" for requested log
And response code of POST request is "200"

Examples: 
  | requestor_id | requestor_role | logger_role | logger_id | entity_id | log_category | datetime            | log_data                                                       | log_name     | log_id |
  | healthngo1   | healthworker   | resource    | 1         | 67890     | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | xyz hospital | 1      |
  

@unit @Negativeregression  
Scenario Outline: Create a new Log of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a log for role "<logger_role>" with its Id "<logger_id>" "<entity_id>" for category "<log_category>" from time period of "<datetime>" with data as "<log_data>"
When a POST request for an endpoint /log/new/ is triggered to create new log for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
  | requestor_id | requestor_role | logger_role | logger_id | entity_id | log_category | datetime            | log_data                                                       | status_code |
  | healthngo1   | healthworker   | resource    | 1         | 67890     | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | 400         |
  | healthngo1   | healthworker   | entity      | 67890     | 67890     | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | 403         |
  | healthngo1   | healthworker   | subscriber  |1          | 67890     | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | 404         |
