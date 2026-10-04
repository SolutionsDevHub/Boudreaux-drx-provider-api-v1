%dw 2.0
output application/json
---
{
	"correlationId": vars.correlationId,
	"flowName": flow.name,
	("payload": payload) if(!isEmpty(payload)),
	("queryParams": attributes.queryParams) if(!isEmpty(attributes.queryParams)),
	"retryCount": vars.retryCount default 0,
	("uriParams": attributes.uriParams) if(!isEmpty(attributes.uriParams))
}