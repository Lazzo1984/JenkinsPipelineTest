$(document).ready(function(){
		

		var url = "http://127.0.0.1:4444/project2/CertProd"; //verso la mia servlet NATTATA su VirtualBOx 127.0.0.1:2222 => 139.168.1.10:8080
		
		var url_produzione = "http://10.221.208.138:8095/project2/CertProd"; // mio war in produzione sotto il tomcat di tony tomcat7-pmta
		
		var URLtoNYLOCALE = "http://10.221.6.126:8080/CheckQualityWeb/CheckQualityWeb"; // in locale da tony
		
		var rel_url = "/project2/CertProd";
		//var localJSON = "CP.json"; //http://10.221.208.138:8095
    
	json = $.parseJSON($.ajax({
        url:  rel_url,
        dataType: "json",
        async: false
    }).responseText);
});
