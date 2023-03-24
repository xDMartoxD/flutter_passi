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
	const {
		event,
		ticketCategories,
		discountCode,
		payed,
		paymentData,
		totalCost,
		ticketCategoriesObject,
		user,
	} = appSyncEvent.prev.result
	try {
		console.log('Total cost', totalCost)
		console.log('Event', event)
		console.log('ticketCategories', ticketCategories)
		console.log('Discount Code', discountCode)
		console.log('Payed', payed)
		console.log('Payment data', paymentData)
		console.log('TicketCategoriesObject', ticketCategoriesObject)
		console.log('User', user)
		if (appSyncEvent.prev.result.errors) {
			throw new Error(appSyncEvent.prev.result.errors)
		}
		if (paymentData?.payment_method_type === 'NEQUI') {
			return { data: paymentData.id }
		} else if (totalCost <= 0) {
			const response = await createTransaction(
				uuidv4,
				env,
				event.id,
				ticketCategories,
				ticketCategoriesObject,
				user,
				discountCode
			)
			console.log('response', response)
			return { data: 'SUCCESS' }
		} else {
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
			console.log('Response', response)
			return { data: 'SUCCESS' }
		}
	} catch (err) {
		console.log('Error ', err)
		if (payed) {
			cancelTransaction(appSyncEvent.prev.result.paymentData.id)
		}
		return { errors: err.message }
	}
}
