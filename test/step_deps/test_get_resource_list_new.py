import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/resource/list_details/'
 
# Scenarios
 
scenarios('../features/getresourcelistnew.feature')
 
# Fixtures
 


@pytest.fixture


#@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" for smoke testing'), target_fixture = 'smoke_get_request')
@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" for smoke testing'),target_fixture = 'smoke_get_request')
def smoke_get_request(requestor_id, requestor_role,resource_id ):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'resource_id': resource_id}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
    #assert find_free_subscribers_response_code.status_code == code

@given(parsers.parse('the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" with details filter for "{filter_resource_id}" and requesting for resource details for "{required_category}" "{required_resource_id}" "{required_name}" and "{required_email}"'), target_fixture = 'unit_get_request')
def unit_get_request(requestor_id, requestor_role, resource_id, filter_resource_id, required_category, required_resource_id, required_name, required_email):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'resource_id': resource_id, 'resource_filter[resource_id]': filter_resource_id, 'resource_details_required[category]': required_category,'resource_details_required[resource_id]': required_resource_id,'resource_details_required[name]': required_name,'resource_details_required[email]': required_email}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response


@given(parsers.parse('the invalid inputs for the requestor Id is "{requestor_id}" with role as "{requestor_role}" for an resource_id "{resource_id}" with details filter for "{filter_resource_id}" and requesting for resource details for "{required_category}" "{required_resource_id}" "{required_name}" and "{required_email}"'), target_fixture = 'neg_get_request')
def neg_get_request(requestor_id, requestor_role, resource_id, filter_resource_id, required_category, required_resource_id, required_name, required_email):
    params = {'requestor_id': requestor_id, 'requestor_role': requestor_role,'resource_id': resource_id, 'resource_filter[resource_id]': filter_resource_id, 'resource_details_required[category]': required_category,'resource_details_required[resource_id]': required_resource_id,'resource_details_required[name]': required_name,'resource_details_required[email]': required_email}
    response = requests.get(API_HOME, params = params) 
    print(response.url)
    status_code = response.json()  
    print(status_code)
    return response
	
	
@when(parsers.parse('a GET request for an endpoint /resource/list_details/ is triggered to get details of a resources list'), target_fixture='get_request')
def get_request():
    pass




@then(parsers.parse('the result should return following details of entity with its name "{name}" "{category}" "{resource_id}" "{phone}" and "{email}"'))
def unit_get_response_assert(unit_get_request, name, category, resource_id,phone, email, ):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_respone = []
    assert_response = unit_get_request.json()   
    print(assert_response)
    print(type(assert_response))
    print(assert_response[0][0]['details']['category'])
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


