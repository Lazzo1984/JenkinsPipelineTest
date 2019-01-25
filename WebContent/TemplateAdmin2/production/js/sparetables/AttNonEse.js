$(document).ready(function() { //NOSONAR

					/*
					 * $.ajax({ type: "GET", //headers: {"Origin":
					 * "http://www.evil.com"}, url:
					 * "http://cm-maven.adlispa.local/cmqualityweb/CheckQualityWeb"
					 * }).done(function (data) { console.log(data); });
					 */

					// questa funzione per fare i test
					var s = [];
					var h = [];

					// $.getJSON(url, function(json) {
					// console.log(Object.keys(json));
					// console.log(json.tableQuality[1][1] + " - " +
					// json.tableQuality[1][2]);

					var counter = 0;
					var Ltablesecurity = json.tableSecurity.length;

					for (var i = 0; i < Ltablesecurity; i++) {

						if (true) {

							var tsmp = (DateToTstamp(json.tableSecurity[i][1]));

							s.push([ tsmp, // TIMESTAMP
							json.tableGeneral[i][0], // DATA
							json.tableGeneral[i][3], // POLARION
							json.tableGeneral[i][1], // ELETTRA
							json.tableGeneral[i][15], // AUTORE
							json.tableSecurity[i][5], // STATO (KALI LINUX)
							json.tableGeneral[i][4] // DEFECT
							// json.tableSecurity[i][6] // librerire Owasp
							// dependency con vulnerabilità
							// json.tableSecurity[i][10] // NOTE
							]);
						}

					}
					// alert(s);

					var ordArr = s.sort(function(a, b) {
						return b[0] - a[0]
					});
					// console.log(ordArr);

					// AttNese(s);

					function DateToTstamp(_date) {
						var colon = ":";
						if (_date.includes(colon)) {
							var currentdate = new Date();
							var datetime = currentdate.getFullYear() + "/"
									+ (currentdate.getMonth() + 1) + "/"
									+ currentdate.getDate() + " " + _date;

							var k = Math
									.round(new Date(datetime).getTime() / 1000);

							return k;
						} else {
							var myDate = _date;
							myDate = myDate.split("-");

							var newDate = myDate[2] + "/" + myDate[1] + "/"
									+ myDate[0] + " 12:00:00";
							var f = Math.round(new Date(newDate).getTime() / 1000);

							return f;
						}
					}
					// # END OF DateToTstamp
					// ****************************************
					function sortNumber(a, b) {
						if (a[1] === b[1]) {
							return 0;
						} else {
							return (a[1] < b[1]) ? -1 : 1;
						}
					}
					// ****************************************
					function Uri4Defect(url, defect) {
						if (defect != null) {
							var newurl = "";
							var x = (url.includes("siss")) ? "SISS" : "SIRE";
							switch (x) {
							case "SISS":
								newurl = "http://sgr-siss.adlispa.local/polarion/#/workitems?query=type:defect%20AND%20id:" //NOSONAR
										+ defect;
								break;
							case "SIRE":
								newurl = "http://sgr-sire.adlispa.local/polarion/#/workitems?query=type:defect%20AND%20id:" //NOSONAR
										+ defect;
								break;
							default:
								newurl = "vai ngulo vai";
								//console.log(newurl);

							}
							return newurl;
						} else {
							return "";
						}
						return "something goes wrong";
					}

					// ***********************************************

					$('#AttivitaNonEseguite').DataTable({
						data : ordArr,
						"order" : [ [ 0, "desc" ] ],
						columns : [{title : "TimeStamp"}, 
							{
							title : "Data"
						}, {
							title : "Polarion"
						}, {
							title : "Elettra"
						}, {
							title : "Author"
						}, {
							title : "Stato"
						}, {
							title : "Defect"
						} ]
					});

				});//document