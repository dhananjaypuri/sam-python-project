import requests
import json

def lambda_handler(event, context):
    site = "https://google.com";

    response = requests.get(url=site);

    data = { "statusCode":  response.status_code, "message": "hello world"};

    return {"statusCode": response.status_code, "body": json.dumps(data)}