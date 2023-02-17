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
import crypto from "@aws-crypto/sha256-js";
import { defaultProvider } from "@aws-sdk/credential-provider-node";
import { SignatureV4 } from "@aws-sdk/signature-v4";
import { HttpRequest } from "@aws-sdk/protocol-http";
import { default as fetch, Request } from "node-fetch";
const GRAPHQL_ENDPOINT = process.env.API_APPAMPLIFY_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_APPAMPLIFY_GRAPHQLAPIKEYOUTPUT;
const AWS_REGION = process.env.AWS_REGION;
const { Sha256 } = crypto;
/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
  console.log(`EVENT: ${JSON.stringify(event)}`);
  const query = `query MyQuery {
  getTicket(id: $id) {
    eventID
    ticketCategory {
      name
    }
  }
}
	`;

  const endpoint = new URL(GRAPHQL_ENDPOINT);

  const signer = new SignatureV4({
    credentials: defaultProvider(),
    region: AWS_REGION,
    service: "appsync",
    sha256: Sha256,
  });

  const variables = { id: event.ticketId };
  console.log(`QUERY: ${query}`);
  const requestToBeSigned = new HttpRequest({
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      host: endpoint.host,
    },
    hostname: endpoint.host,
    body: JSON.stringify({ query, variables }),
    path: endpoint.pathname,
  });

  const signed = await signer.sign(requestToBeSigned);
  const request = new Request(endpoint, signed);

  let statusCode = 200;
  let body;
  let response;

  try {
    console.log(`REQUEST: ${JSON.stringify(request)}`);
    response = await fetch(request);
    console.log(`RESPONSE: ${JSON.stringify(response)}`);
    body = await response.json();
    console.log(`BODY: ${JSON.stringify(body)}`);
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

  if (body.data.getTicket.eventId !== event.eventId)
    return {
      statusCode: 400,
      body: JSON.stringify("Ticket is not valid for this event"),
    };

  return {
    statusCode: 200,
    //  Uncomment below to enable CORS requests
    //  headers: {
    //      "Access-Control-Allow-Origin": "*",
    //      "Access-Control-Allow-Headers": "*"
    //  },
    body: JSON.stringify(body.event.getTicket.ticketCategory.name),
  };
};
