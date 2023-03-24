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
Amplify Params - DO NOT EDIT *//**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
const { v4: uuidv4 } = require('uuid')
const env = process.env.ENV
const axios = require('axios')

const initPayment = (body) => {
  return axios
    .post(
      'https://production.wompi.co/v1/transactions',
      body,
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
      return { error: err.message }
    })
}

const subscribe = async (id) => {
  const link = `https://production.wompi.co/v1/transactions/${id}`
  let data = await axios
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
      return { error: err }
    })

  if (data.status == 'PENDING') {
    return await subscribe(id)
  } else {
    console.log(data)
    return data
  }
}

const payment = async ({
  event,
  ticketCategoriesObject,
  ticketCategories,
  userTickets,
  eventDiscountCodes,
  discountCode,
  user,
  selectedPaymentMethod,
  acceptanceToken,
  installments
}) => {
  let payed = false
  try {

    const price = ticketCategories.reduce(
      (accumalator, tc) => accumalator + tc.price,
      0
    )
    const discount = discountCode ? discountCode.discount : 0
    if (price - discount > 0) {
      if (price - discount < 1500) {
        return { error: 'La transaccion minima posible es de 1500 COP' }
      }

      let body = {}
      if (selectedPaymentMethod.type === 'CARD') {
        body = {
          acceptance_token: acceptanceToken,
          amount_in_cents: (price - discount) * 100,
          currency: 'COP',
          customer_email: user.email,
          payment_method: {
            installments: installments,
            token: selectedPaymentMethod.token,
            type: selectedPaymentMethod.type,
          },
          reference: uuidv4(),
          payment_source_id: selectedPaymentMethod.paymentSourceID,
        }
      } else {
        body = {
          acceptance_token: acceptanceToken,
          amount_in_cents: (price - discount) * 100,
          currency: 'COP',
          customer_email: user.email,
          payment_method: {
            type: 'NEQUI',
            phone_number: selectedPaymentMethod.data.phone_number,
          },
          reference: uuidv4(),
          payment_source_id: selectedPaymentMethod.datapayment_source_id,
        }
      }
      const response = await initPayment(body)
      const { id, payment_method_type } = response.data
      if (payment_method_type === 'CARD') {
        const data = await subscribe(id)
        if (data.status === 'APPROVED') {
          payed = true
          return {
            event,
            ticketCategoriesObject,
            ticketCategories,
            userTickets,
            eventDiscountCodes,
            discountCode,
            payed,
            user,
            wompiData: response.data,
            paymentData: data,
            selectedPaymentMethod,
            totalCost: price - discount,
          }
        } else {
          return { error: 'La transaccion no fue aprovada ' + data.status }
        }
      } else {
        return {
          event,
          ticketCategoriesObject,
          ticketCategories,
          userTickets,
          eventDiscountCodes,
          discountCode,
          payed,
          user,
          paymentData: response.data,
          selectedPaymentMethod,
          totalCost: price - discount,
        }
      }
    } else {
      return {
        event,
        ticketCategoriesObject,
        ticketCategories,
        userTickets,
        eventDiscountCodes,
        discountCode,
        payed,
        user,
        totalCost: price - discount,
      }
    }
  } catch (err) {
    return { error: err.message, payed }
  }
}
exports.payment = payment;