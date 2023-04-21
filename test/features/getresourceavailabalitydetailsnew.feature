Feature: Get Resource Availabality Details of Scheduler API

Gherkin feature files for GovStack Scheduler services

@smoke  
Scenario Outline: Get Resource Availabality Details of Scheduler API Smoke Test   

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an resource_id "<resource_id>" for smoke testing
When a GET request for an endpoint /resource/availabality/ is triggered to get details of a resource availabality list
Then response code of GET request is "200" for smoke testing



Examples:
  | requestor_id     | requestor_role | resource_id    |
  | healthngo1       | healthworker   | 1              |





@unit @happyregression  
Scenario Outline: Get Resource Availabality Details of Scheduler API Unit and Regression Happy Testing

Given the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an resource_id "<resource_id>" with entity Id "<Entity_id>" for category "<category>" for a date period from "<From>" to "<To>"
When a GET request for an endpoint /resource/availabality/ is triggered to get details of a resource availabality list
Then the result should return following details of entity with its name "<resource_id>" "<resource_name>"  and "<free_slots>" 
And response code of GET request is "200"

Examples:
  | requestor_id | requestor_role | resource_id | Entity_id | category | From                | To                  | resource_id | resource_name | free_slots                                                                                  |
  | healthngo1   | healthworker   | 1           | 67890     | doctor   | 2018-02-14T09:00:00 | 2018-02-18T13:30:00 | 1           | abc           | [2018-02-15T11:00:00to2018-02-15T11:09:00:00],[2018-02-22T11:00:00to2018-02-22T11:17:00:00] |         
  

@unit @Negativeregression  
Scenario Outline: Get Resource Availabality Details of Scheduler API Unit and Regression Negative Testing

Given the invalid inputs for the requestor Id is "<requestor_id>" with role as "<requestor_role>" for an resource_id "<resource_id>" with entity Id "<Entity_id>" for category "<category>" for a date period from "<From>" to "<To>" 
When a GET request for an endpoint /resource/availabality/ is triggered to get details of a resource availabality list
Then response code of negative testing GET request for invalid data is "<status_code>"
 


Examples:
  | requestor_id | requestor_role | resource_id | Entity_id | category | From                | To                     | status_code |
  | healthngo1   | healthworker   | myresource  | 4524453535| lawyer   | 2018-02-18T13:30:00 | 2018-02-14T09:00:00    | 400         |
  | healthngo1   | healthworker   | 4524453535  | 4524453535| doctor   | 2018-02-18T13:30:00 | 2018-02-14T09:00:00    | 403         |
  | healthngo1   | healthworker   | 4524453535  | 4524453535| academician | 2018-02-18T13:30:00 | 2018-02-14T09:00:00 | 404         |




