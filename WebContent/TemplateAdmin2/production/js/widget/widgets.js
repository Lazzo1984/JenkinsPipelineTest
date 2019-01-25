$(document).ready(function(){
	var l = Object.keys(proto).length;
	//console.log("Questa debug : " + contatori[0].data[0].y);
	
	$('#widget_ALTA').css('width', (contatori[0].data[0].y) + '%');$('#widget_ALTA2').text(Math.round((l/100*(contatori[0].data[0].y))));
	$('#widget_MEDIA').css('width', (contatori[0].data[1].y) + '%');$('#widget_MEDIA2').text(Math.round((l/100*(contatori[0].data[1].y))));
	$('#widget_BASSA').css('width', (contatori[0].data[2].y) + '%');$('#widget_BASSA2').text(Math.round((l/100*(contatori[0].data[2].y))));
	$('#widget_INFO').css('width', (contatori[0].data[3].y) + '%');$('#widget_INFO2').text(Math.round((l/100*(contatori[0].data[3].y))));
	
});