%dw 2.0
output application/json
---
{
	"WSY": {
		"provider": p('wsy.provider'),
		"url": p('wsy.url'),
		"method": p('wsy.method')
	},
	"LUM": {
		"provider": p('lum.provider'),
		"url": p('lum.url'),
		"method": p('lum.method'),
		"header": if (!isEmpty(p('secure::lum.auth'))) {
			"Authorization": p('secure::lum.auth')
		} else {
			"userName": p('secure::lum.username'),
			"password": p('secure::lum.password')
		}
	},
	"AMB": {
		"provider": p('amb.provider'),
		"url": p('amb.url'),
		"method": p('amb.method'),
		"header": {
			"Authorization": p('secure::bsk.auth')
		}
	},
	"ARC": {
		"provider": p('arc.provider'),
		"url": p('arc.url'),
		"method": p('arc.method'),
		"header": {
			"clientId": p('secure::arc.clientId'),
			"clientSecret": p('secure::arc.clientSecret')
		}
	},
	"ASH": {
		"provider": p('ash.provider'),
		"url": p('ash.url'),
		"method": p('ash.method'),
		"header": {
			"clientId": p('secure::ash.clientId'),
			"clientSecret": p('secure::ash.clientSecret')
		}
	},
	"BSK": {
		"provider": p('bsk.provider'),
		"url": p('bsk.url'),
		"method": p('bsk.method'),
		"header": {
			"Authorization": p('secure::bsk.auth')
		}
	},
	"BGE": {
		"provider": p('bge.provider'),
		"url": p('bge.url'),
		"method": p('bge.method'),
		"header": {
			"X-DRX-Key": p('secure::bge.xdrxkey')
		}
	},
	"BOM": {
		"provider": p('bom.provider'),
		"url": p('bom.url'),
		"method": p('bom.method'),
		"header": if (!isEmpty(p('secure::bom.clientId'))) {
			"clientId": p('secure::bom.clientId'),
			"clientSecret": p('secure::bom.clientSecret')
		} else {}
	},
	"BND": {
		"provider": p('bnd.provider'),
		"url": p('bnd.url'),
		"method": p('bnd.method'),
		"header": {
			"clientId": p('secure::bnd.clientId'),
			"clientSecret": p('secure::bnd.clientSecret')
		}
	},
	"CRV": {
		"provider": p('crv.provider'),
		"url": p('crv.url'),
		"method": p('crv.method'),
		"header": {
			"clientId": p('secure::crv.clientId'),
			"clientSecret": p('secure::crv.clientSecret')
		}
	},
	"EDN": {
		"provider": p('edn.provider'),
		"url": p('edn.url'),
		"method": p('edn.method'),
		"header": {
			"X-Rimo-Webhook-Key": p('secure::edn.webhookKey')
		}
	},
	"ENG": {
		"provider": p('eng.provider'),
		"url": p('eng.url'),
		"method": p('eng.method'),
		"header": {
			"clientId": p('secure::eng.clientId'),
			"clientSecret": p('secure::eng.clientSecret')
		}
	},
	"FDM": {
		"provider": p('fdm.provider'),
		"url": p('tlg.url'),
		"method": p('fdm.method'),
		"header": {
			"x-api-public-key": p('secure::tlg.publicKey'),
			"x-api-secret-key": p('secure::tlg.secretKey')
		}
	},
	"MPR": {
		"provider": p('mpr.provider'),
		"url": p('mpr.url'),
		"method": p('mpr.method'),
		"header": {
			"clientId": p('secure::mpr.clientId'),
			"clientSecret": p('secure::mpr.clientSecret')
		}
	},
	"MCH": {
		"provider": p('mch.provider'),
		"url": p('mch.url'),
		"method": p('mch.method'),
		"header": {
			"clientId": p('secure::mch.clientId'),
			"clientSecret": p('secure::mch.clientSecret')
		}
	},
	"MSG": {
		"provider": p('msg.provider'),
		"url": p('msg.url'),
		"method": p('msg.method'),
		"header": {
			"clientId": p('secure::msg.clientId'),
			"clientSecret": p('secure::msg.clientSecret')
		}
	},
	"NOV": {
		"provider": p('nov.provider'),
		"url": p('nov.url'),
		"method": p('nov.method'),
		"header": {
			"clientId": p('secure::nov.clientId'),
			"clientSecret": p('secure::nov.clientSecret')
		}
	},
	"ONS": {
		"provider": p('ons.provider'),
		"url": p('ons.url'),
		"method": p('ons.method'),
		"header": {
			"X-DRX-Key": p('secure::ons.xdrxkey')
		}
	},
	"ORD": {
		"provider": p('ord.provider'),
		"url": p('ord.url'),
		"method": p('ord.method'),
		"header": {
			"clientId": p('secure::ord.clientId'),
			"clientSecret": p('secure::ord.clientSecret')
		}
	},
	"PMD": {
		"provider": p('pmd.provider'),
		"url": p('pmd.url'),
		"method": p('pmd.method'),
		"header": {
			"X-PMD-Webhook-Secret": p('secure::pmd.webhookSecret'),
			("x-vercel-protection-bypass": p('secure::pmd.vercelBypass')) if (!isEmpty(p('secure::pmd.vercelBypass')))
		}
	},
	"SCS": {
		"provider": p('scs.provider'),
		"url": p('scs.url'),
		"method": p('scs.method'),
		"header": {
			"clientId": p('secure::scs.clientId'),
			"clientSecret": p('secure::scs.clientSecret')
		}
	},
	"SHN": {
		"provider": p('shn.provider'),
		"url": p('shn.url'),
		"method": p('shn.method'),
		"header": if (!isEmpty(p('secure::shn.webhookKey'))) {
			"X-ShineRx-Webhook-Key": p('secure::shn.webhookKey')
		} else {
			"clientId": p('secure::shn.clientId'),
			"clientSecret": p('secure::shn.clientSecret')
		}
	},
	"SVG": {
		"provider": p('svg.provider'),
		"url": p('tlg.url'),
		"method": p('svg.method'),
		"header": {
			"x-api-public-key": p('secure::tlg.publicKey'),
			"x-api-secret-key": p('secure::tlg.secretKey')
		}
	},
	"TLG": {
		"provider": p('tlg.provider'),
		"url": p('tlg.url'),
		"method": p('tlg.method'),
		"header": {
			"x-api-public-key": p('secure::tlg.publicKey'),
			"x-api-secret-key": p('secure::tlg.secretKey')
		}
	},
	"TRT": {
		"provider": p('trt.provider'),
		"url": p('trt.url'),
		"method": p('trt.method'),
		"header": {
			"clientId": p('secure::trt.clientId'),
			"clientSecret": p('secure::trt.clientSecret')
		}
	},
	"VIT": {
		"provider": p('vit.provider'),
		"url": p('vit.url'),
		"method": p('vit.method'),
		"header": {
			"clientId": p('secure::vit.clientId'),
			"clientSecret": p('secure::vit.clientSecret')
		}
	},
	"WLM": {
		"provider": p('wlm.provider'),
		"url": p('wlm.url'),
		"method": p('wlm.method'),
		"header": {
			"authorization": "Bearer " ++ p('secure::wlm.authToken')
		}
	},
	"MHI": {
		"provider": p('mhi.provider'),
		"url": p('mhi.url'),
		"method": p('mhi.method'),
		"queryParams": {
			"zapikey": p('secure::mhi.zapikey'),
			"isdebug": false
		}
	},
	"OUV": {
		"provider": p('ovh.provider'),
		"url": p('tlg.url'),
		"method": p('ovh.method'),
		"header": {
			"x-api-public-key": p('secure::tlg.publicKey'),
			"x-api-secret-key": p('secure::tlg.secretKey')
		}
	},
	"GIM": {
		"provider": p('gim.provider'),
		"url": p('gim.url'),
		"method": p('gim.method'),
		"header": {
			"Authorization": p('secure::bsk.auth')
		}
	}
}