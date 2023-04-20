import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/appointment/modifications/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updateappointmentnew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor id is "{healthngo1}" with role as "{healthworker}" to update an appointment details with its ID "{appointment_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,appointment_id):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker,'appointment_id':appointment_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" for an appointment with Id "{appointment_id}" to update an appointment with its details like "{entity_id}" and "{entity_type}" for participant of "{participant_type}" "{participant_id}" and "{participant_entity_id}" for a time period "{From}" till "{To}" with deadline "{deadline}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_id, requestor_role, appointment_id,entity_id, entity_type, participant_type, participant_id, participant_entity_id, From, To, deadline):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'appointment_id': appointment_id, 'details[entity_id]': entity_id, 'details[entity_type]': entity_type, 'details[participant_type]': participant_type, 'details[participant_id]': participant_id, 'details[participant_entity_id]': participant_entity_id, 'details[From]':From,'details[To]':To, 'details[deadline]': deadline}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" for an appointment with Id "{appointment_id}" to update an appointment with its details like "{entity_id}" and "{entity_type}" for participant of "{participant_type}" "{participant_id}" and "{participant_entity_id}" for a time period "{From}" till "{To}" with deadline "{deadline}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_id, requestor_role, appointment_id,entity_id, entity_type, participant_type, participant_id, participant_entity_id, From, To, deadline):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'appointment_id': appointment_id, 'details[entity_id]': entity_id, 'details[entity_type]': entity_type, 'details[participant_type]': participant_type, 'details[participant_id]': participant_id, 'details[participant_entity_id]': participant_entity_id, 'details[From]':From,'details[To]':To, 'details[deadline]': deadline}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /appointment/modifications/ is triggered to update existing appointment details for scheduler block'), target_fixture = 'post_request')
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
