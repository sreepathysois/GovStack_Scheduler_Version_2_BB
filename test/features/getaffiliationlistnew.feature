Feature: Get Affiliation List Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Affiliation List Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an affiliation_id "<affiliation_id>" for smoke testing
When a GET request for an endpoint /affiliation/list_details/ is triggered to get details of a affiliation list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | affiliation_id    |
  | healthngo1       | healthworker   |     1             |





@unit @happyregression  
Scenario Outline: Get Affiliation List Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a affiliation_id "<affiliation_id>" with details filter for "<filter_affiliation_id>" and requesting for affiliation details for "<required_category>" "<required_affiliation_id>" "<required_entity_id>" "<required_From>" and "<required_To>"
When a GET request for an endpoint /affiliation/list_details/ is triggered to get details of a affiliation list
Then the result should return following details of entity with its name "<affiliation_id>" "<category>" "<entity_id>" "<From>" and "<To>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | affiliation_id | filter_affiliation_id | required_category | required_affiliation_id | required_entity_id | required_From | required_To | affiliation_id | category   | entity_id | From                | To                  |
  | healthngo1   | healthworker   | 1              | 1                     | true              | true                    | true               | true          | true        | 1              | physician  | 67890     | 2018-02-15T11:00:00 | 2018-02-15T11:30:00 |
  

@unit @Negativeregression  
Scenario Outline: Get Affiliation List Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for a affiliation_id "<affiliation_id>" with details filter for "<filter_affiliation_id>" and requesting for affiliation details for "<required_category>" "<required_affiliation_id>" "<required_entity_id>" "<required_From>" and "<required_To>" 
When a GET request for an endpoint /affiliation/list_details/ is triggered to get details of a affiliation list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:   
  | requestor_id | requestor_role | affiliation_id     | filter_affiliation_id | required_category | required_affiliation_id | required_entity_id | required_From | required_To | status_code |
  | healthngo1   | healthworker   | myresource         | 4524453535            | false             | true                    | true               | true          | true        | 400         |
  | healthngo1   | healthworker   | 4524453535         | 4524453535            | true              | true                    | true               | true          | no          | 403         |
  | healthngo1   | healthworker   | 4524453535         | 4524453535            | true              | true                    | true               | true          | yes         | 404         |




