const constants = './wompiConstants.js'
exports.initPayment = (body, env, axios) => {
	return axios
		.post(
			'https://production.wompi.co/v1/transactions',
			body,
			{
				headers: {
					Authorization: constants[env].auth,
				},
			},
			{ timeout: 10000 }
		)
		.then((response) => response.data)
}
