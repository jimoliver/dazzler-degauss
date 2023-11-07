import json
from src.dazzler_degauss.main import main

def lambda_handler(event, context):
    # TODO implemen
    region = 'eu-west-1'
    main(region)
    # return {
    #     'statusCode': 200,
    #     'body': json.dumps('Hello from Lambda!')
    # }
