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
  const query = `query MyQuery($id: ID!) {
  getTicket(id: $id) {
    eventID
    ticketCategory {
      name
    }
  }
}
	`;
  const variables = { id: event.ticketId };
  console.log(`QUERY: ${query}`);
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({ query, variables }),
  };
  console.log(`OPTIONS: ${JSON.stringify(options)} `);
  const request = new Request(GRAPHQL_ENDPOINT, options);

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
  console.log("aca", body.data);
  if (body.data.getTicket.eventID !== event.eventID)
    return {
      statusCode: 400,
      body: JSON.stringify("Ticket is not valid for this event"),
    };

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
