import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/affiliation/modifications/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updateaffiliationnew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor id is "{healthngo1}" with role as "{healthworker}" to update an affiliation with its ID "{affiliation_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,affiliation_id):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker,'affiliation_id':affiliation_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" for an affiliation with Id "{affiliation_id}" to update an affiliation details like "{resource_id}" "{entity_id}" for resource of category "{resource_category}" for a schedule on "{day_of_week}" from "{start_time}" to "{end_time}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_id, requestor_role,affiliation_id,resource_id, entity_id, resource_category,day_of_week, start_time, end_time):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'affiliation_id': affiliation_id,'details[entity_id]': entity_id, 'details[resource_id]': resource_id, 'details[resource_category]': resource_category, 'details[work_days_hours][day_of_week]': day_of_week, 'details[work_days_hours][start_time]': start_time, 'details[work_days_hours][end_time]':end_time}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" for an affiliation with Id "{affiliation_id}" to update an affiliation details like "{resource_id}" "{entity_id}" for resource of category "{resource_category}" for a schedule on "{day_of_week}" from "{start_time}" to "{end_time}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_id, requestor_role,affiliation_id,resource_id, entity_id, resource_category,day_of_week, start_time, end_time):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'affiliation_id': affiliation_id,'details[entity_id]': entity_id, 'details[resource_id]': resource_id, 'details[resource_category]': resource_category, 'details[work_days_hours][day_of_week]': day_of_week, 'details[work_days_hours][start_time]': start_time, 'details[work_days_hours][end_time]':end_time}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /affiliation/modifications/ is triggered to update existing affiliation details for scheduler block'), target_fixture = 'post_request')
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
