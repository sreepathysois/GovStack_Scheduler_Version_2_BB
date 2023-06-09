import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/resource/availabality/'
 
# Scenarios
 
scenarios('../features/getresourceavailabalitydetailsnew.feature')
 
# Fixtures
 


@pytest.fixture


#@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" for smoke testing'), target_fixture = 'smoke_get_request')
@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" for smoke testing'),target_fixture = 'smoke_get_request')
def smoke_get_request(requestor_id, requestor_role,resource_id ):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'free_resource_filter[resource_id]': resource_id}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
    #assert find_free_subscribers_response_code.status_code == code

@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" with entity Id "{Entity_id}" for category "{category}" for a date period from "{From}" to "{To}"'), target_fixture = 'unit_get_request')
def unit_get_request(requestor_id, requestor_role, resource_id, Entity_id, category, From, To):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'free_resource_filter[resource_id]': resource_id, 'free_resource_filter[Entity_id]': Entity_id, 'free_resource_filter[category]': category, 'free_resource_filter[From]': From, 'free_resource_filter[To]': To}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response


@given(parsers.parse('the invalid inputs for the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" with entity Id "{Entity_id}" for category "{category}" for a date period from "{From}" to "{To}"'), target_fixture = 'neg_get_request')
def neg_get_request(requestor_id, requestor_role, resource_id, Entity_id, category, From, To):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'free_resource_filter[resource_id]': resource_id, 'free_resource_filter[Entity_id]': Entity_id, 'free_resource_filter[category]': category, 'free_resource_filter[From]': From, 'free_resource_filter[To]': To}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
	
	
@when(parsers.parse('a GET request for an endpoint /resource/availabality/ is triggered to get details of a resource availabality list'), target_fixture='get_request')
def get_request():
    pass




@then(parsers.parse('the result should return following details of entity with its name "{resource_id}" "{resource_name}"  and "{free_slots}"'))
def unit_get_response_assert(unit_get_request, resource_id, resource_name, free_slots):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_get_request.json()   
    print(assert_response)
    print(type(assert_response))
    print(assert_response[0][0]['free_slots']['category'])
    #print(assert_response[1])
    #for i in range(len(assert_response)):
    #     print((i, assert_response[i])) 
    assert assert_response[0][0]['details']['category'] == 'doctor'   


@then(parsers.parse('response code of GET request is "{code:d}" for smoke testing'))
def smoke_get_response_code(smoke_get_request, code):
    assert smoke_get_request.status_code == code

@then(parsers.parse('response code of GET request is "{code:d}"'))
def unit_get_response_code(unit_get_request, code):
    assert unit_get_request.status_code == code



@then(parsers.parse('response code of negative testing GET request for invalid data is "{status_code}"'))
def neg_get_response_code(neg_get_request, status_code):
    assert neg_get_request.status_code != eval(status_code)


