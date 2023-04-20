Feature: Update an affiliation details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Update an affiliation details of Scheduler API Smoke Test   

Given the requestor id is "healthngo1" with role as "healthworker" to update an affiliation with its ID "1"
When an Update request for an endpoint /affiliation/modifications/ is triggered to update existing affiliation details for scheduler block      
Then response code of Update request is "200" for smoke testing



@unit @happyregression  
Scenario Outline: Update an affiliation details of Scheduler API Unit and Regression Happy Testing

Given the requestor id is "<requestor_id>" with role as "<requestor_role>" for an affiliation with Id "<affiliation_id>" to update an affiliation details like "<resource_id>" "<entity_id>" for resource of category "<resource_category>" for a schedule on "<day_of_week>" from "<start_time>" to "<end_time>"
When an Update request for an endpoint /affiliation/modifications/ is triggered to update existing affiliation details for scheduler block 
Then response code of Update request is "200"

Examples: 
  | requestor_id | requestor_role | affiliation_id | resource_id | entity_id | resource_category | day_of_week | start_time | end_time | 
  | healthngo1   | healthworker   | 1              | 12345       | 67890     | physician         | monday      | 09:00:00   | 17:00:00 | 


@unit @Negativeregression  
Scenario Outline: Update an affiliation details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor id is "<requestor_id>" with role as "<requestor_role>" for an affiliation with Id "<affiliation_id>" to update an affiliation details like "<resource_id>" "<entity_id>" for resource of category "<resource_category>" for a schedule on "<day_of_week>" from "<start_time>" to "<end_time>"
When an Update request for an endpoint /affiliation/modifications/ is triggered to update existing affiliation details for scheduler block
Then response code of negative testing an Update request for invalid data is "<status_code>"

Examples:
  | requestor_id | requestor_role | affiliation_id | resource_id | entity_id | resource_category | day_of_week | start_time | end_time | status_code |
  | healthngo1   | healthworker   | 0              | 12345       | 67890     | physician         | monday      | 09:00:00   | 17:00:00 | 400         |
  | healthngo1   | healthworker   | 333            | 12345       | 67890     | physician         | monday      | 17:00:00   | 09:00:00 | 403         |
  | healthngo1   | healthworker   | my             |resource     | 67890     | nurse             | monday      | 17:00:00   | 09:00:00 | 404         |
