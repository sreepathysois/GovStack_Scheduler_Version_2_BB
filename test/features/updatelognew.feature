Feature: Update a log details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update a log details of Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update a log with its ID "1"
When an Update request for an endpoint /log/modifications/ is triggered to update existing log details for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update a log details of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for a log with Id "<log_id>" to update a log details for role "<logger_role>" with its Id "<logger_id>" "<entity_id>" for category "<log_category>" from time period of "<datetime>" with data as "<log_data>"
When an Update request for an endpoint /log/modifications/ is triggered to update existing log details for scheduler block 
Then response code of Update request is "200"

Examples: 
  | requestor_id | requestor_role | log_id | logger_role | logger_id | entity_id | log_category | datetime            | log_data                                                       | 
  | healthngo1   | healthworker   | 1      | resource    | 1         | 67890     | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | 

@unit @Negativeregression  
Scenario Outline: Update a log details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for a log with Id "<log_id>" to update a log details for role "<logger_role>" with its Id "<logger_id>" "<entity_id>" for category "<log_category>" from time period of "<datetime>" with data as "<log_data>"
When an Update request for an endpoint /log/modifications/ is triggered to update existing log details for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
  | requestor_id | requestor_role | log_id      | logger_role | logger_id | entity_id | log_category | datetime            | log_data                                                       | status_code |
  | healthngo1   | healthworker   | 54321       | resource    | 1         | 67890     | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | 400         |
  | healthngo1   | healthworker   | mylog       | 67890       | resource  | 1         | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | 403         |
  | healthngo1   | healthworker   | 67890       | 67890       |resource   | 67890     | attendence   | 2018-02-15T11:00:00 | event_id:12345,subscriber_id:1,token:a2s3x2fer,status:attended | 404         |
  
