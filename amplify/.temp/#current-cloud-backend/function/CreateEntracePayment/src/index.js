/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
const { v4: uuidv4 } = require('uuid')
const env = process.env.ENV
const axios = require('axios')

const initPayment = (body) => {
	return axios
		.post(
			'https://production.wompi.co/v1/transactions',
			body,
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
			return { errors: err.message }
		})
}

const subscribe = async (id) => {
	const link = `https://production.wompi.co/v1/transactions/${id}`
	let data = await axios
		.get(
			link,
			{
				headers: {
					Authorization: 'Bearer prv_prod_vVJbmNcIBeZv4Sdp608GjnlY45YErrHx',
				},
			},
			{ timeout: 10000 }
		)
		.then((res) => res.data.data)
		.catch((err) => {
			console.log(JSON.stringify(err))
		})

	if (data.status == 'PENDING') {
		return await subscribe(id)
	} else {
		console.log(data)
		return data
	}
}

exports.handler = async (appSyncEvent, context) => {
	let payed = false
	try {
		if (appSyncEvent.prev.result.errors) {
			return { errors: appSyncEvent.prev.errors }
		}
		const {
			prev: {
				result: {
					event,
					ticketCategoriesObject,
					ticketCategories,
					userTickets,
					eventDiscountCodes,
					discountCode,
					user,
					selectedPaymentMethod,
				},
			},
			arguments: args,
		} = appSyncEvent

		const price = ticketCategories.reduce(
			(accumalator, tc) => accumalator + tc.price,
			0
		)
		const discount = discountCode ? discountCode.discount : 0
		if (price - discount > 0) {
			if (price - discount < 1500) {
				throw new Error('La transaccion minima posible es de 1500 COP')
			}

			let body = {}
			if (selectedPaymentMethod.type === 'CARD') {
				body = {
					acceptance_token: args.acceptanceToken,
					amount_in_cents: (price - discount) * 100,
					currency: 'COP',
					customer_email: user.email,
					payment_method: {
						installments: args.installments,
						token: selectedPaymentMethod.token,
						type: selectedPaymentMethod.type,
					},
					reference: uuidv4(),
					payment_source_id: selectedPaymentMethod.paymentSourceID,
				}
			} else {
				body = {
					acceptance_token: args.acceptanceToken,
					amount_in_cents: (price - discount) * 100,
					currency: 'COP',
					customer_email: user.email,
					payment_method: {
						type: 'NEQUI',
						phone_number: selectedPaymentMethod.data.phone_number,
					},
					reference: uuidv4(),
					payment_source_id: args.payment_source_id,
				}
			}
			const response = await initPayment(body)
			console.log(response.data)
			const { id, payment_method_type } = response.data
			if (payment_method_type === 'CARD') {
				const data = await subscribe(id)
				console.log(data)
				if (data.status === 'APPROVED') {
					payed = true
					return {
						event,
						ticketCategoriesObject,
						ticketCategories,
						userTickets,
						eventDiscountCodes,
						discountCode,
						payed,
						user,
						wompiData: response.data,
						paymentData: data,
						selectedPaymentMethod,
						totalCost: price - discount,
					}
				} else {
					throw new Error('La transaccion no fue aprovada ' + data.status)
				}
			} else {
				return {
					event,
					ticketCategoriesObject,
					ticketCategories,
					userTickets,
					eventDiscountCodes,
					discountCode,
					payed,
					user,
					paymentData: response.data,
					selectedPaymentMethod,
					totalCost: price - discount,
				}
			}
		} else {
			return {
				event,
				ticketCategoriesObject,
				ticketCategories,
				userTickets,
				eventDiscountCodes,
				discountCode,
				payed,
				user,
				totalCost: price - discount,
			}
		}
	} catch (err) {
		console.log(err.message)
		if (payed) {
		}
		return { errors: err.message, payed }
	}
}
