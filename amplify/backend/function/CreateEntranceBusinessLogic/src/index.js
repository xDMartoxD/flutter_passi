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
	getPaymentMethod,
} = require('/opt/models')
const env = process.env.ENV
exports.handler = async (event, context) => {
	try {
		const { typeName, arguments: args, identity } = event
		if (typeName !== 'Mutation') {
			console.log('el tipo de request de ve ser Mutation')
			throw new Error('el tipo de request de ve ser Mutation')
		}
		if (!args.eventID) {
			console.log('Se requiere un evento')
			throw new Error('Se requiere un evento')
		}
		if (!args.ticketCategoriesID || args.ticketCategoriesID.length === 0) {
			console.log('Se requiere una Categoria de Entrada')
			throw new Error('Se requiere una Categoria de Entrada')
		}
		if (args.ticketCategoriesID.length > 20) {
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
				throw new Error('No se ha encontrado informacion del evento')
			}
			const user = await getUser(identity.username, env)
			if (!user) {
				throw new Error('No se ha encontrado informacion del usuario')
			}
			const ticketCategories = []
			args.ticketCategoriesID.forEach(async (id) => {
				const Item = await getTicketCategory(id, env)
				if (!Item) {
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
			let selectedPaymentMethod = null
			if (user.userSelectedPaymentMethodId) {
				selectedPaymentMethod = await getPaymentMethod(
					user.userSelectedPaymentMethodId,
					env
				)
			}
			const price = ticketCategories.reduce(
				(accumalator, tc) => accumalator + tc.price,
				0
			)
			if (!selectedPaymentMethod && price - discountCode.discount > 0) {
				throw new Error(
					'No tienes un metodo de pago seleccionado pero tus entradas tienen un costo de',
					price - discountCode.discount
				)
			}
			if (
				selectedPaymentMethod &&
				!(
					selectedPaymentMethod.type === 'NEQUI' ||
					selectedPaymentMethod.type === 'CARD'
				)
			) {
				console.log('Esta Mutacion solo permite pagos con nequi o con tarjeta')
				throw new Error(
					'Esta Mutacion solo permite pagos con nequi o con tarjeta'
				)
			}
			if (
				event.maxBuyQuantity &&
				event.maxBuyQuantity <
					args.ticketCategoriesID.length +
						userTickets.filter((t) => t.eventID === event.id).length
			) {
				console.log(
					`Estas comprando mas entradas de las permitidas. Cantidad de entrdas permititdas: ${event.maxBuyQuantity} `
				)
				throw new Error(
					`Estas comprando mas entradas de las permitidas. Cantidad de entrdas permititdas: ${event.maxBuyQuantity} `
				)
			}
			if (new Date(event.finishDateTime) < new Date()) {
				console.log('El evento ya ha ocurrido')
				throw new Error('El evento ya ha ocurrido')
			} else if (
				event.needsCode &&
				(!args.code ||
					eventDiscountCodes.map((c) => c.code).indexOf(args.code) === -1)
			) {
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
					throw new Error(
						`La Categoria con el identificador ${ticketCategory.id} no concuerda con el evento ${event.id}`
					)
				} else if (
					ticketCategory.maxCapacity <= ticketCategory.totalAssistants
				) {
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
					throw new Error(
						`No hay suficientes entradas disponibles para la categoria ${ticketCategory.name}. Intenta reduciendo la cantidad`
					)
				}
			})
			return {
				event,
				ticketCategoriesObject,
				ticketCategories,
				userTickets,
				eventDiscountCodes,
				discountCode,
				user,
				selectedPaymentMethod,
			}
		}
	} catch (err) {
		console.log(err)
		return { errors: err.message }
	}
}
