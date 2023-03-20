const AWS = require('aws-sdk')
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
