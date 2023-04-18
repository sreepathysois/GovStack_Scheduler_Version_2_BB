import pytest
import json 
import requests
import sys
from pytest_bdd import scenarios, given, when, then, parsers

 
#API_HOME = 'http://172.16.51.57:8000/home/'
API_HOME = 'http://myapi:3000/entity/modifications/'
#API_HOME = 'http://myapi:3000/subscribers/create_session/'
 
# Scenarios
 
scenarios('../features/updateentitynew.feature')
 
# Fixtures
 


@pytest.fixture



@given(parsers.parse('the requestor id is "{healthngo1}" with role as "{healthworker}" to update an entity with its ID "{entity_id:d}"'), target_fixture='smoke_put_request')
def smoke_put_request(healthngo1,healthworker,entity_id):
    data = {'requestor_id': healthngo1, 'requestor_role': healthworker,'entity_id':entity_id}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response


@given(parsers.parse('the requestor id is "{requestor_id}" with role as "{requestor_role}" for an entity with Id "{entity_id}" to update an entity with name "{name}" for "{category}" with following details like "{phone}" "{email}" with "{website}"'), target_fixture='unit_put_request')
def unit_put_request(requestor_id, requestor_role, entity_id, name, category, phone, email,website):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'entity_id': entity_id, 'details[name]': name, 'details[category]': category, 'details[phone]': phone, 'details[email]': email, 'details[website]': website}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

@given(parsers.parse('the invalid inputs for the requestor id is "{requestor_id}" with role as "{requestor_role}" for an entity with Id "{entity_id}" to update an entity with name "{name}" for "{category}" with following details like "{phone}" "{email}" with "{website}"'), target_fixture='neg_put_request')
def neg_put_request(requestor_id, requestor_role, entity_id, name, category, phone, email,website):
    data = {'requestor_id': requestor_id, 'requestor_role': requestor_role, 'entity_id': entity_id, 'details[name]': name, 'details[category]': category, 'details[phone]': phone, 'details[email]': email, 'details[website]': website}
    response = requests.put(API_HOME, data = data) 
    print(response.url)
    status_code = response.text  
    print(status_code)
    return response

    #return response

@when(parsers.parse('an Update request for an endpoint /entity/modifications/ is triggered to update existing entity for scheduler block'), target_fixture = 'post_request')
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
