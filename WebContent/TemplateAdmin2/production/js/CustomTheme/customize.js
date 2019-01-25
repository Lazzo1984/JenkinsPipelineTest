function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}

if (getCookie("scope") != "ALL.ALL") {
	$('#preit_com').remove();
	$('#file_manager').remove();	
	$('#table_old').remove();	
	$('#form_upload').remove();
	$('#Vapt_view1').remove();
	
	//$('#panel_attnonese').remove();
	//$('#panel_ToDo').remove();
	//$('#table_table').remove();

}