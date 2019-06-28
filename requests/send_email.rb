require 'net/smtp'

def main(param)
 smtp = Net::SMTP.new 'smtp.gmail.com', 587
 smtp.enable_starttls
 message = <<MESSAGE_END
MIME-Version: 1.0
Content-type: text/html
Subject: Hello from Blue!
<table id="m_6002928208601846136email_body" style="margin:0px;padding:0px;border:0px;background-color:#ffffff;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;font-size:14px;line-height:20px" width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px;background-color:#ffffff;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#383838" valign="top" align="center">
<table style="margin:0px;padding:0px;border:0px;background-color:#003580" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px" valign="top" align="center">
<table class="m_6002928208601846136responsive_table" style="margin:0px;padding:0px;border:0px;width:580px" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="m_6002928208601846136responsive_td m_6002928208601846136center_on_mobile m_6002928208601846136responsive_td_logo" style="vertical-align:middle;padding-top:8px;padding-right:16px;padding-bottom:8px;padding-left:16px" valign="middle"><a href="https://www.booking.com/index.pt-br.html?label=gen000nr-10CBYoggI46AdILVgEaLgCiAEBmAEzuAEFyAEF2AED6AEB-AEBiAIBqAIBuAKIp4boBcACAQ;conf_email_logo=1&amp;" title="Booking.com" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.booking.com/index.pt-br.html?label%3Dgen000nr-10CBYoggI46AdILVgEaLgCiAEBmAEzuAEFyAEF2AED6AEB-AEBiAIBqAIBuAKIp4boBcACAQ;conf_email_logo%3D1%26&amp;source=gmail&amp;ust=1561751000963000&amp;usg=AFQjCNHX9ZHkdjfu_RxxOEW8IE2VIQKxpQ">
</a></td>
<td class="m_6002928208601846136responsive_td m_6002928208601846136center_on_mobile" style="text-align:right;vertical-align:middle;padding-top:8px;padding-right:16px;padding-bottom:8px;padding-left:16px;white-space:nowrap" valign="middle">
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<table class="m_6002928208601846136responsive_table" style="margin:0px;padding:0px;border:0px;width:580px" width="580" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding-top:8px;padding-right:16px;padding-bottom:8px;padding-left:16px" valign="top">
</td>
</tr>
<tr>
<td style="margin:0px;padding:0px;border:0px;text-align:left" valign="top">
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px" valign="top">
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px;text-align:left" valign="top">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding-left:8px;padding-right:8px">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding:8px;text-align:left" valign="top">
<table class="m_6002928208601846136mg_conf_reassurance" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;font-weight:bold;font-size:20px;line-height:28px" valign="top">
Here follows one of the hotels that you searched for.
<br />
Thank you for using Blue!
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px" valign="top">
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px;text-align:left" valign="top">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding-left:8px;padding-right:8px">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding:8px;text-align:left" valign="top">
<table class="m_6002928208601846136mg_conf_hotel_preview" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody>
<tr>
<td style="text-align:left;vertical-align:middle" valign="middle"><a href="#{param['hotel']['first']['image']}">
<b>#{param['hotel']['first']['name']}</b>
</a></td>
</tr>
<tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;padding-top:8px" valign="top">
#{param['hotel']['first']['url']}
</td>
</tr>
<tr>
</tr>
<tr>
<td valign="top"><a href="mailto:2475032363-w36c.wwcw.pqxy.5seb@property.booking.com" style="font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;text-decoration:none;color:#0077cc" target="_blank">Send email to the property</a></td>
</tr>
</tbody></table>
<table class="m_6002928208601846136mg_conf_hotel_preview" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;padding-top:16px" valign="top">
<table class="m_6002928208601846136mg_conf_hotel_photo_and_contacts" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="text-align:left" width="50%" valign="top"><a href="http://www.booking.com/directions.pt-br.html?hotel_id=2593669&amp;aid=304142" title="Via Amsterdam" target="_blank" data-saferedirecturl="https://www.google.com/url?q=http://www.booking.com/directions.pt-br.html?hotel_id%3D2593669%26aid%3D304142&amp;source=gmail&amp;ust=1561751000963000&amp;usg=AFQjCNGtEQsfgaAGf9trx8WiSH19YmkDQA">
<img alt="Cannot see this map? Click here to view the location and route" src="https://mail.google.com/mail/u/0?ui=2&amp;ik=c0ea4efd4a&amp;attid=0.1.2&amp;permmsgid=msg-f:1636181631584697525&amp;th=16b4e2866a9ffcb5&amp;view=fimg&amp;sz=s0-l75-ft&amp;attbid=ANGjdJ_DPE9A83XaHbn0hJpDN1z_9VW4i2bCIPdwECMZc50nao4dDgu518dDYhIxrqzCcg2OOvn0aqiFTyVucRR7P-4tLNBVpEzq9IjfMgMLVgKVh27_v6DImFM0QuY&amp;disp=emb" style="width:280px;max-width:100%!important;height:auto;margin:0 auto" data-image-whitelisted="" class="CToWUd" width="280px" border="0">
</a></td>
<td style="text-align:left" width="50%" valign="top"><a href="https://secure.booking.com/myreservations.pt-br.html?aid=304142;auth_key=TP0j4pYupD4ED5Fp&amp;;source=conf_email;pbsource=conf_email_modify#gallery" title="Via Amsterdam" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://secure.booking.com/myreservations.pt-br.html?aid%3D304142;auth_key%3DTP0j4pYupD4ED5Fp%26;source%3Dconf_email;pbsource%3Dconf_email_modify%23gallery&amp;source=gmail&amp;ust=1561751000963000&amp;usg=AFQjCNF4uoRDKoRDl-NfKG_lsVnkZTHWsg">
<img alt="Hotel information" src="https://mail.google.com/mail/u/0?ui=2&amp;ik=c0ea4efd4a&amp;attid=0.1.3&amp;permmsgid=msg-f:1636181631584697525&amp;th=16b4e2866a9ffcb5&amp;view=fimg&amp;sz=s0-l75-ft&amp;attbid=ANGjdJ96kFuPvseW-giUeYxXeCQcdCgaqYgRYm3pIQleDwoqmJ7mnMqjEyLOEM1k_EIuNNehyRhi_5wDN1_kUf26fpibWvntZ7z9CIbAGtrt9TaN3DxEQT8lzcH_39g&amp;disp=emb" style="width:280px;max-width:100%!important;height:auto;margin:0 auto" data-image-whitelisted="" class="CToWUd" width="280px" border="0">
</a></td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px" valign="top">
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px;text-align:left;padding-bottom:0" valign="top">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding-left:8px;padding-right:8px">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding:8px;text-align:left" valign="top">
<table class="m_6002928208601846136mg_conf_booking_summary" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="m_6002928208601846136responsive_td
responsive_key" style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;border-bottom:1px solid #ededed;padding-top:8px;padding-bottom:8px" valign="top"><b>Guests:</b></td>
<td class="m_6002928208601846136responsive_td
responsive_value" style="text-align:right;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;border-bottom:1px solid #ededed;padding-top:8px;padding-bottom:8px" valign="top">#{param['travellers']}
</td>
</tr>
<tr>
<td class="m_6002928208601846136responsive_td
responsive_key" style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;border-bottom:1px solid #ededed;padding-top:8px;padding-bottom:8px" valign="top"><b>Check in:</b></td>
<td class="m_6002928208601846136responsive_td
responsive_value" style="text-align:right;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;border-bottom:1px solid #ededed;padding-top:8px;padding-bottom:8px" valign="top"><time datetime="2019-06-29T15:00:00+02:00">#{param['check_in']}</time>
<span style="color:#707070;white-space:nowrap">
(a partir das 15:00)
</span></td>
</tr>
<tr>
<td class="m_6002928208601846136responsive_td
responsive_key" style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;border-bottom:1px solid #ededed;padding-top:8px;padding-bottom:8px" valign="top"><b>Check out</b></td>
<td class="m_6002928208601846136responsive_td
responsive_value" style="text-align:right;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;border-bottom:1px solid #ededed;padding-top:8px;padding-bottom:8px" valign="top"><time datetime="2019-07-02T10:00:00+02:00">#{param['check_out']}</time>
<span style="color:#707070;white-space:nowrap">
(até as 10:00)
</span></td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding-left:8px;padding-right:8px">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding:8px;text-align:left" valign="top">
<table class="m_6002928208601846136mg_conf_price" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="background-color:#e9f0fa;border:1px solid #cce1ff;padding:16px" valign="top">
<table class="m_6002928208601846136mg_conf_price_breakdown" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr></tr>
<tr>
</tr>
<tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;font-weight:bold;font-size:20px;line-height:28px;padding-top:8px" valign="top"><b>
Price
</b></td>
<td style="text-align:right;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;font-weight:bold;font-size:20px;line-height:28px;padding-top:8px;padding-left:8px" valign="top"><b style="white-space:nowrap">€&nbsp;#{param['hotel']['first']['price']}</b></td>
</tr>
<tr>
<td colspan="2" style="text-align:right;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;vertical-align:middle" valign="middle"><a href="https://www.booking.com/general.html?tmpl=doc/rate_guarantee&amp;via_bpg_link;pbsource=conf_email_bpg" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.booking.com/general.html?tmpl%3Ddoc/rate_guarantee%26via_bpg_link;pbsource%3Dconf_email_bpg&amp;source=gmail&amp;ust=1561751000964000&amp;usg=AFQjCNHVRKE4EA8MMaSCGe5fyACSJ3I6iA">
<img src="https://mail.google.com/mail/u/0?ui=2&amp;ik=c0ea4efd4a&amp;attid=0.1.4&amp;permmsgid=msg-f:1636181631584697525&amp;th=16b4e2866a9ffcb5&amp;view=fimg&amp;sz=s0-l75-ft&amp;attbid=ANGjdJ-2p_3cGpeI6AVoQ-tsawDxXgORSuxOqLSdSH2G12eBeKw5UekIw-OmFzS8Twl7tK5h4EvZ-LYHeRPlVdsg_O_3hJHqyn0So5-FfAx00Za22rG8yRquOJtDQfA&amp;disp=emb" style="padding-right:4px;vertical-align:middle;outline:none;border:none" data-image-whitelisted="" class="CToWUd">
We cover the lowest price!
</a></td>
</tr>
</tbody></table>
<table class="m_6002928208601846136mg_conf_price_extra" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;padding-bottom:8px" valign="top">
As a routine procedure, the accommodation may charge a temporary deposit to confirm that the card used for booking was not lost or stolen and to secure your booking.
</td>
</tr>
<tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;padding-bottom:8px" valign="top">
€ 2 city tax per person per night is not included.
</td>
</tr>
<tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;padding-bottom:8px" valign="top">
Please note that additional requests (eg extra bed) are not included in this rate.
</td>
</tr>
<tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;padding-bottom:8px" valign="top">
The total price shown is the amount you will pay for accommodation. Booking.com does not charge any booking fee, administration fee or for other purposes.
</td>
</tr>
<tr>
<td style="text-align:left;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;padding-bottom:8px" valign="top">
Additional taxes may still be charged for the accommodation if you do not show up or cancel.
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
<tbody><tr>
<td style="padding:0 16px">
<table style="border:1px solid #ededed" width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
<tbody><tr>
<th class="m_6002928208601846136raf-content-stack-align m_6002928208601846136raf_m--adjust-padding" style="padding:16px 8px 0px 16px" valign="middle" align="center"></th>
<th class="m_6002928208601846136raf-content-stack-align m_6002928208601846136raf_m--adjust-padding" style="padding:16px 16px 0px 8px" valign="middle">
<table style="font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
<tbody><tr>
<td>
<h1 style="margin:0 0 5px;font-size:20px;line-height:28px;font-weight:500">
Tell your friends and win €&nbsp;15
</h1>
</td>
</tr>
<tr>
<td>
<p style="margin:0;font-size:14px;line-height:20px;font-weight:400">
For each friend who book with your referral link, you receive €&nbsp;15 on your credit card and your friends earn €&nbsp;15!
<a href="https://secure.booking.com/myreferrals.pt-br.html?label=gen000nr-10CBYoggI46AdILVgEaLgCiAEBmAEzuAEFyAEF2AED6AEB-AEBiAIBqAIBuAKIp4boBcACAQ;" style="font-size:14px;line-height:20px;font-weight:400" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://secure.booking.com/myreferrals.pt-br.html?label%3Dgen000nr-10CBYoggI46AdILVgEaLgCiAEBmAEzuAEFyAEF2AED6AEB-AEBiAIBqAIBuAKIp4boBcACAQ;&amp;source=gmail&amp;ust=1561751000964000&amp;usg=AFQjCNFIK8xlrSqM2mTzw9cgOQc2flls8g">Saiba mais</a></p></td>
</tr>
</tbody></table>
</th>
</tr>
<tr>
<td colspan="2" style="padding:16px" valign="middle">
<p style="margin:0 0 5px;font-size:14px;line-height:20px;font-weight:500;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif">
Share this link with your friends:
</p><table style="border:1px dashed #0077cc;border-radius:4px;font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif" width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
<tbody><tr>
<th class="m_6002928208601846136raf_m--body-font" style="padding:8px 0 8px 12px;color:#0077cc;font-size:20px;line-height:28px;font-weight:500" align="left">
<p style="margin:0;padding:0"><a href="https://www.booking.com/s/32_8/e054846e" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.booking.com/s/32_8/e054846e&amp;source=gmail&amp;ust=1561751000964000&amp;usg=AFQjCNFJhchszveAl0cyd0Y5eR2HV3Vqgw">https://www.booking.com/s/32_<wbr>8/e054846e</a></p></th>
</tr>
</tbody></table>
<p></p></td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px" valign="top">
<table class="m_6002928208601846136responsive_table" style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="margin:0px;padding:0px;border:0px;text-align:left" valign="top">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding-left:8px;padding-right:8px">
<table style="margin:0;padding:0px;border:0px;width:100%;min-width:100%" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td style="padding:8px;text-align:left" valign="top">
<table width="100%" cellspacing="0" cellpadding="0">
<tbody><tr>
<td>
<h2 style="font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;font-weight:bold;font-size:20px;line-height:28px">
Enjoy the best attractions in Amsterdam

</h2>
<p style="font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;font-weight:normal;margin:10px 0">
Avoid queues or take advantage of discounts on selected tours, museums and places of interest. Explore now what you can enjoy!
</p><table class="m_6002928208601846136responsive_table" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="m_6002928208601846136responsive_td" style="text-align:center"><a class="m_6002928208601846136button" href="https://experiences.booking.com/attractions/city/nl/amsterdam.pt-br.html?source=email-confirmation-entrypoint;url_code=tNPsRVRLUS8px5k0Z3kVS8oiXm35p3KSaSmj0Dp1BAcAaYMPNnIBmzYSl6oivhOsiu4Subth30qZWiI11hASB4OnxySCZXAilznE&amp;" style="text-decoration:none" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://experiences.booking.com/attractions/city/nl/amsterdam.pt-br.html?source%3Demail-confirmation-entrypoint;url_code%3DtNPsRVRLUS8px5k0Z3kVS8oiXm35p3KSaSmj0Dp1BAcAaYMPNnIBmzYSl6oivhOsiu4Subth30qZWiI11hASB4OnxySCZXAilznE%26&amp;source=gmail&amp;ust=1561751000964000&amp;usg=AFQjCNEE-2T-tQiwP63_p_HVELWsYPtO1w"><table class="m_6002928208601846136button-outer m_6002928208601846136responsive_table" style="margin:0 auto" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="m_6002928208601846136button-inner" style="font-family:BlinkMacSystemFont,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;margin:0px;padding:0px;border:0px;font-size:14px;line-height:20px;text-align:center;color:#ffffff;background:#0077cc;border-radius:3px;border:1px solid #0077cc;background:#0077cc;padding-top:8px;padding-right:16px;padding-bottom:8px;padding-left:16px" valign="middle" bgcolor="#0077CC" align="center"><a class="m_6002928208601846136button-link" href="https://experiences.booking.com/attractions/city/nl/amsterdam.pt-br.html?source=email-confirmation-entrypoint;url_code=tNPsRVRLUS8px5k0Z3kVS8oiXm35p3KSaSmj0Dp1BAcAaYMPNnIBmzYSl6oivhOsiu4Subth30qZWiI11hASB4OnxySCZXAilznE&amp;" style="color:#ffffff;text-decoration:none;display:inline-block" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://experiences.booking.com/attractions/city/nl/amsterdam.pt-br.html?source%3Demail-confirmation-entrypoint;url_code%3DtNPsRVRLUS8px5k0Z3kVS8oiXm35p3KSaSmj0Dp1BAcAaYMPNnIBmzYSl6oivhOsiu4Subth30qZWiI11hASB4OnxySCZXAilznE%26&amp;source=gmail&amp;ust=1561751000964000&amp;usg=AFQjCNEE-2T-tQiwP63_p_HVELWsYPtO1w">
Find attractions in Amsterdam
</a></td>
</tr>
</tbody></table></a></td>
</tr>
</tbody></table>
<p></p></td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
</td></tr></tbody></table>
MESSAGE_END

 smtp.start('gmail.com', 'letsqueletshack', 'Hackathon.2019', :login) do |smtp|
   smtp.send_message message, "letsqueletshack@gmail.com", param["email"]
 end
 return {}
end