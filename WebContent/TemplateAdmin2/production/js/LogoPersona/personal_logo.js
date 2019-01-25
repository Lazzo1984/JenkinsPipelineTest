var emp = ["dcioffi","gpassaro","tspera","fairaghi"];
var cons = ["slazzati", "pmasone","mperchinunno"];
var utente = $('.profile_info h2').text();
var maestro = "ppirani";
//console.log(utente);
var flag = false;

if(maestro == utente)
{
	  $('.profile_pic img').attr("src","images/bender.jpg");
	  $('#logout_logo').attr("src","images/bender.jpg");
	  flag = true;
}

for(i = 0; i < emp.length;i++)
{
  if(emp[i] == utente)
  {
	//  console.log("siamo entrati dentro");
  $('.profile_pic img').attr("src","images/LI_logo.jpg");
  $('#logout_logo').attr("src","images/LI_logo.jpg");
  flage = true;
  }
}
for(i = 0; i < cons.length;i++)
{
  if(cons[i] == utente)
  {
	  
  $('.profile_pic img').attr("src","images/logo-innovaway.jpg");
  $('#logout_logo').attr("src","images/logo-innovaway.jpg");
  flag = true;
  }
}
if(flag == false)
{
	$('.profile_pic img').attr("src","images/LI_logo.jpg");
	$('#logout_logo').attr("src","images/LI_logo.jpg");
}


