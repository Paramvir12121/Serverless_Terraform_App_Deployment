import json
#import boto3

def lambda_handler(event,comtext):
    # dynamodb = boto3.resource('dynamodb')
    # table = dynamodb.Table('users')
    # response = table.get_item(Key={'username': event['username']})
    return {
        'StatusCode': 200,
        'body': json.dumps(event['headers']['X-Forwarded-For'])
    }