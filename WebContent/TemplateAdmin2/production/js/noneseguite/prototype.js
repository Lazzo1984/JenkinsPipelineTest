function connectorAjax(a){
	
    var jx = $.parseJSON($.ajax({
      // url:  "http://cm-maven.adlispa.local/project2/CertProd",
	    url:  "/project2/CertProd",
        dataType: "json",
        async: false
    }).responseText);

     var jnote = $.parseJSON($.ajax({
    // url:  "http://cm-maven.adlispa.local/project2/CertProd",
	  url:  "/project2/AggiornaNote",
      dataType: "json",
      async: false
  }).responseText);

		var proto = [];
		var _obj_ = {};
		var Ltablesecurity = jx.tableSecurity.length;
		var noteiterator = jnote.length;
		var empty_shell = "";
	
		for(var i=0;i < Ltablesecurity; i++)
		{
			_obj_ = {};
		if(jx.tableSecurity[i][5] == a)
		{ 
		  	  	
			var tmp = jx.tableGeneral[i][0];
			var data = DateToTstamp(tmp);

			var angularPolarion = "";
			var angularWiPolarion = "";

			var note = "";
			var updatedby = "";
			
			_obj_.empty = empty_shell;									      // check box
			_obj_.id = i;                                                    //   ID           
			_obj_.data_cert = data;								            //   DATA 
									
			angularPolarion = jx.tableGeneral[i][3];				      // POLARION		
			var str = angularPolarion.match( /href="([^\'\"]+)/g );
			var str1 = str[0].replace("href=\"","");			
			_obj_.Polarion  = str1;
			
			angularWiPolarion = str1.match( /id:([A-Za-z._\-0-9]+)/g );      //not the best so far need to catch all special char in WI Polarion
			_obj_.PolarionWI = angularWiPolarion[0].replace("id:",""); 
			
			  											
			_obj_.Elettra =	jx.tableGeneral[i][1];                            //   ELETTRA
			_obj_.Responsabile = jx.tableGeneral[i][15];                     //   AUTORE
			
			_obj_.stato = jx.tableSecurity[i][5];                          // STATO
			
			for(var w=0; w < noteiterator; w++)
				{
				if(jx.tableGeneral[i][1] == jnote[w].elettra){
				 note = jnote[w].note;								     // note
				 updatedby = jnote[w].updatedby;						// username
				}else{}
				}
			
			_obj_.Note = note;
			_obj_.Projname = jx.tableGeneral[i][2];					// ProjectName
			_obj_.updatedby = updatedby;
			
			proto.push(_obj_);
		    
		    } // end if
		    else
		    {

		    }		
		} // edn for
		//console.log(proto);
		
		function addZ(n){return n<10? '0'+n:''+n;}
		
		function DateToTstamp(_date)
		{
		var colon = ":";
		if(_date.includes(colon))
		{
		var currentdate = new Date();
		
		var giorno = addZ(currentdate.getDate());
		
		var datetime = currentdate.getFullYear() + "-" +
                      (currentdate.getMonth()+1)  + "-" + giorno + "T" + _date + ":00";
		
    	//per il timestamp
		//var  = Math.round(new Date(datetime).getTime()/1000);
		
		return datetime;
		}
		else
		{
		var myDate = _date;
		myDate = myDate.split("-");
				
		var newDate = myDate[2] + "-" + myDate[1] + "-" + myDate[0] + "T12:00:00";
    	// per il Timestamp
		//var timestamp = Math.round(new Date(newDate).getTime()/1000);
		
		return newDate;
		}
    }
		
		
		return proto;
}