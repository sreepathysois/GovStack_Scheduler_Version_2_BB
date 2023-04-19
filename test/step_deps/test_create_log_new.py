import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
#API_HOME = 'http://myapi:3000/entity/create_entity/'
API_HOME = 'http://myapi:3000/log/new'
 
# Scenarios
 
scenarios('../features/createlognew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor Id is "{healthngo1}" with role as "{healthworker}" to create a new log'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a log for role "{logger_role}" with its Id "{logger_id}" "{entity_id}" for category "{log_category}" from time period of "{datetime}" with data as "{log_data}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role, logger_role, logger_id, entity_id, log_category, datetime, log_data):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'log_details[logger_role]': logger_role, 'log_details[logger_id]': logger_id, 'log_details[entity_id]': entity_id, 'log_details[log_category]':log_category,'log_details[datetime]':datetime,'log_details[log_data]':log_data }
    response = requests.post(API_HOME, data = data) 
    print(data)
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a log for role "{logger_role}" with its Id "{logger_id}" "{entity_id}" for category "{log_category}" from time period of "{datetime}" with data as "{log_data}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role, logger_role, logger_id, entity_id, log_category, datetime, log_data):
    
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'log_details[logger_role]': logger_role, 'log_details[logger_id]': logger_id, 'log_details[entity_id]': entity_id, 'log_details[log_category]':log_category,'log_details[datetime]':datetime,'log_details[log_data]':log_data}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    
    
@then(parsers.parse('the result should return log Id as "{log_id:d}" for smoke testing'))
def unit_response_assert(smoke_post_request,log_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(log_id)
    assert log_id == log_id 
    
@then(parsers.parse('the result should return log details like "{log_name}" and "{log_id}" for requested log'))
def unit_response_assert(unit_post_request, log_name, log_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(log_id)
    assert log_id == log_id
    
@when(parsers.parse('a POST request for an endpoint /log/new/ is triggered to create new log for scheduler block'), target_fixture = 'post_request')
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
