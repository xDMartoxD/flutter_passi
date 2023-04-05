/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
const {
	getEvent,
	getTicketCategory,
	getDiscountCodesByEvent,
	getTicketsByUser,
	getDiscountCode,
	getUser,
} = require('/opt/models')
const axios = require('axios')
const env = process.env.ENV

const getPaymentData = async (id) => {
	const link = `https://production.wompi.co/v1/transactions/${id}`
	return axios
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
}

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

exports.handler = async (appSyncEvent, context) => {
	let payed = false
	let needsDevolution = false
	try {
		const { typeName, arguments: args, identity } = appSyncEvent
		if (!args.paymentID) {
			console.log('Se debe tener un id de pago')
			throw new Error('Se debe tener un id de pago')
		}
		const paymentData = await getPaymentData(args.paymentID)
		console.log(paymentData)
		payed = paymentData.status === 'APPROVED' ? true : false
		if (typeName !== 'Mutation') {
			console.log('el tipo de request debe ser Mutation')
			throw new Error('el tipo de request debe ser Mutation')
		}
		if (!args.eventID) {
			console.log('Se requiere un evento')
			throw new Error('Se requiere un evento')
		}
		if (!args.ticketCategoriesID || args.ticketCategoriesID.length === 0) {
			console.log('Se requiere una Categoria de Entrada')
			throw new Error('Se requiere una Categoria de Entrada')
		}
		if (args.ticketCategoriesID.length > 10) {
			console.log(
				'La cantidad maxima permitida de compra de cualquier evento es 20'
			)
			throw new Error(
				'La cantidad maxima permitida de compra de cualquier evento es 20'
			)
		}
		if (!identity) {
			console.log('Se debe estar autenticado')
			throw new Error('Se debe estar autenticado')
		} else {
			const ticketCategoriesObject = {}
			args.ticketCategoriesID.forEach((tcID) => {
				if (ticketCategoriesObject[tcID] !== undefined) {
					ticketCategoriesObject[tcID] = ticketCategoriesObject[tcID] + 1
				} else {
					ticketCategoriesObject[tcID] = 1
				}
			})
			const event = await getEvent(args.eventID, env)
			if (!event) {
				needsDevolution = true
				throw new Error('No se ha encontrado informacion del evento')
			}
			const user = await getUser(identity.username, env)
			if (!user) {
				needsDevolution = true
				console.log('No se ha encontrado informacion del usuario')
				throw new Error('No se ha encontrado informacion del usuario')
			}
			const ticketCategories = []
			args.ticketCategoriesID.forEach(async (id) => {
				const Item = await getTicketCategory(id, env)
				if (!Item) {
					needsDevolution = true
					console.log('No se ha encontrado la categoria de la entrada')
					throw new Error('No se ha encontrado la categoria de la entrada')
				}
				ticketCategories.push(Item)
			})
			const userTickets = await getTicketsByUser(identity.username, env)
			const eventDiscountCodes = await getDiscountCodesByEvent(
				args.eventID,
				env
			)

			const discountCode = args.code
				? await getDiscountCode(args.code, args.eventID, env)
				: null

			const price = ticketCategories.reduce(
				(accumalator, tc) => accumalator + tc.price,
				0
			)
			const discount = discountCode ? discountCode.discount : 0
			if (paymentData.status !== 'APPROVED') {
				console.log('El pago de nequi no ha sido aprovado' + paymentData.status)
				throw new Error(`El pago de nequi no ha sido aprovado`)
			}
			if (price - discount > paymentData.amount_in_cents / 100) {
				console.log(
					`El pago de nequi no corresponde al pago dado por la base de datos. Nequi: ${
						paymentData.amount_in_cents / 100
					}, Base de datos: ${price - discountCode.discount}`
				)
				needsDevolution = true
				throw new Error(
					`El pago de nequi no corresponde al pago dado por la base de datos. Nequi: ${
						paymentData.amount_in_cents / 100
					}, Base de datos: ${price - discountCode.discount}`
				)
			}
			if (
				event.maxBuyQuantity &&
				event.maxBuyQuantity <
					args.ticketCategoriesID.length +
						userTickets.filter((t) => t.eventID === event.id).length
			) {
				needsDevolution = true
				console.log(
					`Estas comprando mas entradas de las permitidas. Cantidad de entrdas permititdas: ${event.maxBuyQuantity} `
				)
				throw new Error(
					`Estas comprando mas entradas de las permitidas. Cantidad de entrdas permititdas: ${event.maxBuyQuantity} `
				)
			}
			if (new Date(event.finishDateTime) < new Date()) {
				needsDevolution = true
				console.log('El evento ya ha ocurrido')
				throw new Error('El evento ya ha ocurrido')
			} else if (
				event.needsCode &&
				(!args.code ||
					eventDiscountCodes.map((c) => c.code).indexOf(args.code) === -1)
			) {
				needsDevolution = true
				console.log('Se necesita un codigo valido')
				throw new Error('Se necesita un codigo valido')
			}
			ticketCategories.forEach((ticketCategory) => {
				if (ticketCategory.eventID !== event.id) {
					console.log(
						'La Categoria no concuerda con el evento',
						ticketCategory.eventID,
						event.id
					)
					needsDevolution = true
					throw new Error(
						`La Categoria con el identificador ${ticketCategory.id} no concuerda con el evento ${event.id}`
					)
				} else if (
					ticketCategory.maxCapacity <= ticketCategory.totalAssistants
				) {
					needsDevolution = true
					console.log(
						`Las entradas de la categoria ${ticketCategory.name} se encuentran agotadas`
					)
					throw new Error(
						`Las entradas de la categoria ${ticketCategory.name} se encuentran agotadas`
					)
				} else if (
					ticketCategory.totalAssistants +
						ticketCategoriesObject[ticketCategory.id] >
					ticketCategory.maxCapacity
				) {
					needsDevolution = true
					console.log(
						`No hay suficientes entradas disponibles para la categoria ${ticketCategory.name}. Intenta reduciendo la cantidad`
					)
					throw new Error(
						`No hay suficientes entradas disponibles para la categoria ${ticketCategory.name}. Intenta reduciendo la cantidad`
					)
				}
			})
			return {
				event,
				ticketCategoriesObject,
				ticketCategories,
				discountCode,
				user,
				paymentData,
				payed,
			}
		}
	} catch (err) {
		if (payed && needsDevolution) {
			await cancelTransaction(appSyncEvent.prev.result.paymentData.id)
			return { errors: `${err.message}. Hemos cancelado la transaccion` }
		}
		return { errors: err.message }
	}
}
