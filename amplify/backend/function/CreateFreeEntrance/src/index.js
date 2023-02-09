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
const { v4: uuidv4 } = require('uuid')
const env = process.env.ENV
exports.handler = async (event, context) => {
	try {
		const { typeName, arguments: args, identity } = event

		if (typeName !== 'Mutation') {
			console.log('el tipo de request de ve ser Mutation')
			return 'el tipo de request de ve ser Mutation'
		}
		if (!args.eventID) {
			console.log('Se requiere un evento')
			return 'Se requiere un evento'
		}
		if (!args.ticketCategories || !args.ticketCategories.length > 0) {
			console.log('Se requiere una Categoria de Entrada')
			return 'Se requiere una Categoria de Entrada'
		}
		if (!identity) {
			console.log('Se debe estar autenticado')
			return 'Se debe estar autenticado'
		} else {
			const ticketCategoriesObject = {}
			args.ticketCategories.forEach((tcID) => {
				if (ticketCategoriesObject[tcID] !== undefined) {
					ticketCategoriesObject[tcID] = ticketCategoriesObject[tcID] + 1
				} else {
					ticketCategoriesObject[tcID] = 1
				}
			})
			const event = await getEvent(args.eventID, env)
			const ticketCategories = []
			args.ticketCategories.forEach(async (id) => {
				const Item = await getTicketCategory(id, env)
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
			// console.log("ticketCategoriesObject", ticketCategoriesObject),
			// console.log("Event",event)
			// console.log("ticketCategories", ticketCategories)
			// console.log("userTickets", userTickets)
			// console.log("EventDiscountCodes",eventDiscountCodes)
			// console.log(discountCode)
			if (
				event.maxBuyQuantity &&
				event.maxBuyQuantity <
					args.ticketCategories.length +
						userTickets.filter((t) => t.eventID === event.id).length
			) {
				console.log(
					`Estas comprando mas entradas de las permitidas. Cantidad de entrdas permititdas: ${event.maxBuyQuantity} `
				)
				return `Estas comprando mas entradas de las permitidas. Cantidad de entrdas permititdas: ${event.maxBuyQuantity} `
			}
			if (new Date(event.finishDateTime) < new Date()) {
				console.log('El evento ya ha ocurrido')
				return 'El evento ya ha ocurrido'
			} else if (
				event.needsCode &&
				(!args.code ||
					eventDiscountCodes.map((c) => c.code).indexOf(args.code) === -1)
			) {
				console.log('Se necesita un codigo valido')
				return 'Se necesita un codigo valido'
			}
			ticketCategories.forEach((ticketCategory) => {
				if (ticketCategory.eventID !== event.id) {
					console.log(
						'La Categoria no concuerda con el evento',
						ticketCategory.eventID,
						event.id
					)
					return 'La Categoria no concuerda con el evento'
				} else if (
					ticketCategory.maxCapacity <= ticketCategory.totalAssistants
				) {
					console.log(
						`Las entradas de la categoria ${ticketCategory.name} se encuentran agotadas`
					)
					console.log(ticketCategory.maxCapacity)
					console.log(ticketCategory.totalAssistants)
					return `Las entradas de la categoria ${ticketCategory.name} se encuentran agotadas`
				} else if (
					ticketCategory.totalAssistants +
						ticketCategoriesObject[ticketCategory.id] >
					ticketCategory.maxCapacity
				) {
					console.log(
						`No hay suficientes entradas disponibles para la categoria ${ticketCategory.name}. Intenta reduciendo la cantidad`
					)
					return `No hay suficientes entradas disponibles para la categoria ${ticketCategory.name}. Intenta reduciendo la cantidad`
				}
			})
			const price = ticketCategories.reduce(
				(accumalator, tc) => accumalator + tc.price,
				0
			)
			if (price - discountCode.discount > 0) {
				console.log('Esta funcion es solo entradas gratis')
				return 'Esta funcion es solo entradas gratis'
			}
			for (const ticketCategoryID in ticketCategoriesObject) {
				for (let i = 0; i < ticketCategoriesObject[ticketCategoryID]; i++) {
					const res = await createTicket(
						args.eventID,
						ticketCategoryID,
						env,
						identity.username,
						args.code,
						uuidv4()
					)
					await incrementTotalAssistantsTicketCategory(ticketCategoryID, env)
				}
			}
			incrementDiscountCodeUse(args.code, args.eventID, env)
			console.log('SUCCESS')
			return 'SUCCESS'
		}
	} catch (err) {
		console.log('Error', err)
		return 'Ocurrio un error'
	}
}
