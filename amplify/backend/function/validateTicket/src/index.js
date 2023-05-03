/* Amplify Params - DO NOT EDIT
	API_APPAMPLIFY_EVENTTABLE_ARN
	API_APPAMPLIFY_EVENTTABLE_NAME
	API_APPAMPLIFY_GRAPHQLAPIENDPOINTOUTPUT
	API_APPAMPLIFY_GRAPHQLAPIIDOUTPUT
	API_APPAMPLIFY_GRAPHQLAPIKEYOUTPUT
	API_APPAMPLIFY_TICKETCATEGORYTABLE_ARN
	API_APPAMPLIFY_TICKETCATEGORYTABLE_NAME
	API_APPAMPLIFY_TICKETTABLE_ARN
	API_APPAMPLIFY_TICKETTABLE_NAME
	ENV
	REGION
Amplify Params - DO NOT EDIT */

import { default as fetch, Request } from "node-fetch";
const GRAPHQL_ENDPOINT = process.env.API_APPAMPLIFY_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_APPAMPLIFY_GRAPHQLAPIKEYOUTPUT;

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
  console.log(`EVENT: ${JSON.stringify(event)}`);
  event = JSON.parse(event.body);
  event.ticketId = event.ticketId.trim();
  const query = `query MyQuery{
  getTicket(id: "${event.ticketId}") {
    eventID
    didAssist
    ticketCategory {
      name
    }
  }
}
	`;

  var mutation = `mutation MyMutation($didAssist: Boolean = true) {
  updateTicket(input: {id: "${event.ticketId}", didAssist: $didAssist}){id}
}`;
  console.log(`QUERY: ${query}`);
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({ query }),
  };

  const options2 = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({ query: mutation, variables: { didAssist: true } }),
  };
  console.log(`OPTIONS: ${JSON.stringify(options)} `);
  console.log(`OPTIONS2: ${JSON.stringify(options2)} `);
  const request = new Request(GRAPHQL_ENDPOINT, options);
  const request2 = new Request(GRAPHQL_ENDPOINT, options2);
  let body2;
  let statusCode = 200;
  let body;
  let response;

  try {
    console.log(`REQUEST: ${JSON.stringify(request)}`);
    response = await fetch(request);
    console.log(`RESPONSE: ${JSON.stringify(response)}`);
    body = await response.json();
    console.log(`BODY: ${JSON.stringify(body)}`);
    console.log(`Body.data: ${JSON.stringify(body.data)}`);
    if (body.errors) statusCode = 400;
  } catch (error) {
    console.log(`ERROR: ${JSON.stringify(error)}`);
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
  }
  try {
    console.log(`REQUEST: ${JSON.stringify(request2)}`);
    response = await fetch(request2);
    console.log(`RESPONSE: ${JSON.stringify(response)}`);
    body2 = await response.json();
    console.log(`BODY: ${JSON.stringify(body2)}`);
    console.log(`Body.data: ${JSON.stringify(body2.data)}`);
  } catch (error) {}
  console.log("aca", body.data);
  if (
    body.data.getTicket === null ||
    body.data.getTicket.eventID !== event.eventID
  ) {
    console.log("Invalid ticket", body.data.getTicket);
    return {
      statusCode: 400,
      body: JSON.stringify("Ticket is not valid for this event"),
    };
  }
  if (body.data.getTicket.didAssist) {
    console.log("Validated ticket", body.data.getTicket.didAssist);
    return {
      statusCode: 400,
      body: JSON.stringify("Ticket already validated"),
    };
  }
  console.log("Status 200", body.data.getTicket.ticketCategory.name);
  return {
    statusCode: 200,
    //  Uncomment below to enable CORS requests
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "*",
    },
    body: JSON.stringify(body.data.getTicket.ticketCategory.name),
  };
};
