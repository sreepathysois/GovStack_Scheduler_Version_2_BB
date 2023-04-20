Feature: Create a new affiliation of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Create a new affiliation for Scheduler API Smoke Test   

Given the requestor Id is "healthngo1" with role as "healthworker" to create a new affiliation
When a POST request for an endpoint /affiliation/new/ is triggered to create new affiliation for scheduler block      
Then the result should return affiliation Id as "1" for smoke testing
And response code of POST request is "200" for smoke testing 



@unit @happyregression  
Scenario Outline: Create a new affiliation for Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" to create an affiliation with its details "<resource_id>" "<entity_id>" for resource of category "<resource_category>" for a schedule on "<day_of_week>" from "<start_time>" to "<end_time>"
When a POST request for an endpoint /affiliation/new/ is triggered to create new affiliation for scheduler block
Then the result should return affiliation details like "<affiliation_id>" and "<affiliation_name>" for requested affiliation
And response code of POST request is "200"

Examples: 
  | requestor_id | requestor_role | resource_id | entity_id | resource_category | day_of_week | start_time | end_time | affiliation_name | affiliation_id |
  | healthngo1   | healthworker   | 12345       | 67890     | physician         | monday      | 09:00:00   | 17:00:00 | xyz hospital     | 1              |
  

@unit @Negativeregression  
Scenario Outline: Create a new affiliation for Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" to create an affiliation with its details "<resource_id>" "<entity_id>" for resource of category "<resource_category>" for a schedule on "<day_of_week>" from "<start_time>" to "<end_time>"
When a POST request for an endpoint /affiliation/new/ is triggered to create new affiliation for scheduler block
Then response code of negative testing POST request for invalid data is "<status_code>"



Examples:
  | requestor_id | requestor_role | resource_id | entity_id | resource_category | day_of_week | start_time | end_time | status_code |
  | healthngo1   | healthworker   | 12345       | 67890     | physician         | monday      | 09:00:00   | 17:00:00 | 400         |
  | healthngo1   | healthworker   | 12345       | 67890     | physician         | monday      | 17:00:00   | 09:00:00 | 403         |
  | healthngo1   | healthworker   | resource    | 67890     | nurse             | monday      | 17:00:00   | 09:00:00 | 404         |
  
  
