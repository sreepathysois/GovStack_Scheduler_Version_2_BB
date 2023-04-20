Feature: Update an appointment details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update an appointment details for Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update an appointment details with its ID "4524453535"
When an Update request for an endpoint /appointment/modifications/ is triggered to update existing appointment details for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update an appointment details for Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for an appointment with Id "<appointment_id>" to update an appointment with its details like "<entity_id>" and "<entity_type>" for participant of "<participant_type>" "<participant_id>" and "<participant_entity_id>" for a time period "<From>" till "<To>" with deadline "<deadline>"
When an Update request for an endpoint /appointment/modifications/ is triggered to update existing appointment details for scheduler block 
Then response code of Update request is "200"

Examples: 
  | requestor_id | requestor_role | appointment_id | entity_id | entity_type         | participant_type | participant_id | participant_entity_id | From                | To                  | deadline            | 
  | healthngo1   | healthworker   | 1              |1          | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 2018-02-15T11:10:00 | 

@unit @Negativeregression  
Scenario Outline: Update an appointment details for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for an appointment with Id "<appointment_id>" to update an appointment with its details like "<entity_id>" and "<entity_type>" for participant of "<participant_type>" "<participant_id>" and "<participant_entity_id>" for a time period "<From>" till "<To>" with deadline "<deadline>"
When an Update request for an endpoint /appointment/modifications/ is triggered to update existing appointment details for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
 | requestor_id | requestor_role | appointment_id | entity_id | entity_type         | participant_type | participant_id | participant_entity_id | From                | To                  | deadline            | status_code |
 | healthngo1   | healthworker   | 3456           | 1         | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:00:00 | 2018-03-15T11:30:00 | 2018-02-15T11:10:00 | 400         |
 | healthngo1   | healthworker   | 1              | 1         | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:45:00 | 2018-02-15T11:30:00 | 2018-02-15T11:10:00 | 403         |
 | healthngo1   | healthworker   | 12345          |1          | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:00:00 | 2018-07-15T11:30:00 | 2018-02-15T11:10:00 | 404         |
  
  

