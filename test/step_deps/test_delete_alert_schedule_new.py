import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/alert_schedule/'
#API_HOME = 'http://myapi:3000/session/create_session/'
 
# Scenarios
 
scenarios('../features/deletealertschedulenew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an alert_schedule_id "{alert_schedule_id:d}" for smoke testing'), target_fixture='smoke_post_request')
def smoke_post_request(requestor_id,requestor_role,alert_schedule_id):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'alert_schedule_id':alert_schedule_id}
    response = requests.delete(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an alert_schedule with alert_schedule_Id "{alert_schedule_id}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role, alert_schedule_id):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'alert_schedule': alert_schedule_id}
    response = requests.delete(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an alert_schedule with alert_schedule_Id "{alert_schedule_id}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role, alert_schedule_id):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'alert_schedule_id': alert_schedule_id}
    response = requests.delete(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('a Delete request for an endpoint /alert_schedule is triggered to delete an alert schedule for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass


@then(parsers.parse('response code of Delete request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of Delete request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing Delete request for invalid data is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	

