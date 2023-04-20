Feature: Create a new appointment of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new appointment of Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new appointment
When a POST request for an endpoint /appointment/new/ is triggered to create new appointment for scheduler block      
Then the result should return appointment Id as "67890" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new appointment of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a new appointment for an entity with "<entity_id>" and "<entity_type>" for participant of "<participant_type>" "<participant_id>" and "<participant_entity_id>" for a time period "<From>" till "<To>" with deadline "<deadline>"
When a POST request for an endpoint /appointment/new/ is triggered to create new appointment for scheduler block
Then the result should return appointment details like "<appointment_id>" and "<appointment_name>" for requested appointment
And response code of POST request is "200"

Examples: 
  | requestor_id | requestor_role | entity_id | entity_type         | participant_type | participant_id | participant_entity_id | From                | To                  | deadline            | appointment_name   | appointment_id |
  | healthngo1   | healthworker   | 1         | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 | 2018-02-15T11:10:00 | doctorconsultation | 1              |
  

@unit @Negativeregression  
Scenario Outline: Create a new appointment of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create a new appointment for an entity with "<entity_id>" and "<entity_type>" for participant of "<participant_type>" "<participant_id>" and "<participant_entity_id>" for a time period "<From>" till "<To>" with deadline "<deadline>"
When a POST request for an endpoint /appointment/new/ is triggered to create new appointment for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
 | requestor_id | requestor_role | entity_id | entity_type         | participant_type | participant_id | participant_entity_id | From                | To                  | deadline            | status_code |
 | healthngo1   | healthworker   | 1         | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:00:00 | 2018-03-15T11:30:00 | 2018-02-15T11:10:00 | 400         |
 | healthngo1   | healthworker   | 1         | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:45:00 | 2018-02-15T11:30:00 | 2018-02-15T11:10:00 | 403         |
 | healthngo1   | healthworker   | 1         | doctor_consultation | subscriber       | 12345          | 67890                 | 2018-02-15T11:00:00 | 2018-07-15T11:30:00 | 2018-02-15T11:10:00 | 404         |
