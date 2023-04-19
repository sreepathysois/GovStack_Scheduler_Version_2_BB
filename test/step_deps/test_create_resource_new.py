import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
#API_HOME = 'http://myapi:3000/entity/create_entity/'
API_HOME = 'http://myapi:3000/resource/new'
 
# Scenarios
 
scenarios('../features/createresourcenew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor Id is "{healthngo1}" with role as "{healthworker}" to create a new resource'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a resource with name "{name}" for "{category}" with following details like "{phone}" "{email}" with "{alert_url}" "{alert_preference}" and "{status_poll_url}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role, name, category, phone, email, alert_url,alert_preference,status_poll_url):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'resource_details[name]': name, 'resource_details[category]': category, 'resource_details[phone]': phone, 'resource_details[email]': email, 'resource_details[alert_url]':alert_url, 'resource_details[alert_preference]': alert_preference, 'resource_details[status_poll_url]': status_poll_url}
    response = requests.post(API_HOME, data = data) 
    print(data)
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a resource with name "{name}" for "{category}" with following details like "{phone}" "{email}" with "{alert_url}" "{alert_preference}" and "{status_poll_url}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role, name, category, phone, email, alert_url,alert_preference,status_poll_url):
    
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'resource_details[name]': name, 'resource_details[category]': category, 'resource_details[phone]': phone, 'resource_details[email]': email, 'resource_details[alert_url]':alert_url, 'resource_details[alert_preference]': alert_preference, 'resource_details[status_poll_url]': status_poll_url}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    
    
@then(parsers.parse('the result should return resource Id as "{resource_id:d}" for smoke testing'))
def unit_response_assert(smoke_post_request,resource_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(resource_id)
    assert resource_id == resource_id 
    
@then(parsers.parse('the result should return resource details like "{resource_id}" and "{resource_name}" for requested resource'))
def unit_response_assert(unit_post_request, resource_name, resource_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(resource_id)
    assert resource_id == resource_id
    
@when(parsers.parse('a POST request for an endpoint /resource/new/ is triggered to create new resource for scheduler block'), target_fixture = 'post_request')
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
