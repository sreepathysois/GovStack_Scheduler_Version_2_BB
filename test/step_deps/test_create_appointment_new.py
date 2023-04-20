import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
#API_HOME = 'http://myapi:3000/entity/create_entity/'
API_HOME = 'http://myapi:3000/appointment/new'
 
# Scenarios
 
scenarios('../features/createappointmentnew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor Id is "{healthngo1}" with role as "{healthworker}" to create a new appointment'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a new appointment for an entity with "{entity_id}" and "{entity_type}" for participant of "{participant_type}" "{participant_id}" and "{participant_entity_id}" for a time period "{From}" till "{To}" with deadline "{deadline}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role, entity_id, entity_type, participant_type, participant_id, participant_entity_id, From, To, deadline):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'appointment_details[entity_id]': entity_id, 'appointment_details[entity_type]': entity_type, 'appointment_details[participant_type]': participant_type, 'appointment_details[participant_id]': participant_id, 'appointment_details[participant_entity_id]': participant_entity_id, 'appointment_details[From]':From,'appointment_details[To]':To, 'appointment_details[deadline]': deadline}
    response = requests.post(API_HOME, data = data) 
    print(data)
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a new appointment for an entity with "{entity_id}" and "{entity_type}" for participant of "{participant_type}" "{participant_id}" and "{participant_entity_id}" for a time period "{From}" till "{To}" with deadline "{deadline}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role, entity_id, entity_type, participant_type, participant_id, participant_entity_id, From, To, deadline):
    
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'appointment_details[entity_id]': entity_id, 'appointment_details[entity_type]': entity_type, 'appointment_details[participant_type]': participant_type, 'appointment_details[participant_id]': participant_id, 'appointment_details[participant_entity_id]': participant_entity_id, 'appointment_details[From]':From,'appointment_details[To]':To, 'appointment_details[deadline]': deadline}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    
    
@then(parsers.parse('the result should return appointment Id as "{appointment_id:d}" for smoke testing'))
def unit_response_assert(smoke_post_request,appointment_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(appointment_id)
    assert appointment_id == appointment_id 
    
@then(parsers.parse('the result should return appointment details like "{appointment_id}" and "{appointment_name}" for requested appointment'))
def unit_response_assert(unit_post_request, appointment_name, appointment_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(appointment_id)
    assert appointment_id == appointment_id
    
@when(parsers.parse('a POST request for an endpoint /appointment/new/ is triggered to create new appointment for scheduler block'), target_fixture = 'post_request')
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
