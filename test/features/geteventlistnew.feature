Feature: Get Event List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Event List Details for Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event_id "<event_id>" for smoke testing
When a GET request for an endpoint /event/list_details/ is triggered to get details of an event list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | event_id    |
  | healthngo1       | healthworker   | 4524453535   |





@unit @happyregression  
Scenario Outline: Get Event List Details for Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event_id "<event_id>" with details filter for "<filter_event_id>" and requesting for event details for "<required_category>" "<required_host_entity_id>" "<required_name>" and "<required_venue>"
When a GET request for an endpoint /event/list_details/ is triggered to get details of an event list
Then the result should return following details of entity with its name "<name>" "<category>" "<event_id>" "<host_entity_id>" and "<venue>"
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | event_id | filter_event_id | required_category | required_host_entity_id | required_name | required_venue   | name                | category                   | event_id | host_entity_id | venue                                |
  | healthngo1   | healthworker   | 12345    | 12345           | true              | true                    | true          | true             | doctor_consultation | opd_physician_consultation | 12345    | 67890          | 7th Street, Wilson Garden, Bangalore |                                         
  

@unit @Negativeregression  
Scenario Outline: Get Event List Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event_id "<event_id>" with details filter for "<filter_event_id>" and requesting for event details for "<required_category>" "<required_host_entity_id>" "<required_name>" and "<required_venue>" 
When a GET request for an endpoint /event/list_details/ is triggered to get details of an event list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id     | requestor_role | event_id    | filter_event_id | required_category | required_host_entity_id | required_name | required_venue | status_code |
  | healthngo1       | healthworker   | myresource  | 4524453535      | false             | yes                     | true          | true           | 400         |
  | healthngo1       | healthworker   | 4524453535  | 4524453535      | true              | true                    | no            | true           | 403         |
  | healthngo1       | healthworker   | 4524453535  | 4524453535      | true              | false                   | true          | yes            | 404         |




