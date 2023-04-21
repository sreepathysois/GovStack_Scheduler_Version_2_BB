Feature: Get Log List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Log List Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an log_id "<log_id>" for smoke testing
When a GET request for an endpoint /log/list_details/ is triggered to get details of a log list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | log_id    |
  | healthngo1       | healthworker   |     1     |





@unit @happyregression  
Scenario Outline: Get Log List Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a log_id "<log_id>" with details filter for "<filter_log_id>" and requesting for log details for "<required_category>" "<required_log_id>" "<required_entity_id>" "<required_From>" and "<required_To>"
When a GET request for an endpoint /log/list_details/ is triggered to get details of a log list
Then the result should return following details of entity with its name "<log_id>" "<category>" "<entity_id>" "<From>" and "<To>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | log_id | filter_log_id | required_category | required_log_id | required_entity_id | required_From | required_To | log_id | category   | entity_id | From                | To                  |
  | healthngo1   | healthworker   | 1      | 1             | true              | true            | true               | true          | true        | 1      | attendence | 67890     | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 |
  

@unit @Negativeregression  
Scenario Outline: Get Log List Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a log_id "<log_id>" with details filter for "<filter_log_id>" and requesting for log details for "<required_category>" "<required_log_id>" "<required_entity_id>" "<required_From>" and "<required_To>" 
When a GET request for an endpoint /log/list_details/ is triggered to get details of a log list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:   
  | requestor_id | requestor_role | log_id     | filter_log_id | required_category | required_log_id | required_entity_id | required_From | required_To | status_code |
  | healthngo1   | healthworker   | myresource | 4524453535    | false             | true            | true               | true          | true        | 400         |
  | healthngo1   | healthworker   | 4524453535 | 4524453535    | true              | true            | true               | true          | no          | 403         |
  | healthngo1   | healthworker   | 4524453535 | 4524453535    | true              | true            | true               | true          | yes         | 404         |




