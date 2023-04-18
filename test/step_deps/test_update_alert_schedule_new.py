import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/alert_schedule/modifications/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updatealertschedulenew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor id is "{healthngo1}" with role as "{healthworker}" to update an alert schedule with its ID "{alert_schedule_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,alert_schedule_id):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker,'alert_schedule_id':alert_schedule_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" for an alert schedule with Id "{alert_schedule_id}" to update an alert with its details like "{event_id}" for "{target_category}" with "{message_id}" within a "{alert_datetime}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_id, requestor_role,alert_schedule_id, event_id,target_category,message_id,alert_datetime):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'alert_schedule_id': alert_schedule_id,'alert_schedule_details[event_id]': event_id, 'alert_schedule_details[target_category]': target_category, 'alert_schedule_details[message_id]': message_id, 'alert_schedule_details[alert_datetime]': alert_datetime}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" for an alert schedule with Id "{alert_schedule_id}" to update an alert with its details like "{event_id}" for "{target_category}" with "{message_id}" within a "{alert_datetime}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_id, requestor_role,alert_schedule_id, event_id,target_category,message_id,alert_datetime):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'alert_schedule_id': alert_schedule_id,'alert_schedule_details[event_id]': event_id, 'alert_schedule_details[target_category]': target_category, 'alert_schedule_details[message_id]': message_id, 'alert_schedule_details[alert_datetime]': alert_datetime}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /alert_schedule/modifications/ is triggered to update existing alert schedule for scheduler block'), target_fixture = 'post_request')
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
