import boto3
import json
import os

sender_email = os.environ['SENDER_EMAIL']
recipient_email = os.environ['RECIPIENT_EMAIL']


# Initialize the SES client
ses = boto3.client('ses', region_name='us-east-1')


def lambda_handler(event, context):
    try:
        response = ses.send_email(
            Source=recipient_email,         # 👈 Must be a verified email in SES
            Destination={
                'ToAddresses': [
                    sender_email,     # 👈 Change to your recipient
                ],
            },
            Message={
                'Subject': {
                    'Data': 'Test Email from Lambda',
                },
                'Body': {
                    'Text': {
                        'Data': 'Hello! This is an email sent from a Lambda function.',
                    },
                },
            },
        )
        print("Email sent! Message ID:", response['MessageId'])
        return {
            'statusCode': 200,
            'body': json.dumps('Email sent successfully!')
        }
    except Exception as e:
        print("Error sending email:", str(e))
        return {
            'statusCode': 500,
            'body': json.dumps('Failed to send email.')
        }
