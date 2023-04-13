const constants = require('./constants')
const AWS = require('aws-sdk')
const ddb = new AWS.DynamoDB()
const docClient = new AWS.DynamoDB.DocumentClient()
exports.createUser = async (event, env) => {
	let date = new Date()
	let params = {
		Item: {
			id: { S: event.request.userAttributes.sub },
			__typename: { S: 'User' },
			_lastChangedAt: { N: (date.getTime() * 1000).toString() },
			_version: { N: event.version },
			avatar: {
				M: {
					bucket: {
						S: constants[env].bucket,
					},
					key: {
						S: 'images/empty-profile.png',
					},
					region: {
						S: 'us-east-1',
					},
				},
			},
			name: { S: event.request.userAttributes.name },
			email: { S: event.request.userAttributes.email },
			createdAt: { S: date.toISOString() },
			updatedAt: { S: date.toISOString() },
		},
		TableName: constants[env].user,
	}
	try {
		await ddb.putItem(params).promise()
	} catch (err) {
		console.log('Error', err)
		throw new Error('Error en la base de datos')
	}
}

exports.getUser = async (userID, env) => {
	const params = {
		TableName: constants[env].user,
		Key: {
			id: userID,
		},
	}
	try {
		const res = await docClient.get(params).promise()
		return res.Item
	} catch (err) {
		console.log('Error al consultar el usuario', err)
		throw new Error('Error en la base de datos')
	}
}

exports.createTicket = async (
	eventID,
	ticketCategoryID,
	env,
	username,
	code,
	id
) => {
	const date = new Date().toISOString()
	const params = {
		TableName: constants[env].ticket,
		Item: {
			id: id,
			__typename: 'Ticket',
			eventID: eventID,
			didAssist: false,
			userID: username,
			updatedAt: date,
			createdAt: date,
			ticketCategoryID: ticketCategoryID,
		},
	}
	if (code) {
		params.Item.code = code
	}
	try {
		await docClient.put(params).promise()
	} catch (err) {
		console.log('Error al crear la entrada', err)
		throw new Error('Error en la base de datos')
	}
}

exports.incrementTotalAssistantsEvent = async (eventID, env) => {
	const params = {
		TableName: constants[env].event,
		Key: {
			id: eventID,
		},
		UpdateExpression: 'set totalAssistants = totalAssistants + :inc',
		ExpressionAttributeValues: {
			':inc': 1,
		},
		ReturnValues: 'UPDATED_NEW',
	}
	try {
		return await docClient.update(params).promise()
	} catch (err) {
		console.log('Error al incrementar los asistentes totales del evento', err)
		throw new Error('Error en la base de datos')
	}
}

exports.getEvent = async (eventID, env) => {
	const params = {
		TableName: constants[env].event,
		Key: {
			id: eventID,
		},
	}
	try {
		const res = await docClient.get(params).promise()
		return res.Item
	} catch (err) {
		console.log('Error al consultar el evento', err)
		throw new Error('Error en la base de datos')
	}
}
exports.getTicketCategory = async (ticketCategoryID, env) => {
	const params = {
		TableName: constants[env].ticketCategory,
		Key: {
			id: ticketCategoryID,
		},
	}
	try {
		const res = await docClient.get(params).promise()
		return res.Item
	} catch (err) {
		console.log('Error al consultar la categoria de la entrada', err)
		throw new Error('Error en la base de datos')
	}
}

exports.incrementTotalAssistantsTicketCategory = async (
	ticketCategoryID,
	env
) => {
	const params = {
		TableName: constants[env].ticketCategory,
		Key: {
			id: ticketCategoryID,
		},
		UpdateExpression: 'set totalAssistants = totalAssistants + :inc',
		ExpressionAttributeValues: {
			':inc': 1,
		},
		ReturnValues: 'UPDATED_NEW',
	}
	try {
		return await docClient.update(params).promise()
	} catch (err) {
		console.log('Error al incrmentar los asitentes de la categoria', err)
		throw new Error('Error en la base de datos')
	}
}

exports.incrementDiscountCodeUse = async (code, eventID, env) => {
	const params = {
		TableName: constants[env].discountCode,
		Key: {
			code: code,
			eventID: eventID,
		},
		UpdateExpression: 'set actualUse = actualUse + :inc',
		ExpressionAttributeValues: {
			':inc': 1,
		},
		ReturnValues: 'UPDATED_NEW',
	}
	try {
		return await docClient.update(params).promise()
	} catch (err) {
		console.log('Error al incrmentar los asitentes de la categoria', err)
		throw new Error('Error en la base de datos')
	}
}

exports.getDiscountCodesByEvent = async (eventID, env) => {
	const params = {
		TableName: constants[env].discountCode,
		IndexName: 'byEvent',
		KeyConditionExpression: 'eventID = :eventID',
		ExpressionAttributeValues: {
			':eventID': eventID,
		},
	}
	try {
		const res = await docClient.query(params).promise()
		return res.Items
	} catch (err) {
		console.log('Error al consultar los codigos de descuento del evento', err)
		throw new Error('Error en la base de datos')
	}
}

exports.getDiscountCode = async (code, eventID, env) => {
	const params = {
		TableName: constants[env].discountCode,
		Key: {
			code: code,
			eventID: eventID,
		},
	}
	try {
		const res = await docClient.get(params).promise()
		return res.Item
	} catch (err) {
		console.log('Error al consultar el codigo de descuento', err)
		throw new Error('Error en la base de datos')
	}
}
exports.getTicketsByUser = async (userID, env) => {
	const params = {
		TableName: constants[env].ticket,
		IndexName: 'byUser',
		KeyConditionExpression: 'userID = :userID',
		ExpressionAttributeValues: {
			':userID': userID,
		},
	}
	try {
		const res = await docClient.query(params).promise()
		return res.Items
	} catch (err) {
		console.log('error al consultar las entradas del usuario', err)
		throw new Error('Error en la base de datos')
	}
}

exports.getPaymentMethod = async (paymentMethodID, env) => {
	const params = {
		TableName: constants[env].paymentMethod,
		Key: {
			id: paymentMethodID,
		},
	}
	try {
		const res = await docClient.get(params).promise()
		return res.Item
	} catch (err) {
		console.log('Error al consultar el codigo de descuento', err)
		throw new Error('Error en la base de datos')
	}
}
exports.createTransaction = async (
	uuid,
	env,
	eventID,
	ticketCategories,
	ticketCategoriesObject,
	user,
	discountCode,
	paymentData
) => {
	try {

		const params = {
			TransactItems: [],
		}
		const incrementEventParams = {
			Update: {
				TableName: constants[env].event,
				Key: { id: eventID },
				UpdateExpression: 'set #totalAssistants = #totalAssistants + :inc',
				ExpressionAttributeNames: {
					'#totalAssistants': 'totalAssistants',
				},
				ExpressionAttributeValues: {
					':inc': ticketCategories.length,
				},
			},
		}
		params.TransactItems.push(incrementEventParams)
		ticketCategories.forEach((tc) => {
			const ticketParams = {
				Put: {
					TableName: constants[env].ticket,
					Item: {
						id: uuid(),
						eventID: eventID,
						createdAt: new Date().toISOString(),
						updatedAt: new Date().toISOString(),
						didAssist: false,
						userID: user.id,
						__typename: 'Ticket',
						ticketCategoryID: tc.id,
					},
				},
			}
			if (discountCode) {
				ticketParams.Put.Item.code = discountCode.code
			}
			if (paymentData) {
				ticketParams.Put.Item.transaction = {
					id: paymentData.id,
					amount_in_cents: paymentData.amount_in_cents,
					customer_email: paymentData.customer_email,
					payment_method_type: paymentData.payment_method.type,
					reference: paymentData.reference,
					status: paymentData.status,
				}
			}
			params.TransactItems.push(ticketParams)
		})
		if (discountCode) {
			const discountCodeUpdate = {
				Update: {
					TableName: constants[env].discountCode,
					Key: { code: discountCode.code, eventID: eventID },
					UpdateExpression: 'set #actualUse = #actualUse + :inc',
					ExpressionAttributeNames: {
						'#actualUse': 'actualUse',
					},
					ExpressionAttributeValues: {
						':inc': 1,
					},
				},
			}
			params.TransactItems.push(discountCodeUpdate)
		}
		for (ticketCategoryID in ticketCategoriesObject) {
			const ticketCategoryUpdateParams = {
				Update: {
					TableName: constants[env].ticketCategory,
					Key: { id: ticketCategoryID },
					UpdateExpression: 'set #totalAssistants = #totalAssistants + :inc',
					ExpressionAttributeNames: {
						'#totalAssistants': 'totalAssistants',
					},
					ExpressionAttributeValues: {
						':inc': ticketCategoriesObject[ticketCategoryID],
					},
				},
			}
			params.TransactItems.push(ticketCategoryUpdateParams)
		}
		console.log("TRANSACTION PARAMETERS", JSON.stringify(params))
		const res = await docClient.transactWrite(params).promise()
		console.log("Response from docClient", res)
		return res
	} catch (err) {
		console.log('Error al crear la transaccion', err)
		throw new Error('Error en la base de datos')
	}
}
