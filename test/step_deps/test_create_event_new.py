import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
#API_HOME = 'http://myapi:3000/entity/create_entity/'
API_HOME = 'http://myapi:3000/event/new'
 
# Scenarios
 
scenarios('../features/createnewevent.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor is "{healthngoadmin1}" with role as "{healthworker}" to create a new event'), target_fixture='smoke_post_request')
def smoke_post_request(healthngoadmin1,healthworker):
    data = {'requestor_id': healthngoadmin1, 'requestor_role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor is "{requestor_id}" with role as "{requestor_role}" to create a new event with following details like "{name}" "{category}" "{host_entity_id}" for a period "{From}" till "{To}" for a venue in "{street}" "{building}" "{area}" with "{lat}" "{long}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role, name, category, host_entity_id, From, To, street, building, area, lat, long ):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'details[name]': name, 'details[category]': category, 'details[host_entity_id]': host_entity_id, 'details[From]': From, 'details[To]': To, 'details[venue][street]': street, 'details[venue][building]': building, 'details[venue][area]': area,'details[venue][lat]': lat, 'details[venue][long]': long}
    response = requests.post(API_HOME, data = data) 
    print(data)
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor is "{requestor_id}" with role as "{requestor_role}" to create a new event with following details like "{name}" "{category}" "{host_entity_id}" for a period "{From}" till "{To}" for a venue in "{street}" "{building}" "{area}" with "{lat}" "{long}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role, name, category, host_entity_id, From, To, street, building, area, lat, long):
    
    data = {'requestor_id': requestor_id,'requestor_role': requestor_role, 'details[name]': name, 'details[category]': category, 'details[host_entity_id]': host_entity_id, 'details[From]': From, 'details[To]': To, 'details[venue][street]': street, 'details[venue][building]': building, 'details[venue][area]': area,'details[venue][lat]': lat, 'details[venue][long]': long}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    
    
@then(parsers.parse('the result should return event details as "{event_name}" "{event_id}" for requested event'))
def unit_response_assert(unit_post_request, event_name, event_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(event_id)
    assert event_id == event_id
    
@when(parsers.parse('a POST request for an endpoint /event/new is triggered to create new event for scheduler block'), target_fixture = 'post_request')
def post_request():
    pass

@then(parsers.parse('response code of POST request is "{code:d}" for smoke testing'))
def smoke_post_response_code(smoke_post_request, code):
    assert smoke_post_request.status_code == code	

@then(parsers.parse('response code of POST request is "{code:d}"'))
def unit_post_response_code(unit_post_request, code):
    assert unit_post_request.status_code == code	


@then(parsers.parse('response code of negative testing POST request for error is "{status_code:d}"'))
def neg_post_response_code(neg_post_request, status_code):
    assert neg_post_request.status_code != status_code	
