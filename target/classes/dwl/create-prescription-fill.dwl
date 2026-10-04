%dw 2.0
output application/json
---
{
	"id": payload.id,
	"prescription_id": payload.prescription_id default payload.prescription.id,
	"patient_id": payload.patient.id default payload.patient_id,
	"status": payload.status,
	"fill_date": payload.fill_date,
	"external_id": vars.routing.ref,
	"tracking_number": payload.tracking_number,
	"carrier_code": payload.carrier_code
}
