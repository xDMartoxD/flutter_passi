/* Amplify Params - DO NOT EDIT
	API_APPAMPLIFY_GRAPHQLAPIIDOUTPUT
	API_APPAMPLIFY_PAYMENTMETHODTABLE_ARN
	API_APPAMPLIFY_PAYMENTMETHODTABLE_NAME
	ENV
	REGION
Amplify Params - DO NOT EDIT */
const AWS = require('aws-sdk')
const axios = require('axios')

const fetchTransaction = async (body) => {
	return axios
		.post('https://production.wompi.co/v1/payment_sources', body, {
			headers: {
				Authorization: process.env.AUTH,
			},
		})
		.then((response) => response.data
		)
		.catch((err) => {
			return new Error('error al comunicarse con wompi')
		})
}

const updatePaymentMethod = async (docClient, data, id) => {
	const { id: paymentSourceID, token, type, status, customer_email } = data
	return docClient
		.update({
			TableName: process.env.API_APPAMPLIFY_PAYMENTMETHODTABLE_NAME,
			Key: {
				id,
			},
			UpdateExpression: `set #status = :status, #paymentSourceID = :paymentSourceID, #token = :token, #type = :type, #customer_email = :customer_email`,
			ExpressionAttributeValues: {
				':status': status,
				':paymentSourceID': paymentSourceID,
				':token': token,
				':type': type,
				':customer_email': customer_email,
			},
			ExpressionAttributeNames: {
				'#status': 'status',
				'#paymentSourceID': 'paymentSourceID',
				'#token': 'token',
				'#type': 'type',
				'#customer_email': 'customer_email',
			},
			ReturnValues: 'ALL_NEW',
		})
		.promise()
}

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
exports.handler = async (event) => {
	const docClient = new AWS.DynamoDB.DocumentClient()
	const { body } = event
	try {
		const args = await JSON.parse(body)
		const { data } = await fetchTransaction(args)
		const { Attributes } = await updatePaymentMethod(docClient, data, args.id)
		return {
			statusCode: 200,
			headers: {
				"Access-Control-Allow-Origin": "*",
				"Access-Control-Allow-Headers": "*",

			},
			body: JSON.stringify({ "data": "ok" }),
		};
	} catch (err) {
		console.log('ERROR', err)
		return new Error('Ocurrio un error en la base de datos')
	}
}
