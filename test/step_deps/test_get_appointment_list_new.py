import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/appointment/list_details/'
 
# Scenarios
 
scenarios('../features/getappointmentlistnew.feature')
 
# Fixtures
 


@pytest.fixture


#@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an appointment_id "{appointment_id}" for smoke testing'), target_fixture = 'smoke_get_request')
@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an appointment_id "{appointment_id}" for smoke testing'),target_fixture = 'smoke_get_request')
def smoke_get_request(requestor_id, requestor_role,appointment_id ):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'appointment_id': appointment_id}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
    #assert find_free_subscribers_response_code.status_code == code

@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an appointment_id "{appointment_id}" with details filter for "{filter_appointment_id}" and requesting for appointment details for "{required_event_type}" "{required_event_id}" "{required_appointment_id}" "{required_participant_type}" "{required_participant_id}" "{required_From}" and "{required_To}"'), target_fixture = 'unit_get_request')
def unit_get_request(requestor_id, requestor_role, appointment_id, filter_appointment_id, required_event_type, required_event_id, required_appointment_id, required_participant_type,required_participant_id, required_From, required_To):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'appointment_id': appointment_id, 'appointment_filter[appointment_id]': filter_appointment_id, 'appointment_details_required[event_type]': required_event_type,'appointment_details_required[event_id]': required_event_id,'appointment_details_required[appointment_id]': required_appointment_id,'appointment_details_required[participant_id]': required_participant_id,'appointment_details_required[participant_type]': required_participant_type,'appointment_details_required[From]': required_From, 'appointment_details_required[To]':required_To}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response


@given(parsers.parse('the invalid inputs for the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an appointment_id "{appointment_id}" with details filter for "{filter_appointment_id}" and requesting for appointment details for "{required_event_type}" "{required_event_id}" "{required_appointment_id}" "{required_participant_type}" "{required_participant_id}" "{required_From}" and "{required_To}"'), target_fixture = 'neg_get_request')
def neg_get_request(requestor_id, requestor_role, appointment_id, filter_appointment_id, required_event_type, required_event_id, required_appointment_id, required_participant_type,required_participant_id, required_From, required_To):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'appointment_id': appointment_id, 'appointment_filter[appointment_id]': filter_appointment_id, 'appointment_details_required[event_type]': required_event_type,'appointment_details_required[event_id]': required_event_id,'appointment_details_required[appointment_id]': required_appointment_id,'appointment_details_required[participant_id]': required_participant_id,'appointment_details_required[participant_type]': required_participant_type,'appointment_details_required[From]': required_From, 'appointment_details_required[To]':required_To}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
	
	
@when(parsers.parse('a GET request for an endpoint /appointment/list_details/ is triggered to get details of a appointment list'), target_fixture='get_request')
def get_request():
    pass




@then(parsers.parse('the result should return following details of entity with its name "{appointment_id}" "{event_type}" "{event_id}" "{participant_type}" "{participant_id}" "{appointment_id}" "{From}" and "{To}"'))
def unit_get_response_assert(unit_get_request, appointment_id, event_id, event_type, participant_id,participant_type, From, To ):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_get_request.json()   
    print(assert_response)
    print(type(assert_response))
    print(assert_response[0][0]['details']['participant_type'])
    #print(assert_response[1])
    #for i in range(len(assert_response)):
    #     print((i, assert_response[i])) 
    assert assert_response[0][0]['details']['participant_type'] == 'subscriber'   


@then(parsers.parse('response code of GET request is "{code:d}" for smoke testing'))
def smoke_get_response_code(smoke_get_request, code):
    assert smoke_get_request.status_code == code

@then(parsers.parse('response code of GET request is "{code:d}"'))
def unit_get_response_code(unit_get_request, code):
    assert unit_get_request.status_code == code



@then(parsers.parse('response code of negative testing GET request for invalid data is "{status_code}"'))
def neg_get_response_code(neg_get_request, status_code):
    assert neg_get_request.status_code != eval(status_code)


