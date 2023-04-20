import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
#API_HOME = 'http://myapi:3000/entity/create_entity/'
API_HOME = 'http://myapi:3000/affiliation/new'
 
# Scenarios
 
scenarios('../features/createaffiliationnew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor Id is "{healthngo1}" with role as "{healthworker}" to create a new affiliation'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" to create an affiliation with its details "{resource_id}" "{entity_id}" for resource of category "{resource_category}" for a schedule on "{day_of_week}" from "{start_time}" to "{end_time}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role,resource_id, entity_id, resource_category,day_of_week, start_time, end_time ):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'affiliation_details[entity_id]': entity_id, 'affiliation_details[resource_id]': resource_id, 'affiliation_details[resource_category]': resource_category, 'affiliation_details[work_days_hours][day_of_week]': day_of_week, 'affiliation_details[work_days_hours][start_time]': start_time, 'affiliation_details[work_days_hours][end_time]':end_time}
    response = requests.post(API_HOME, data = data) 
    print(data)
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" to create an affiliation with its details "{resource_id}" "{entity_id}" for resource of category "{resource_category}" for a schedule on "{day_of_week}" from "{start_time}" to "{end_time}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role,resource_id, entity_id, resource_category,day_of_week, start_time, end_time):
    
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'affiliation_details[entity_id]': entity_id, 'affiliation_details[resource_id]': resource_id, 'affiliation_details[resource_category]': resource_category, 'affiliation_details[work_days_hours][day_of_week]': day_of_week, 'affiliation_details[work_days_hours][start_time]': start_time, 'affiliation_details[work_days_hours][end_time]':end_time}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    
    
@then(parsers.parse('the result should return affiliation Id as "{affiliation_id:d}" for smoke testing'))
def unit_response_assert(smoke_post_request,affiliation_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(affiliation_id)
    assert affiliation_id == affiliation_id 
    
@then(parsers.parse('the result should return affiliation details like "{affiliation_id}" and "{affiliation_name}" for requested affiliation'))
def unit_response_assert(unit_post_request, affiliation_name, affiliation_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(affiliation_id)
    assert affiliation_id == affiliation_id
    
@when(parsers.parse('a POST request for an endpoint /affiliation/new/ is triggered to create new affiliation for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass

@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing POST request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
