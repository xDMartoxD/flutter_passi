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
  API_APPAMPLIFY_TICKETTABLE_ARN
  API_APPAMPLIFY_TICKETTABLE_NAME
  API_APPAMPLIFY_USERTABLE_ARN
  API_APPAMPLIFY_USERTABLE_NAME
  ENV
  REGION
Amplify Params - DO NOT EDIT *//**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
const { v4: uuidv4 } = require('uuid')
const axios = require('axios')
const env = process.env.ENV
const { createTransaction } = require('/opt/models')

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
        error:
          'No hemos podido cancelar tu transaccion por favor comunicate con nosotros. Error: ' + err.message,
      }
    })
}
const db = async ({
  event,
  ticketCategories,
  discountCode,
  payed,
  paymentData,
  totalCost,
  ticketCategoriesObject,
  user,
}) => {
  try {
    if (paymentData?.payment_method_type === 'NEQUI') {
      return { data: paymentData.id }
    } else if (totalCost <= 0) {
      const response = await createTransaction(
        uuidv4,
        env,
        event.id,
        ticketCategories,
        ticketCategoriesObject,
        user,
        discountCode
      )
      console.log('response', response)
      return { data: 'SUCCESS' }
    } else {
      const response = await createTransaction(
        uuidv4,
        env,
        event.id,
        ticketCategories,
        ticketCategoriesObject,
        user,
        discountCode,
        paymentData
      )
      console.log('Response', response)
      return { data: 'SUCCESS' }
    }
  } catch (err) {
    console.log('Error ', err)
    if (payed) {
      cancelTransaction(paymentData.id)
    }
    return { error: err.message }
  }
}

exports.db = db;
