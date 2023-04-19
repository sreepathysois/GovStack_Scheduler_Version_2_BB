import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/log/modifications/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updatelognew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor id is "{healthngo1}" with role as "{healthworker}" to update a log with its ID "{log_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,log_id):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker,'log_id':log_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" for a log with Id "{log_id}" to update a log details for role "{logger_role}" with its Id "{logger_id}" "{entity_id}" for category "{log_category}" from time period of "{datetime}" with data as "{log_data}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_id, requestor_role, log_id,logger_role, logger_id, entity_id, log_category, datetime, log_data):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'log_id': log_id, 'details[logger_role]': logger_role, 'details[logger_id]': logger_id, 'details[entity_id]': entity_id, 'details[log_category]':log_category,'details[datetime]':datetime,'details[log_data]':log_data}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" for a log with Id "{log_id}" to update a log details for role "{logger_role}" with its Id "{logger_id}" "{entity_id}" for category "{log_category}" from time period of "{datetime}" with data as "{log_data}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_id, requestor_role, log_id,logger_role, logger_id, entity_id, log_category, datetime, log_data):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'log_id': log_id, 'details[logger_role]': logger_role, 'details[logger_id]': logger_id, 'details[entity_id]': entity_id, 'details[log_category]':log_category,'details[datetime]':datetime,'details[log_data]':log_data}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /log/modifications/ is triggered to update existing log details for scheduler block'), target_fixture = 'post_request')
def put_request():
    pass


@then(parsers.parse('response code of Update request is "{code:d}" for smoke testing'))
def smoke_put_response_code(smoke_put_request, code):
    assert smoke_put_request.status_code == code	

@then(parsers.parse('response code of Update request is "{code:d}"'))
def unit_put_response_code(unit_put_request, code):
    assert unit_put_request.status_code == code	


@then(parsers.parse('response code of negative testing an Update request for invalid data is "{status_code}"'))
def neg_put_response_code(neg_put_request, status_code):
    assert neg_put_request.status_code != eval(status_code)
