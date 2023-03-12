const AWS = require('aws-sdk')
const { v4: uuidv4 } = require('uuid')
const axios = require('axios')
const { getEvent } = require('/opt/models')
const env = process.env.ENV

const initPayment = (body) => {
	return axios
		.post(
			'https://production.wompi.co/v1/transactions',
			body,
			{
				headers: {
					Authorization: process.env.AUTH,
				},
			},
			{ timeout: 10000 }
		)
		.then((response) => response.data)
}

const getBatchItems = async (docClient, discountCode, eventID) => {
	return await docClient
		.transactGet({
			TransactItems: [
				{
					Get: {
						TableName: process.env.DISCOUNTTABLE,
						Key: {
							code: discountCode,
							eventID: eventID,
						},
					},
				},
				{
					Get: {
						TableName: process.env.EVENTTABLE,
						Key: {
							id: eventID,
						},
					},
				},
			],
		})
		.promise()
}

const writeBatchItemsWithDiscount = async (
	docClient,
	eventID,
	ticketID,
	identity,
	code
) => {
	return await docClient
		.transactWrite({
			TransactItems: [
				{
					Put: {
						TableName: process.env.TICKETTABLE,
						Item: {
							id: ticketID,
							__typename: 'Ticket',
							eventID: eventID,
							didAssist: false,
							userID: identity.username,
							updatedAt: new Date().toISOString(),
							createdAt: new Date().toISOString(),
							code,
						},
					},
				},
				{
					Update: {
						ExpressionAttributeNames: {
							'#totalAssistants': 'totalAssistants',
						},
						ExpressionAttributeValues: {
							':inc': 1,
						},
						Key: {
							id: eventID,
						},
						TableName: process.env.EVENTTABLE,
						UpdateExpression: 'SET #totalAssistants = #totalAssistants + :inc',
					},
				},
				{
					Update: {
						ExpressionAttributeNames: { '#actualUse': 'actualUse' },
						ExpressionAttributeValues: {
							':inc': 1,
						},
						Key: {
							eventID,
							code,
						},
						TableName: process.env.DISCOUNTTABLE,
						UpdateExpression: 'SET #actualUse = #actualUse + :inc',
					},
				},
			],
			ReturnConsumedCapacity: 'TOTAL',
			ReturnItemCollectionMetrics: 'SIZE',
		})
		.promise()
}

const writeBatchItems = async (docClient, eventID, ticketID, identity) => {
	return await docClient
		.transactWrite({
			TransactItems: [
				{
					Put: {
						TableName: process.env.TICKETTABLE,
						Item: {
							id: ticketID,
							__typename: 'Ticket',
							eventID,
							didAssist: false,
							userID: identity.username,
							updatedAt: new Date().toISOString(),
							createdAt: new Date().toISOString(),
						},
					},
				},
				{
					Update: {
						ExpressionAttributeNames: {
							'#totalAssistants': 'totalAssistants',
						},
						ExpressionAttributeValues: {
							':inc': 1,
						},
						Key: {
							id: eventID,
						},
						TableName: process.env.EVENTTABLE,
						UpdateExpression: 'SET #totalAssistants = #totalAssistants + :inc',
					},
				},
			],
		})
		.promise()
}

const rollBack = async (docClient, eventID, ticketID, identity) => {
	return await docClient
		.transactWrite({
			TransactItems: [
				{
					Delete: {
						TableName: process.env.TICKETTABLE,
						Key: {
							id: ticketID,
						},
					},
				},
				{
					Update: {
						ExpressionAttributeNames: {
							'#totalAssistants': 'totalAssistants',
						},
						ExpressionAttributeValues: {
							':dec': 1,
						},
						Key: {
							id: eventID,
						},
						TableName: process.env.EVENTTABLE,
						UpdateExpression: 'SET #totalAssistants = #totalAssistants - :dec',
					},
				},
			],
		})
		.promise()
}

const rollbackWithDiscountCode = async (docClient, eventID, ticketID, code) => {
	return await docClient
		.transactWrite({
			TransactItems: [
				{
					Delete: {
						TableName: process.env.TICKETTABLE,
						Key: {
							id: ticketID,
						},
					},
				},
				{
					Update: {
						ExpressionAttributeNames: {
							'#totalAssistants': 'totalAssistants',
						},
						ExpressionAttributeValues: {
							':dec': 1,
						},
						Key: {
							id: eventID,
						},
						TableName: process.env.EVENTTABLE,
						UpdateExpression: 'SET #totalAssistants = #totalAssistants - :dec',
					},
				},
				{
					Update: {
						ExpressionAttributeNames: { '#actualUse': 'actualUse' },
						ExpressionAttributeValues: {
							':dec': 1,
						},
						Key: {
							eventID,
							code,
						},
						TableName: process.env.DISCOUNTTABLE,
						UpdateExpression: 'SET #actualUse = #actualUse - :dec',
					},
				},
			],
		})
		.promise()
}

const updateTicket = async (docClient, ticketID, transaction) => {
	return await docClient
		.update({
			TableName: process.env.TICKETTABLE,
			Key: {
				id: ticketID,
			},
			UpdateExpression: 'set #transaction = :transaction',
			ExpressionAttributeValues: {
				':transaction': transaction,
			},
			ExpressionAttributeNames: {
				'#transaction': 'transaction',
			},
			ReturnValues: 'UPDATED_NEW',
		})
		.promise()
}

exports.handler = async ({ typeName, arguments: args, identity }, context) => {
	if (typeName !== 'Mutation') {
		return 'ERROR: el tipo de request de ve ser Mutation'
	}
	if (!args.acceptanceToken) {
		return 'ERROR: Se requiere un token de aceptacion'
	} else if (!args.customerEmail) {
		return 'ERROR: Se requiere un correo electronico'
	} else if (!args.userLegalIdType) {
		return 'ERROR: Se requiere un tipo de id'
	} else if (!args.userLegalId) {
		return 'ERROR: Se requiere un id'
	} else if (!args.eventID) {
		return 'ERROR: Se requiere un evento'
	} else if (!args.financialInstitutionCode) {
		return 'ERROR: Se requiere una institucion financiera'
	}
	let event, discountCode
	const docClient = new AWS.DynamoDB.DocumentClient()
	const ticketID = uuidv4()
	try {
		if (args.discountCode) {
			const { Responses } = await getBatchItems(
				docClient,
				args.discountCode,
				args.eventID
			)
			;[discountCode, event] = Responses.map((item) => item.Item)
			if (discountCode && event) {
				if (
					discountCode.maxUse &&
					discountCode.maxUse <= discountCode.actualUse
				) {
					return 'ERROR: El codigo ya ha sobrepasado su limite de uso'
				} else if (new Date(discountCode.validUntil) < new Date()) {
					return 'ERROR: El codigo ya no es valido para esta fecha'
				} else if (
					new Date(`${event.finishDate}T${event.finshTime}Z`) < new Date()
				) {
					return 'ERROR: Este evento ya ocurrio'
				} else if (event.needsCode && discountCode.eventID !== event.id) {
					return 'ERROR: Se necesita un codigo valido'
				} else if (event.maxCapacity <= event.totalAssistants) {
					return 'ERROR: Las entradas estan agotadas'
				}
				await writeBatchItemsWithDiscount(
					docClient,
					event.id,
					ticketID,
					identity,
					discountCode.code
				)
			} else {
				return 'ERROR: Error en la base de datos'
			}
		} else {
			const event = await getEvent(args.eventID, env)
			if (new Date(`${event.finishDate}T${event.finishTime}Z`) < new Date())
				return 'ERROR: Este evento ya ocurrio'
			else if (event.needsCode) {
				return 'ERROR: El evento necesita un codigo de descuento'
			} else if (event.maxCapacity <= event.totalAssistants) {
				return 'ERROR: Las entradas estan agotadas'
			}
			await writeBatchItems(docClient, event.id, ticketID, identity)
		}
	} catch (err) {
		console.log('Error', err)
		return 'ERROR: Lo Sentimos, No pudimos crear tu entrada! Por favor revisa que la inforacion tuya y del evento este en orden.'
	}

	try {
		const body = {
			acceptance_token: args.acceptanceToken,
			amount_in_cents: discountCode
				? (event.price - discountCode.discount) * 100
				: event.price * 100,
			currency: 'COP',
			customer_email: args.customerEmail,
			payment_method: {
				type: 'PSE',
				user_type: 0, // Tipo de persona, natural (0) o jurídica (1)
				user_legal_id_type: args.userLegalIdType, // Tipo de documento, CC o NIT
				user_legal_id: args.userLegalId, // Número de documento
				financial_institution_code: args.financialInstitutionCode, // Código (`code`) de la institución financiera
				payment_description: `Compra de una entrada al evento ${event.title} con codigo de identificacion ${event.id}`, // Nombre de lo q
			},
			reference: uuidv4(),
		}

		const response = await initPayment(body)
		if (response && response.data) {
			const {
				id,
				amount_in_cents,
				reference,
				customer_email,
				payment_method_type,
				status,
			} = response.data

			const transaction = {
				id,
				amount_in_cents,
				reference,
				customer_email,
				payment_method_type,
				status,
			}
			const res = await updateTicket(docClient, ticketID, transaction)
			return ticketID
		} else {
			console.log(response)
			return 'ERROR: error al recibir los datos de wompi'
		}
	} catch (err) {
		console.log('Error', err)
		discountCode !== undefined
			? await rollbackWithDiscountCode(
					docClient,
					args.eventID,
					ticketID,
					identity,
					args.code
			  )
			: await rollBack(docClient, args.eventID, ticketID, identity)
		return 'ERROR: Lo Sentimos, No pudimos crear tu entrada! Por favor revisa que la inforacion tuya y del evento este en orden 2'
	}
}
