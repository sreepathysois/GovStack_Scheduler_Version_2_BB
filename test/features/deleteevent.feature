Feature: Delete an Event of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Delete an Event for Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event_id "<event_id>" for smoke testing 
When a Delete request for an endpoint /event is triggered to delete an event for scheduler block      
Then response code of Delete request is "200" for smoke testing


Examples:
  | requestor_id     | requestor_role | event_id    |
  | healthngo1       | healthworker   | 4524453535  |

@unit @happyregression  
Scenario Outline: Delete an Event for Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event with eventId "<event_id>" 
When a Delete request for an endpoint /event is triggered to delete an event for scheduler block  
Then response code of Delete request is "200"

Examples:
 | requestor_id          | requestor_role | event_id | 
 | healthngoadmin1       | Organizer      | 12345    | 
  

@unit @Negativeregression  
Scenario Outline: Delete an Event for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an event with eventId "<event_id>"
When a Delete request for an endpoint /event is triggered to delete an event for scheduler block
Then response code of negative testing Delete request for invalid data is "<status_code>"


Examples:
  | requestor_id | requestor_role | event_id   | status_code |
  | healthngo1   | healthworker   | 4524453535 | 400         |
  | healthngo1   | healthworker   | 4524453535 | 403         |
  | healthngo1   | healthworker   | 4524453535 | 404         |
  

