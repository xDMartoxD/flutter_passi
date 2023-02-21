/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */

const { createUser } = require('/opt/models')
const env = process.env.ENV
exports.handler = async (event, context) => {
  if (event.request.userAttributes.sub) {
    await createUser(event, env)
  } else {
    console.log('Error: Nothing was written to DynamoDB')
  }
  context.done(null, event)
}
