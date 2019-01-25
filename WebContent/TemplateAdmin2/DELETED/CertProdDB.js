$(document).ready(function(){
	    var json = {};
	    
	    /*
		var url = "http://127.0.0.1:2222/project2/CertProd"; //verso la mia servlet NATTATA su VirtualBOx 127.0.0.1:2222 => 139.168.1.10:8080
		
		var url_produzione = "http://10.221.208.138:8095/project2/CertProd"; // mio war in produzione sotto il tomcat di tony tomcat7-pmta
		
		var URLtoNYLOCALE = "http://10.221.6.126:8080/CheckQualityWeb/CheckQualityWeb"; // boh qualcosa in locale da tony
		*/
		
		var RelURI = "/project2/CertProd";
		
		$.getJSON(RelURI, function(Json) {
		//console.log(Object.keys(json));
		//console.log(json.tableQuality[1][1] + " - " + json.tableQuality[1][2]);
		
		
	    json = JSON; //NOSONAR
	    
		});
});