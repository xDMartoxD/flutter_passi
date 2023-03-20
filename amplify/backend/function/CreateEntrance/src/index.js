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

const AWS = require('aws-sdk')
const { v4: uuidv4 } = require('uuid')
const { businessLogic } = require("./businessLogic.js")
const { payment } = require("./payment.js")
const { db } = require("./db.js")
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

exports.handler = async ({ body, requestContext: { identity } }, context) => {
	const args = JSON.parse(body)
	let code = null;
	if (args.code !== 'null') {
		code = args.code
	}
	const blResponse = await businessLogic(args.eventID, args.ticketCategoriesID, identity, args.userID, code)
	if (blResponse) {
		const { event, ticketCategoriesObject, ticketCategories, userTickets, eventDiscountCodes, discountCode, user, selectedPaymentMethod } = blResponse
		const paymentResponse = await payment({
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
		if (paymentResponse) {
			const { payed, paymentData, totalCost } = paymentResponse
			const dbResponse = await db({
				event,
				ticketCategories,
				discountCode,
				payed,
				paymentData,
				totalCost,
				ticketCategoriesObject,
				user,
			});
			if (dbResponse) {
				console.log("DB RESPONSE ", dbResponse)
				return {
					statusCode: 200,
					headers: {
						"Access-Control-Allow-Origin": "*",
						"Access-Control-Allow-Headers": "*",

					},
					body: JSON.stringify({ "data": "ok" }),
				};
			}
		}
	}
}


