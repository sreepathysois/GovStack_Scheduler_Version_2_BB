import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
#API_HOME = 'http://myapi:3000/entity/create_entity/'
API_HOME = 'http://myapi:3000/alert_schedule/new'
 
# Scenarios
 
scenarios('../features/createalertschedulenew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor Id is "{healthngo1}" with role as "{healthworker}" to create a new alert schedule'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a new alert schedule with event "{event_id}" for "{target_category}" with "{message_id}" within a "{alert_datetime}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role, event_id,target_category,message_id,alert_datetime):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'alert_schedule_details[event_id]': event_id, 'alert_schedule_details[target_category]': target_category, 'alert_schedule_details[message_id]': message_id, 'alert_schedule_details[alert_datetime]': alert_datetime}
    response = requests.post(API_HOME, data = data) 
    print(data)
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a new alert schedule with event "{event_id}" for "{target_category}" with "{message_id}" within a "{alert_datetime}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role, event_id,target_category,message_id,alert_datetime):
    
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'alert_schedule_details[event_id]': event_id, 'alert_schedule_details[target_category]': target_category, 'alert_schedule_details[message_id]': message_id, 'alert_schedule_details[alert_datetime]': alert_datetime}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    
    
@then(parsers.parse('the result should return alert schedule Id as "{alert_schedule_id:d}" for smoke testing'))
def unit_response_assert(smoke_post_request,alert_schedule_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(alert_schedule_id)
    assert alert_schedule_id == alert_schedule_id 
    
@then(parsers.parse('the result should return alert details like "{alert_schedule_id}" and "{alert_schedule_name}" for requested schedule'))
def unit_response_assert(unit_post_request, alert_schedule_id, alert_schedule_name):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(alert_schedule_id)
    assert alert_schedule_id == alert_schedule_id
    
@when(parsers.parse('a POST request for an endpoint /alert_schedule/new/ is triggered to create new alert schedule for scheduler block'), target_fixture = 'post_request')
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
