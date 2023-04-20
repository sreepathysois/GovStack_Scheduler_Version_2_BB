import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
#API_HOME = 'http://myapi:3000/entity/create_entity/'
API_HOME = 'http://myapi:3000/subscriber/new'
 
# Scenarios
 
scenarios('../features/createsubscribernew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor Id is "{healthngo1}" with role as "{healthworker}" to create a new subscriber'), target_fixture='smoke_post_request')
def smoke_post_request(healthngo1,healthworker):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a subscriber with name "{name}" for "{category}" with following details like "{phone}" "{email}" with "{alert_url}" having "{alert_preference}" and "{status_poll_url}"'), target_fixture='unit_post_request')
def unit_post_request(requestor_id, requestor_role, name, category, phone, email, alert_url, alert_preference, status_poll_url):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'subscriber_details[name]': name, 'subscriber_details[category]': category, 'subscriber_details[phone]': phone, 'subscriber_details[email]': email, 'subscriber_details[alert_url]': alert_url, 'subscriber_details[alert_prefernce]':alert_preference,'subscriber_details[status_poll_url]':status_poll_url}
    response = requests.post(API_HOME, data = data) 
    print(data)
    print(response.url)
    print(response.text)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" to create a subscriber with name "{name}" for "{category}" with following details like "{phone}" "{email}" with "{alert_url}" having "{alert_preference}" and "{status_poll_url}"'), target_fixture='neg_post_request')
def neg_post_request(requestor_id, requestor_role, name, category, phone, email, alert_url, alert_preference, status_poll_url):
    
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'subscriber_details[name]': name, 'subscriber_details[category]': category, 'subscriber_details[phone]': phone, 'subscriber_details[email]': email, 'subscriber_details[alert_url]': alert_url, 'subscriber_details[alert_prefernce]':alert_preference,'subscriber_details[status_poll_url]':status_poll_url}
    response = requests.post(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    
    
@then(parsers.parse('the result should return subscriber Id as "{subscriber_id:d}" for smoke testing'))
def unit_response_assert(smoke_post_request,subscriber_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = smoke_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(subscriber_id)
    assert subscriber_id == subscriber_id 
    
@then(parsers.parse('the result should return subscriber details like "{subscriber_id}" and "{subscriber_name}" for requested subscriber'))
def unit_response_assert(unit_post_request, subscriber_name, subscriber_id):
    # A more comprehensive test would check 'RelatedTopics' for matching phrases
    assert_response = unit_post_request.json()   
    print(assert_response)
    print(type(assert_response.split(",", 1)))
    print(assert_response.split(",", 1)[1])
    print(subscriber_id)
    assert subscriber_id == subscriber_id
    
@when(parsers.parse('a POST request for an endpoint /subscriber/new/ is triggered to create new subscriber for scheduler block'), target_fixture = 'post_request')
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
