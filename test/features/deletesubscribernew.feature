Feature: Delete a subscriber of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Delete a subscriber for Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an subscriber_id "<subscriber_id>" for smoke testing 
When a Delete request for an endpoint /subscriber is triggered to delete a subscriber for scheduler block      
Then response code of Delete request is "200" for smoke testing


Examples:
  | requestor_id     | requestor_role | subscriber_id    |
  | healthngo1       | healthworker   | 12345            |

@unit @happyregression  
Scenario Outline: Delete a subscriber for Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a subscriber with subscriberId "<subscriber_id>" 
When a Delete request for an endpoint /subscriber is triggered to delete a subscriber for scheduler block  
Then response code of Delete request is "200"

Examples:
 | requestor_id          | requestor_role | subscriber_id | 
 | healthngoadmin1       | Organizer      | 12345         | 
  

@unit @Negativeregression  
Scenario Outline: Delete a subscriber for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a subscriber with subscriberId "<subscriber_id>"
When a Delete request for an endpoint /subscriber is triggered to delete a subscriber for scheduler block
Then response code of negative testing Delete request for invalid data is "<status_code>"


Examples:
  | requestor_id | requestor_role | subscriber_id  | status_code |
  | healthngo1   | healthworker   | 4524453535     | 400         |
  | healthngo1   | healthworker   | 4524453535     | 403         |
  | healthngo1   | healthworker   | 4524453535     | 404         |
  

