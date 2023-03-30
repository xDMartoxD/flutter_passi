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
Amplify Params - DO NOT EDIT */

const { businessLogic } = require("./businessLogic.js")
const { payment } = require("./payment.js")
const { db } = require("./db.js")

exports.handler = async ({ body, requestContext: { identity } }, context) => {
	const args = JSON.parse(body)
	let code = null;
	if (args.code !== 'null') {
		code = args.code
	}
	console.log("args ", args)
	const { event, ticketCategoriesObject, ticketCategories, userTickets, eventDiscountCodes, discountCode, user, selectedPaymentMethod, error: blError } = await businessLogic(args.eventID, args.ticketCategoriesID, identity, args.userID, code)
	console.log('event ', event)
	console.log('ticketCategoriesObject ', ticketCategoriesObject)
	console.log('ticketCategories ', ticketCategories)
	console.log('userTickets ', userTickets)
	console.log('eventDiscountCodes ', eventDiscountCodes)
	console.log('discountCode ', discountCode)
	console.log('user ', user)
	console.log('selectedPaymentMethod ', selectedPaymentMethod)
	console.log('Error ', blError)
	if (blError) {
		return {
			statusCode: 401,
			headers: {
				"Access-Control-Allow-Origin": "*",
				"Access-Control-Allow-Headers": "*",

			},
			body: JSON.stringify({ "data": blError }),
		};
	}
	const { payed, paymentData, totalCost, error: paymentError } = await payment({
		event,
		ticketCategoriesObject,
		ticketCategories,
		userTickets,
		eventDiscountCodes,
		discountCode,
		user,
		selectedPaymentMethod,
		acceptanceToken: args.acceptanceToken,
		installments: args.installments
	})
	if (paymentError) {
		return {
			statusCode: 401,
			headers: {
				"Access-Control-Allow-Origin": "*",
				"Access-Control-Allow-Headers": "*",

			},
			body: JSON.stringify({ "data": paymentError }),
		};
	}
	const { error: dbError } = await db({
		event,
		ticketCategories,
		discountCode,
		payed,
		paymentData,
		totalCost,
		ticketCategoriesObject,
		user,
	});
	if (dbError) {
		return {
			statusCode: 401,
			headers: {
				"Access-Control-Allow-Origin": "*",
				"Access-Control-Allow-Headers": "*",

			},
			body: JSON.stringify({ "data": dbError }),
		};
	}
	return {
		statusCode: 200,
		headers: {
			"Access-Control-Allow-Origin": "*",
			"Access-Control-Allow-Headers": "*",

		},
		body: JSON.stringify({ "data": "ok" }),
	};
}




