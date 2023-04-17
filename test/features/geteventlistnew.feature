Feature: Get Event List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Event List Details for Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event_id "<event_id>" for smoke testing
When a GET request for an endpoint /event/list_details/ is triggered to get details of an event list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id | requestor_role | event_id    |
  | healthngo1       | healthworker   | 4524453535  |





@unit @happyregression  
Scenario Outline: Get Event List Details for  Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event_id "<event_id>" 
When a GET request for an endpoint /event/list_details/ is triggered to get details of an event list
Then the result should return following details of event with its name "<name>" "<category>" "<host_entity_id>" for a period "<From>" till "<To>" for a venue in "<street>" "<building>" "<area>" with "<lat>" "<long>"
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | event_id | name                | category                   | host_entity_id | From                |To                   | street | building | area         | lat | long |
  | healthngo1       | healthworker   | 4524453535| doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyx      | wilsongarden | 0.1 | 0.2  |
  

@unit @Negativeregression  
Scenario Outline: Get Event List Details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event_id "<event_id>" 
When a GET request for an endpoint /event/list_details/ is triggered to get details of an event list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id     | requestor_role | event_id    | status_code |
  | healthngo1       | healthworker   | myresource  | 400         |
  | healthngo1       | healthworker   | 4524453535  | 403         |
  | healthngo1       | healthworker   | 4524453535  | 404         |
