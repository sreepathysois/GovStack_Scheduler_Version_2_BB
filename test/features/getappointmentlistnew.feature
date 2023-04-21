Feature: Get Appointment List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Appointment List Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an appointment_id "<appointment_id>" for smoke testing
When a GET request for an endpoint /appointment/list_details/ is triggered to get details of a appointment list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | appointment_id    |
  | healthngo1       | healthworker   |     1             |





@unit @happyregression  
Scenario Outline: Get Appointment List Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an appointment_id "<appointment_id>" with details filter for "<filter_appointment_id>" and requesting for appointment details for "<required_event_type>" "<required_event_id>" "<required_appointment_id>" "<required_participant_type>" "<required_participant_id>" "<required_From>" and "<required_To>"
When a GET request for an endpoint /appointment/list_details/ is triggered to get details of a appointment list
Then the result should return following details of entity with its name "<appointment_id>" "<event_type>" "<event_id>" "<participant_type>" "<participant_id>" "<appointment_id>" "<From>" and "<To>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | appointment_id | filter_appointment_id | required_event_type | required_event_id | required_participant_type | required_participant_id | required_appointment_id | required_From | required_To | appointment_id | participant_type | participant_id | event_type          | event_id | From                | To                  |
  | healthngo1   | healthworker   | 1              | 1                     | true                | true              | true                     | true                    | true                    | true          | true        | 1              | subscriber       | 12345          | doctor_consultation |  1       | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 |
  

@unit @Negativeregression  
Scenario Outline: Get Appointment List Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an appointment_id "<appointment_id>" with details filter for "<filter_appointment_id>" and requesting for appointment details for "<required_event_type>" "<required_event_id>" "<required_appointment_id>" "<required_participant_type>" "<required_participant_id>" "<required_From>" and "<required_To>" 
When a GET request for an endpoint /appointment/list_details/ is triggered to get details of a appointment list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:   
  | requestor_id | requestor_role | appointment_id | filter_appointment_id | required_participant_type | required_participant_id | required_appointment_id | required_event_id | required_event_type | required_From | required_To | status_code |
  | healthngo1   | healthworker   | myresource     | 4524453535            | false                     | true                    | true                    | true              | true                | true          | yes         | 400         |
  | healthngo1   | healthworker   | 4524453535     | 4524453535            | true                      | yes                     | true                    | true              | true                | true          | true        | 403         |
  | healthngo1   | healthworker   | 4524453535     | 4524453535            | true                      | no                      | true                    | true              | true                | false         | yes         | 404         |




