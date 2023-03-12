const AWS = require('aws-sdk')
const axios = require('axios')

const getTicket = async (docClient, id) => {
	return await docClient
		.get({
			TableName: process.env.TICKETTABLE,
			Key: {
				id,
			},
		})
		.promise()
}

const fetchTransaction = async (id) => {
	return await axios.get(
		`https://production.wompi.co/v1/transactions/${id}`,
		{
			headers: {
				Authorization: process.env.AUTH,
			},
		},
		{ timeout: 10000 }
	)
}
const updateTicket = async (docClient, id, status, async_payment_url = '') => {
	return await docClient
		.update({
			TableName: process.env.TICKETTABLE,
			Key: {
				id,
			},
			UpdateExpression:
				'set #transaction.#status = :status , #transaction.#async_payment_url = :async_payment_url',
			ExpressionAttributeValues: {
				':status': status,
				':async_payment_url': async_payment_url,
			},
			ExpressionAttributeNames: {
				'#transaction': 'transaction',
				'#status': 'status',
				'#async_payment_url': 'async_payment_url',
			},
			ReturnValues: 'ALL_NEW',
		})
		.promise()
}

const rollBack = async (docClient, eventID, ticketID) => {
	try {
		return await docClient
			.transactWrite({
				TransactItems: [
					// {
					//   Delete: {
					//     TableName: process.env.TICKETTABLE,
					//     Key: {
					//       id: ticketID,
					//     },
					//   },
					// },
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
							UpdateExpression:
								'SET #totalAssistants = #totalAssistants - :dec',
						},
					},
				],
			})
			.promise()
	} catch (err) {
		console.log(err)
		return 'Error en el rollback'
	}
}

const rollbackWithDiscountCode = async (docClient, eventID, ticketID, code) => {
	try {
		return await docClient
			.transactWrite({
				TransactItems: [
					// {
					//   Delete: {
					//     TableName: process.env.TICKETTABLE,
					//     Key: {
					//       id: ticketID,
					//     },
					//   },
					// },
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
							UpdateExpression:
								'SET #totalAssistants = #totalAssistants - :dec',
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
	} catch (err) {
		console.log(err)
		return 'Error en el rollback'
	}
}

exports.handler = async (event) => {
	const docClient = new AWS.DynamoDB.DocumentClient()
	const { arguments, identity } = event
	try {
		let { Item: ticket } = await getTicket(docClient, arguments.ticketID)
		if (ticket.transaction && ticket.transaction.status === 'PENDING') {
			const { data } = await fetchTransaction(ticket.transaction.id)
			console.log(data.data)
			const { status } = data.data
			let async_payment_url = ''
			if (
				data &&
				data.data &&
				data.data.payment_method &&
				data.data.payment_method.extra &&
				data.data.payment_method.extra.async_payment_url
			) {
				async_payment_url = data.data.payment_method.extra.async_payment_url
			}
			const {
				Attributes: {
					transaction: { status: newStatus, async_payment_url: newURL },
				},
			} = await updateTicket(docClient, ticket.id, status, async_payment_url)
			ticket.transaction.status = newStatus
			ticket.transaction.async_payment_url = newURL
			if (
				newStatus === 'ERROR' ||
				newStatus === 'DECLINED' ||
				newStatus === 'VOIDED'
			) {
				ticket.code !== undefined
					? await rollbackWithDiscountCode(
							docClient,
							ticket.eventID,
							ticket.id,
							ticket.code
					  )
					: await rollBack(docClient, ticket.eventID, ticket.id)
			}
		}

		return ticket.transaction
	} catch (err) {
		console.log('ERROR', err)
		return new Error('Ocurrio un error en la base de datos')
	}
}
