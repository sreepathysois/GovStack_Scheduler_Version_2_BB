Feature: Get Alert List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Alert List Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an alert_schedule_id "<alert_schedule_id>" for smoke testing
When a GET request for an endpoint /alert_schedule/list_details/ is triggered to get details of an alert schedule list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | alert_schedule_id    |
  | healthngo1       | healthworker   | 1                    |





@unit @happyregression  
Scenario Outline: Get Alert List Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an alert schedule list  with details filter for "<filter_alert_schedule_id>" and requesting for alert schedule details for "<required_target_category>" "<required_entity_id>" "<required_alert_schedule_id>" and "<required_message_id>"
When a GET request for an endpoint /alert_schedule/list_details/ is triggered to get details of an alert schedule list
Then the result should return following details of entity with its name "<entity_id>" "<target_category>" "<alert_schedule_id>" and "<message_id>"
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | filter_alert_schedule_id | required_target_category | required_entity_id | required_alert_schedule_id | required_message_id | target_category | entity_id | alert_schedule_id | message_id |  
  | healthngo1   | healthworker   | 1                        | true                     | true               | true                       | true                | subscriber      | 67890     | 1                 | 1          |

@unit @Negativeregression  
Scenario Outline: Get Alert List Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an alert schedule list  with details filter for "<filter_alert_schedule_id>" and requesting for alert schedule details for "<required_target_category>" "<required_entity_id>" "<required_alert_schedule_id>" and "<required_message_id>" 
When a GET request for an endpoint /alert_schedule/list_details/ is triggered to get details of an alert schedule list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id | requestor_role | filter_alert_schedule_id | required_target_category | required_entity_id | required_alert_schedule_id  | required_message_id |  status_code  |
  | healthngo1   | healthworker   | myresource               | true                     | false              | false                    | true                |  400          |
  | healthngo1   | healthworker   | 4524453535               | false                    | true               | true                     | true                |  403          |
  | healthngo1   | healthworker   | 4524453535               | no                       | true               | true                     | true                |  404          |




