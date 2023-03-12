const amplifyconfig =
    ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "appamplify": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://qoonxe23evgfjmnpqlehsvetk4.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-okhzdhrykvdivpugfgmlux45ri"
                },
                "appamplifyWithUserPool": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://qoonxe23evgfjmnpqlehsvetk4.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "AMAZON_COGNITO_USER_POOLS",
                },
                "endpoints": {
                    "endpointType": "REST",
                    "endpoint": "https://mggpgmus2m.execute-api.us-east-1.amazonaws.com/devel",
                    "region": "us-east-1",
                    "authorizationType": "AWS_IAM"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://qoonxe23evgfjmnpqlehsvetk4.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-okhzdhrykvdivpugfgmlux45ri",
                        "ClientDatabasePrefix": "appamplify_API_KEY"
                    },
                    "appamplify_AMAZON_COGNITO_USER_POOLS": {
                        "ApiUrl": "https://qoonxe23evgfjmnpqlehsvetk4.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "appamplify_AMAZON_COGNITO_USER_POOLS"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:c4cd84c0-8502-40c4-ae75-d532b5cc1f6c",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_J9vpQ8nbz",
                        "AppClientId": "366cbdofr9p4f2t6488ot4jpol",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "signupAttributes": [
                            "EMAIL",
                            "NAME"
                        ],
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "appamplifyfcc503d0e85e4571b2322c17f2563fbe143433-devel",
                        "Region": "us-east-1"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "appamplifyfcc503d0e85e4571b2322c17f2563fbe143433-devel",
                "region": "us-east-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';
