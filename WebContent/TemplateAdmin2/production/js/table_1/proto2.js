 
	var proto = $.parseJSON($.ajax({
       // url:  "http://10.221.208.138:8095/project2/ApiAjaxCors",
		url:  "/project2/ApiAjaxCors",
        dataType: "json",
        async: false
    }).responseText);
		

	var anal = [{Name:'OS command injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'SQL injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'SQL injection (second order)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'ASP.NET tracing enabled', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'File path traversal', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'XML external entity injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'LDAP injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'XPath injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'HTTP PUT method is enabled', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Out-of-band resource load (HTTP)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'File path manipulation', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'PHP code injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Server-side JavaScript code injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Perl code injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Ruby code injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Python code injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Expression Language injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Unidentified code injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Server-side template injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'SSI injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Cross-site scripting (stored)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'HTTP response header injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Cross-site scripting (reflected)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Client-side template injection', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Cross-site scripting (DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Cross-site scripting (reflected DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Cross-site scripting (stored DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'JavaScript injection (DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'JavaScript injection (reflected DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'JavaScript injection (stored DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Client-side SQL injection (DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Client-side SQL injection (reflected DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Client-side SQL injection (stored DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'WebSocket hijacking (DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'WebSocket hijacking (reflected DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'WebSocket hijacking (stored DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Local file path manipulation (DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Local file path manipulation (reflected DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Local file path manipulation (stored DOM-based)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Flash cross-domain policy', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Silverlight cross-domain policy', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Cleartext submission of password', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'External service interaction (DNS)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'External service interaction (HTTP)', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'Serialized object in HTTP message', Severity:'High',Cod:'3', Count: 0,Elenco:''},
{Name:'XML injection', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'ASP.NET debugging enabled', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Cross-site request forgery', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Password returned in later response', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'SQL statement in request parameter', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'XML entity expansion', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Open redirection (stored DOM-based)', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'SSL cookie without secure flag set', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Session token in URL', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Password value set in cookie', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Document domain manipulation (DOM-based)', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Document domain manipulation (reflected DOM-based)', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Document domain manipulation (stored DOM-based)', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Database connection string disclosed', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'SSL certificate', Severity:'Medium',Cod:'2', Count: 0,Elenco:''},
{Name:'Client-side XPath injection (DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Client-side XPath injection (reflected DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Client-side XPath injection (stored DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Client-side JSON injection (DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Client-side JSON injection (reflected DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Client-side JSON injection (stored DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Password submitted using GET method', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Password returned in URL query string', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'ASP.NET ViewState without MAC enabled', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Open redirection', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Open redirection (DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Open redirection (reflected DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Cookie scoped to parent domain', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Cookie without HttpOnly flag set', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Password field with autocomplete enabled', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Cookie manipulation (DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Cookie manipulation (reflected DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Cookie manipulation (stored DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Ajax request header manipulation (DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Ajax request header manipulation (reflected DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Ajax request header manipulation (stored DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Denial of service (stored DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Link manipulation (DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Link manipulation (reflected DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Link manipulation (stored DOM-based)', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Source code disclosure', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Content type incorrectly stated', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Unencrypted communications', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Strict transport security not enforced', Severity:'Low',Cod:'1', Count: 0,Elenco:''},
{Name:'Path-relative style sheet import', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML5 cross-origin resource sharing', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Referer-dependent response', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'X-Forwarded-For dependent response', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'User agent-dependent response', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Cross-domain POST', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Long redirection response', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Duplicate cookies set', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Input returned in response (stored)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Input returned in response (reflected)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Cross-domain Referer leakage', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Cross-domain script include', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'File upload functionality', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Frameable response (potential Clickjacking)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Browser cross-site scripting filter disabled', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTTP TRACE method is enabled', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Denial of service (DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Denial of service (reflected DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML5 web message manipulation (DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML5 web message manipulation (reflected DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML5 web message manipulation (stored DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML5 storage manipulation (DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML5 storage manipulation (reflected DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML5 storage manipulation (stored DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'DOM data manipulation (DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'DOM data manipulation (reflected DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'DOM data manipulation (stored DOM-based)', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Directory listing', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Email addresses disclosed', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Private IP addresses disclosed', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Social security numbers disclosed', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Credit card numbers disclosed', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Private key disclosed', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Robots.txt file', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Cacheable HTTPS response', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Base64-encoded data in parameter', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Multiple content types specified', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML does not specify charset', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'HTML uses unrecognized charset', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Content type is not specified', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Mixed content', Severity:'Information',Cod:'0', Count: 0,Elenco:''},
{Name:'Extension generated issue', Severity:'Information',Cod:'0', Count: 0,Elenco:''}
];
		var l = Object.keys(proto).length;
		var l2 = Object.keys(anal).length;
		
		for(x=0;x<l2;x++)
		{
			for(k=0;k<l;k++)
			{	//splitted[o].toLowerCase() === anal[j].Name.toLowerCase()
				var Lcase = proto[k].note.toLowerCase();
				if(Lcase.includes(anal[x].Name.toLowerCase())){anal[x].Count +=1;anal[x].Elenco += "  " + proto[k].Polarion }else{}
				//if(anal[x].Name.toLowerCase() === proto[k].note.toLowerCase()){anal[x].Count +=1;anal[x].Elenco += " - " + proto[k].Polarion}else{}
			}

		}		
			var alta=0;var media=0;var bassa=0;var info=0;
			for(o=0;o<l;o++)
			{
				if(proto[o].Risultati == "Alta"){alta+= 1;}
				else if(proto[o].Risultati == "Media"){media+=1}
				else if(proto[o].Risultati == "Bassa"){bassa+=1;}
				else if(proto[o].Risultati == "Info"){info+=1;}
				
			}
			proto2 = [];
			for(z = 0; z < l2; z++)
			{
					if(anal[z].Count !== 0)
					{
						proto2[z] = anal[z];
					}
			}


