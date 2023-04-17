Feature: Update an event of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update an event for Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update an event with its ID "4524453535"
When an Update request for an endpoint /event/modifications/ is triggered to update existing event for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update an event for Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for an event with Id "<event_id>" to update an event with name "<name>" "<category>" "<host_entity_id>" for a period "<From>" till "<To>" for a venue in "<street>" "<building>" "<area>" with "<lat>" "<long>"
When an Update request for an endpoint /event/modifications/ is triggered to update existing event for scheduler block 
Then response code of Update request is "200"
Examples:
  
  Examples: 
  | requestor_id    | requestor_role | event_id   | name                | category                   | host_entity_id | From                | To                  | street | building | area         | lat | long | 
  | healthngoadmin1 | healthworker   | 4524458935 | doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyx      | wilsongarden | 0.1 | 0.2  |             
  

@unit @Negativeregression  
Scenario Outline: Update an event for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for an event with Id "<event_id>" to update an event with name "<name>" "<category>" "<host_entity_id>" for a period "<From>" till "<To>" for a venue in "<street>" "<building>" "<area>" with "<lat>" "<long>"
When an Update request for an endpoint /event/modifications/ is triggered to update existing event for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"


Examples:
  | requestor_id | requestor_role | event_id | name                | category                   | host_entity_id | From                | To                  | street | building | area         | lat | long | status_code |
  | healthngo1       | healthworker   | 4524453535| doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyx      | wilsongarden | 0.1 | 0.2  | 400         |
  | healthngo1       | healthworker   | 4524453535| doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyx      | wilsongarden | 0.1 | 0.2  | 403         |
  | healthngo1       | healthworker   | 4524453535| doctor_consultation | opd_physician_consultation | 67890          | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 7th    | xyx      | wilsongarden | 0.1 | 0.2  | 404         |
  

