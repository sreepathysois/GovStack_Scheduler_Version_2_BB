Feature: Create a new event of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new event for Scheduler API Smoke Test   

Given the requestor is "healthngoadmin1" with role as "healthworker" to create a new event
When a POST request for an endpoint /event/new is triggered to create new event for scheduler block      
Then response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new event for Scheduler API Unit and Regression Happy Testing

Given the requestor is "<requestor_id>" with role as "healthworker" to create a new event with following details like "<name>" "<category>" "<host_entity_id>" for a period "<From>" till "<To>" for a venue in "<street>" "<building>" "<area>" with "<lat>" "<long>"
When a POST request for an endpoint /event/new is triggered to create new event for scheduler block
Then the result should return event details as "<event_name>" "<event_id>" for requested event
And response code of POST request is "200"


Examples:
  | requestor_id    | requestor_role | name | category | host_entity_id | From | To | street | building | area | lat | long | event_name | event_id |
  | healthngoadmin1 | healthworker   |doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyx      | wilsongarden | 0.1 | 0.2  |doctorconsultation | 4524458935 |              
  

@unit @Negativeregression  
Scenario Outline: Create a new event for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor is "<requestor_id>" with role as "healthworker" to create a new event with following details like "<name>" "<category>" "<host_entity_id>" for a period "<From>" till "<To>" for a venue in "<street>" "<building>" "<area>" with "<lat>" "<long>"
When a POST request for an endpoint /event/new is triggered to create new event for scheduler block
Then response code of negative testing POST request for error is "<status_code>"


Examples:
  | requestor_id    | requestor_role | name                | category                   | host_entity_id | From                | To                  | street | building | area    | lat | long | status_code |
  | healthngoadmin1 | healthworker   | doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyz      | manipal | 0.1 | 0.2  | 404         |
  | healthngoadmin1 | healthworker   | doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyz      | manipal | 0.1 | 0.2  | 403         |
  | healthngoadmin1 | healthworker   |doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyz      | manipal | 0.1 | 0.2  |400          |


