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

exports.handler = async ({ typeName, arguments: args, identity }, context) => {
	if (typeName !== 'Mutation') {
		return 'el tipo de request de ve ser Mutation'
	}
	if (!arguments.acceptanceToken) {
		return 'Se requiere un token de aceptacion'
	} else if (!arguments.customerEmail) {
		return 'Se requiere un correo electronico'
	} else if (!arguments.payment_source_id) {
		return 'Se requiere un id de fuente de pago'
	} else if (!arguments.token) {
		return 'se requiere el token'
	} else if (!arguments.eventID) {
		return 'Se requiere un evento'
	} else if (!arguments.type) {
		return 'Se requiere un tipo de pago'
	}
	let event, discountCode
	const ticketID = uuidv4()
	// try {
	// 	if (arg.discountCode) {
	// 		const { Responses } = await getBatchItems(
	// 			docClient,
	// 			arguments.discountCode,
	// 			arguments.eventID
	// 		)
	// 		;[discountCode, event] = Responses.map((item) => item.Item)
	// 		if (discountCode && event) {
	// 			if (
	// 				discountCode.maxUse &&
	// 				discountCode.maxUse <= discountCode.actualUse
	// 			) {
	// 				return 'El codigo ya ha sobrepasado su limite de uso'
	// 			} else if (new Date(discountCode.validUntil) < new Date()) {
	// 				return 'El codigo ya no es valido para esta fecha'
	// 			} else if (
	// 				new Date(`${event.finishDate}T${event.finshTime}Z`) < new Date()
	// 			) {
	// 				return 'Este evento ya ocurrio'
	// 			} else if (event.needsCode && discountCode.eventID !== event.id) {
	// 				return 'Se necesita un codigo valido'
	// 			} else if (event.maxCapacity <= event.totalAssistants) {
	// 				return 'Las entradas estan agotadas'
	// 			}
	// 			await writeBatchItemsWithDiscount(
	// 				docClient,
	// 				event.id,
	// 				ticketID,
	// 				identity,
	// 				discountCode.code
	// 			)
	// 		} else {
	// 			return 'Error en la base de datos'
	// 		}
	// 	} else {
	// 		const { Item } = await getEvent(docClient, arguments.eventID)
	// 		event = Item
	// 		if (new Date(`${event.finishDate}T${event.finishTime}Z`) < new Date())
	// 			return 'Este evento ya ocurrio'
	// 		else if (event.needsCode) {
	// 			return 'El evento necesita un codigo de descuento'
	// 		} else if (event.maxCapacity <= event.totalAssistants) {
	// 			return 'Las entradas estan agotadas'
	// 		}
	// 		await writeBatchItems(docClient, event.id, ticketID, identity)
	// 	}
	// } catch (err) {
	// 	console.log('Error', err)
	// 	return 'Lo Sentimos, No pudimos crear tu entrada! Por favor revisa que la inforacion tuya y del evento este en orden.'
	// }

	// try {
	// 	const body = {
	// 		acceptance_token: arguments.acceptanceToken,
	// 		amount_in_cents: discountCode
	// 			? (event.price - discountCode.discount) * 100
	// 			: event.price * 100,
	// 		currency: 'COP',
	// 		customer_email: arguments.customerEmail,
	// 		payment_method: {
	// 			installments: arguments.installments,
	// 			token: arguments.token,
	// 			type: arguments.type,
	// 		},
	// 		reference: uuidv4(),
	// 		payment_source_id: arguments.payment_source_id,
	// 	}

	// 	const response = await initPayment(body)
	// 	if (response && response.data) {
	// 		const {
	// 			id,
	// 			amount_in_cents,
	// 			reference,
	// 			customer_email,
	// 			payment_method_type,
	// 			status,
	// 		} = response.data

	// 		const transaction = {
	// 			id,
	// 			amount_in_cents,
	// 			reference,
	// 			customer_email,
	// 			payment_method_type,
	// 			status,
	// 		}
	// 		const res = await updateTicket(docClient, ticketID, transaction)
	// 	} else {
	// 		return 'Error al recibir los datos de wompi'
	// 	}
	// } catch (err) {
	// 	console.log('Error', err)
	// 	discountCode !== undefined
	// 		? await rollbackWithDiscountCode(
	// 				docClient,
	// 				arguments.eventID,
	// 				ticketID,
	// 				identity,
	// 				arguments.code
	// 		  )
	// 		: await rollBack(docClient, arguments.eventID, ticketID, identity)
	// 	return 'Lo Sentimos, No pudimos crear tu entrada! Por favor revisa que la inforacion tuya y del evento este en orden 2'
	// }

	return 'SUCCESS'
}
