import requests
API_HOME = 'http://myapi:3000/event/new'

data = {}
#def unit_post_request(requestor_id, name, category, host_entity_id, From, To, street, building, area ):
data = {"requestor_id": "requestor_id", 
        'name': "name",
        'category': "category", 
        'host_entity_id': "host_entity_id", 
        'From': "From",
        'To': "To", 
        'venue[street]': "street", 
        'venue[building]': "buildingi", 
        'venue[area]': "area"}
response = requests.post(url = API_HOME, params= data) 
print(response.request.url)
print(response.text)
status_code = response.text  
print(status_code)
#return response


#unit_post_request(requestor_id, name, category, host_entity_id, From, To, street, building, area)
