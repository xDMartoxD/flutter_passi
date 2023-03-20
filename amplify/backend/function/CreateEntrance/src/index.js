/* Amplify Params - DO NOT EDIT
	API_APPAMPLIFY_DISCOUNTCODETABLE_ARN
	API_APPAMPLIFY_DISCOUNTCODETABLE_NAME
	API_APPAMPLIFY_EVENTCATEGORYTABLE_ARN
	API_APPAMPLIFY_EVENTCATEGORYTABLE_NAME
	API_APPAMPLIFY_EVENTTABLE_ARN
	API_APPAMPLIFY_EVENTTABLE_NAME
	API_APPAMPLIFY_GRAPHQLAPIIDOUTPUT
	API_APPAMPLIFY_JOBTABLE_ARN
	API_APPAMPLIFY_JOBTABLE_NAME
	API_APPAMPLIFY_PAYMENTMETHODTABLE_ARN
	API_APPAMPLIFY_PAYMENTMETHODTABLE_NAME
	API_APPAMPLIFY_TICKETCATEGORYTABLE_ARN
	API_APPAMPLIFY_TICKETCATEGORYTABLE_NAME
	API_APPAMPLIFY_TICKETTABLE_ARN
	API_APPAMPLIFY_TICKETTABLE_NAME
	API_APPAMPLIFY_USERTABLE_ARN
	API_APPAMPLIFY_USERTABLE_NAME
	ENV
	REGION
Amplify Params - DO NOT EDIT */const AWS = require('aws-sdk')
const { v4: uuidv4 } = require('uuid')
const {
	getEvent,
	createTicket,
	getTicketCategory,
	incrementTotalAssistantsTicketCategory,
	getDiscountCodesByEvent,
	getTicketsByUser,
	incrementDiscountCodeUse,
	getDiscountCode,
} = require('/opt/models')
const { initPayment } = require('/opt/wompi')
const env = process.env.ENV

exports.handler = async ({ body: args, requestContext: { identity } }, context) => {
	console.log("ARGS =>", args)
	console.log("IDENTIDY => ", identity)


	return 'SUCCESS'
}
