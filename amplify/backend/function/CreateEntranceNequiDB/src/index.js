/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
const { v4: uuidv4 } = require('uuid')
const axios = require('axios')
const env = process.env.ENV
const { createTransaction } = require('/opt/models')

const cancelTransaction = async (transactionID) => {
	return axios
		.post(
			`https://production.wompi.co/v1/transactions/${transactionID}/void`,
			{
				headers: {
					Authorization: 'Bearer prv_prod_vVJbmNcIBeZv4Sdp608GjnlY45YErrHx',
				},
			},
			{ timeout: 10000 }
		)
		.then((response) => {
			return response.data
		})
		.catch((err) => {
			return {
				errors:
					'No hemos podido cancelar tu transaccion por favor comunicate con nosotros. Error: ' +
					err.message,
			}
		})
}
exports.handler = async (appSyncEvent) => {
	if (appSyncEvent.prev.result.errors) {
		throw new Error(appSyncEvent.prev.result.errors)
	}
	const {
		event,
		ticketCategoriesObject,
		ticketCategories,
		discountCode,
		user,
		paymentData,
		payed,
	} = appSyncEvent.prev.result
	try {
		console.log('Event', event)
		console.log('ticketCategories', ticketCategories)
		console.log('Discount Code', discountCode)
		console.log('Payed', payed)
		console.log('Payment data', paymentData)
		console.log('TicketCategoriesObject', ticketCategoriesObject)
		console.log('user', user)
		const response = await createTransaction(
			uuidv4,
			env,
			event.id,
			ticketCategories,
			ticketCategoriesObject,
			user,
			discountCode,
			paymentData
		)

		return { data: 'SUCCESS' }
	} catch (err) {
		console.log('Error ', err)
		if (payed) {
			await cancelTransaction(appSyncEvent.prev.result.paymentData.id)
			return { errors: `${err.message}. Hemos cancelado tu pago` }
		}
		return { errors: err.message }
	}
}
