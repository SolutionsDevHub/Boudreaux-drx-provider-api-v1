%dw 2.0
output application/json
---
{
	message: {
		subject: 'Record Processing Failed After Maximum Retries',
		body: {
			contentType: 'HTML',
			content: '<!doctype html>
					<html>
					    <head>
					        <meta charset="UTF-8" />
					        <title>RX Processing Failed</title>
					    </head>
					
					    <body
					        style="
					            margin: 0;
					            padding: 0;
					            background-color: #f4f6f8;
					            font-family: Arial, Helvetica, sans-serif;
					            color: #333333;
					        "
					    >
					        <table
					            width="100%"
					            cellpadding="0"
					            cellspacing="0"
					            border="0"
					            style="background-color: #f4f6f8; padding: 30px 0"
					        >
					            <tr>
					                <td align="center">
					                    <table
					                        width="700"
					                        cellpadding="0"
					                        cellspacing="0"
					                        border="0"
					                        style="background-color: #ffffff; border: 1px solid #dddddd"
					                    >
					                        <!-- Header -->
					                        <tr>
					                            <td style="background-color: #b42318; padding: 20px 25px; color: #ffffff">
					                                <h2 style="margin: 0; font-size: 22px">RX Processing Failed</h2>
					
					                                <p style="margin: 6px 0 0 0; font-size: 14px">
					                                    Request failed after maximum retry attempts
					                                </p>
					                            </td>
					                        </tr>
					
					                        <!-- Main Content -->
					                        <tr>
					                            <td style="padding: 25px">
					                                <p style="font-size: 15px; margin-top: 0">Hello Team,</p>
					
					                                <p style="font-size: 15px; line-height: 1.6">
					                                    An RX transaction failed after
					                                    <strong>3 retry attempts</strong>
					                                    due to a connectivity issue with the target system.
					                                </p>
					
					                                <!-- Error Information -->
					                                <h3
					                                    style="
					                                        font-size: 17px;
					                                        color: #333333;
					                                        border-bottom: 1px solid #dddddd;
					                                        padding-bottom: 8px;
					                                    "
					                                >
					                                    Error Information
					                                </h3>
					
					                                <table
					                                    width="100%"
					                                    cellpadding="8"
					                                    cellspacing="0"
					                                    border="0"
					                                    style="font-size: 14px; border-collapse: collapse"
					                                >
					                                    <tr>
					                                        <td width="35%" style="font-weight: bold; background-color: #f7f7f7">
					                                            Application Name
					                                        </td>
					                                        <td>$(vars.appName default '')</td>
					                                    </tr>
					
					                                    <tr>
					                                        <td style="font-weight: bold; background-color: #f7f7f7">Environment</td>
					                                        <td>$(upper(p('mule.env')) default ' Test')</td>
					                                    </tr>
					
					                                    <tr>
					                                        <td style="font-weight: bold; background-color: #f7f7f7">Target System</td>
					                                        <td>DRX</td>
					                                    </tr>
					
					                                    <tr>
					                                        <td width="35%" style="font-weight: bold; background-color: #f7f7f7">
					                                            Correlation ID
					                                        </td>
					                                        <td>$(vars.correlationId default correlationId)</td>
					                                    </tr>
					
					                                    <tr>
					                                        <td style="font-weight: bold; background-color: #f7f7f7">
					                                            $(vars.failure.recordType default 'Not Found') ID
					                                        </td>
					                                        <td>$(vars.failure.externalId default 'Not Found')</td>
					                                    </tr>
					
					                                    <tr>
					                                        <td style="font-weight: bold; background-color: #f7f7f7">Retry Attempts</td>
					                                        <td>$(vars.retryCount default '3')</td>
					                                    </tr>
					
					                                    <tr>
					                                        <td style="font-weight: bold; background-color: #f7f7f7">Status</td>
					                                        <td style="color: #b42318; font-weight: bold">Failed - Retry Exhausted</td>
					                                    </tr>
					                                </table>
					
					                                <!-- Action Required -->
					                                <div
					                                    style="
					                                        margin-top: 25px;
					                                        padding: 15px;
					                                        background-color: #fff4e5;
					                                        border-left: 4px solid #f79009;
					                                    "
					                                >
					                                    <h3 style="margin: 0 0 8px 0; font-size: 16px">Action Required</h3>
					
					                                    <p style="margin: 0; font-size: 14px; line-height: 1.6">
					                                        Please investigate the connectivity/authentication issue with the target system
					                                        and reprocess the failed transaction once the issue has been resolved.
					                                    </p>
					                                </div>
					
					                                <!-- Footer -->
					                                <p style="font-size: 14px; margin-top: 30px">
					                                    Thanks,<br />
					                                    <strong>MuleSoft Integration Team</strong>
					                                </p>
					                            </td>
					                        </tr>
					
					                        <!-- Automated Email Footer -->
					                        <tr>
					                            <td
					                                style="
					                                    background-color: #f4f6f8;
					                                    padding: 15px 25px;
					                                    text-align: center;
					                                    font-size: 11px;
					                                    color: #777777;
					                                "
					                            >
					                                This is an automated notification generated by MuleSoft.
					                            </td>
					                        </tr>
					                    </table>
					                </td>
					            </tr>
					        </table>
					    </body>
					</html>'
		},
		toRecipients: [{
			emailAddress: {
				address: p('outlook.toRecipients')
			}
		}]
	},
	saveToSentItems: true
}