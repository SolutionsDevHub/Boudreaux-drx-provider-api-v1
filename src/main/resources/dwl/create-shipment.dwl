%dw 2.0
import * from dw::core::Strings
output application/json
// DRX sends fills either flat (id, prescription_id, external_id) or nested (fill.id, prescription.id)
fun partnerRef(f) = f.external_id default f.prescription.surescripts_erx_id default f.prescription.surescripts_erx_order_number
fun stripCode(r) = if (r is String) (if (r startsWith (vars.routing.code ++ ":")) substringAfter(r, ":") else null) else null
fun rxOf(f) = ((f.prescription_id default f.prescription.id) default "") as String
// the partner's order id for a fill routed through the mapping table
fun dbRef(f) = vars.routing.refsByRx[rxOf(f)]
// a shipment only carries the routed partner's fills: by prefix, or by the partner's recorded prescriptions
fun ownFill(f) = vars.routing.source match {
	case "prefix" -> stripCode(partnerRef(f)) != null
	case "db" -> dbRef(f) != null
	else -> true
}
---
{
	"shipment": {
		"tracking_number": payload.shipment.tracking_number,
		"carrier_code": payload.shipment.carrier_code
	},
	"fills": (payload.fills default []) filter ((f) -> ownFill(f)) map ((item, index) -> {
		"id": item.id default item.fill.id,
		"prescription_id": item.prescription_id default item.prescription.id,
		"external_id": if (vars.routing.source == "db") dbRef(item) else (stripCode(partnerRef(item)) default vars.routing.ref)
	})
}
