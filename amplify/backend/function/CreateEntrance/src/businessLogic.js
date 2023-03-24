
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
const businessLogic = async (eventID, ticketCategoriesID, identity, userID, code) => {

  try {
    if (!eventID) {

      return { error: "Se requiere un evento" }
    }
    if (!ticketCategoriesID || ticketCategoriesID.length === 0) {
      return { error: 'Se requiere una Categoria de Entrada' }
    }
    if (ticketCategoriesID.length > 10) {
      return { error: 'La cantidad maxima permitida de compra de cualquier evento es 20' }
    }
    if (!identity) {
      return { error: "se debe estar autenticado" }
    } else {
      const ticketCategoriesObject = {}
      ticketCategoriesID.forEach((tcID) => {
        if (ticketCategoriesObject[tcID] !== undefined) {
          ticketCategoriesObject[tcID] = ticketCategoriesObject[tcID] + 1
        } else {
          ticketCategoriesObject[tcID] = 1
        }
      })
      const event = await getEvent(eventID, env)
      console.log("EVENT ", event)
      if (!event) {
        return { error: "No se encontro el evento" }
      }
      const user = await getUser(userID, env)
      console.log("USER ", user)
      if (!user) {
        return { error: "No se encontro el usuario" }
      }
      const ticketCategories = []
      ticketCategoriesID.forEach(async (id) => {
        const Item = await getTicketCategory(id, env)

        if (!Item) {
          return { error: 'No se ha encontrado la categoria de la entrada' }
        }
        ticketCategories.push(Item)
      })
      console.log("ticketCategories ", ticketCategories)
      const userTickets = await getTicketsByUser(userID, env)
      console.log("userTickets ", userTickets)
      const eventDiscountCodes = await getDiscountCodesByEvent(
        eventID,
        env
      )
      console.log("eventDiscountCodes ", eventDiscountCodes)
      const discountCode = code
        ? await getDiscountCode(code, eventID, env)
        : null
      console.log("discountCode ", discountCode)
      let selectedPaymentMethod = null
      if (user.userSelectedPaymentMethodId) {
        selectedPaymentMethod = await getPaymentMethod(
          user.userSelectedPaymentMethodId,
          env
        )
      }
      console.log("selectedPaymentMethod ", selectedPaymentMethod)
      const price = ticketCategories.reduce(
        (accumalator, tc) => accumalator + tc.price,
        0
      )
      console.log("price ", price)
      const discount = discountCode ? discountCode.discount : 0
      console.log("discount ", discount)
      if (!selectedPaymentMethod && price - discount > 0) {
        console.log("MAL 9")
        return {
          error: 'No tienes un metodo de pago seleccionado pero tus entradas tienen un costo mayor a 0'
        }

      }
      if (
        selectedPaymentMethod &&
        !(
          selectedPaymentMethod.type === 'NEQUI' ||
          selectedPaymentMethod.type === 'CARD'
        )
      ) {
        console.log("MAL 7")
        return { error: "Solo NEQUI O Trajeta" }
      }
      if (
        event.maxBuyQuantity &&
        event.maxBuyQuantity <
        ticketCategoriesID.length +
        userTickets.filter((t) => t.eventID === event.id).length
      ) {
        console.log("MAL 6")
        return { error: `Estas comprando mas entradas de las permitidas. Cantidad de entrdas permititdas: ${event.maxBuyQuantity}` }
      }
      if (new Date(event.finishDateTime) < new Date()) {
        console.log("MAL 5")
        return { error: 'El evento ya ha ocurrido' }
      } else if (
        event.needsCode &&
        (!code ||
          eventDiscountCodes.map((c) => c.code).indexOf(code) === -1)
      ) {
        console.log("MAL 4")
        return { error: 'Se necesita un codigo valido' }
      }
      ticketCategories.forEach((ticketCategory) => {
        if (ticketCategory.eventID !== event.id) {
          console.log("MAL 3")
          return { error: `La Categoria con el identificador ${ticketCategory.id} no concuerda con el evento ${event.id}` }
        } else if (
          ticketCategory.maxCapacity <= ticketCategory.totalAssistants
        ) {
          console.log("MAL 2")
          return { error: `Las entradas de la categoria ${ticketCategory.name} se encuentran agotadas` }
        } else if (
          ticketCategory.totalAssistants +
          ticketCategoriesObject[ticketCategory.id] >
          ticketCategory.maxCapacity
        ) {
          console.log("MAL 1")
          return { error: `Las entradas de la categoria ${ticketCategory.name} se encuentran agotadas` }
        }
      })
      console.log("BIEN ")
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
    return { error: err.message }
  }
}

exports.businessLogic = businessLogic;