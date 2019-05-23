  
    var publisher;
    var streams = [];
    var token = "<%= @token %>";
    var watchers = 0;
	var streamers = 0;
    
    
    
    function connect() {
	  if (OT.checkSystemRequirements() == 0) {
        console.log("The client does not support WebRTC.");
      } else {
        console.log("The client does support WebRTC.");
        session = OT.initSession("<% ENV['api_key'] %>", "<%= @session_id %>");
		
		//Initial session connection
		//Local user connects to the session
		session.on("sessionConnected", function(event){
			console.log("sessionConnected by local user, watchers: "+watchers+" & streamers: "+ streamers);
		});	
			
		//session connection destroyed
		session.on("sessionDisconnected", function(event) {
			console.log("The session disconnected. " + event.reason);
			watchers--;
	    });
        
        	
		
		//forign user connects to the session
		session.on("connectionCreated", function(event){
			var stream = event.stream;
            watchers++;
            console.log("connectionCreated by forign user, watchers: "+watchers+" & streamers: "+ streamers);
            var usernames = document.getElementById("user_area");
            
        	$('#user_area ul').append('<li id="'+event.connection.data+'"><span class="usernames">' +event.connection.data+ '</span></li>');


			//$.trim(usernames);
			
			//if ( $('#user_area').val() ){
        	//	$('#user_area').val(  $('#user_area').val() + "\n" +event.connection.data);
        	//	$.trim('#user_area');
        	//	console.log('true');
    	    //}else{
    	    //	$('#user_area').val(  $('#user_area').val() + event.connection.data);
    	    //	$.trim('#user_area');
    	    //	console.log('falsee');
    	    //}
        	$('#user_area').scrollTop(  $('#user_area')[0].scrollHeight   );
      		
        });
		
		//session connection destroyed
		session.on("connectionDestroyed", function(event){
			watchers--;
			console.log("session connection destroyed, watchers: "+watchers+" & streamers: "+ streamers);
        	

			$('#text_area ul').append('<li><span class="infomsg">** '+event.connection.data+' has left the room. **</span></li>');
      		$('#text_area').scrollTop(  $('#text_area')[0].scrollHeight   );


        	//$('#text_area').append("\n *** " + event.connection.data + " has left the room. ***");
      		//$('#text_area').scrollTop(  $('#text_area')[0].scrollHeight   );
      		
        	$('#'+event.connection.data+'').remove();
        });
		
		
		
		//stream created by forign user
		session.on("streamCreated", function(event){
			console.log("new stream created by forign user")
		  	if(event.stream.connection.connectionId != session.connection.connectionId){
		  		if ( $('#ivid1').children().length < 3 ) {
					session.subscribe(event.stream, 'ivid1', {width: '100%', height: '100%', insertMode: 'append', name: event.stream.connection.data });
					streamers++;
		  			console.log("sucsessfully subscribed to new forign stream 1of5, watchers: "+watchers+" & streamers: "+ streamers)
				
				}else if ( $('#ivid2').children().length < 3 ) {
					session.subscribe(event.stream, 'ivid2', {width: '100%', height: '100%', insertMode: 'append', name: event.stream.connection.data});
					streamers++;
		  			console.log("sucsessfully subscribed to new forign stream 2of5, watchers: "+watchers+" & streamers: "+ streamers)
				
				}else if ( $('#ivid3').children().length < 3 ) {
					session.subscribe(event.stream, 'ivid3', {width: '100%', height: '100%', insertMode: 'append', name: event.stream.connection.data});
					streamers++;
		  			console.log("sucsessfully subscribed to new forign stream 3of5, watchers: "+watchers+" & streamers: "+ streamers)
				
				}else if ( $('#ivid4').children().length < 3 ) {
					session.subscribe(event.stream, 'ivid4', {width: '100%', height: '100%', insertMode: 'append', name: event.stream.connection.data});
					streamers++;
		  			console.log("sucsessfully subscribed to new forign stream 4of5, watchers: "+watchers+" & streamers: "+ streamers)
				
				}else if ( $('#ivid5').children().length < 3 ) {
					session.subscribe(event.stream, 'ivid5', {width: '100%', height: '100%', insertMode: 'append', name: event.stream.connection.data});
					streamers++;
		  			console.log("sucsessfully subscribed to new forign stream 5of5, watchers: "+watchers+" & streamers: "+ streamers)
				
				}else{
					console.log("no more room for streams")	
				}		
		  	}
		  	
		});	
		  	

		//Local user stoped publishing to the session
		session.on("streamDestroyed", function(event){
			streamers--;
			console.log("forign user stopped streaming, watchers: "+watchers+" & streamers: "+ streamers);
			
			if ( $('#ivid1').children().length == 0 ){
				
			}else if ( $('#ivid2').children().length == 0 ){
				
			}else if ( $('#ivid3').children().length == 0 ){
				
			}else if ( $('#ivid4').children().length == 0 ){
				
			}else if ( $('#ivid5').children().length == 0 ){
				
			}else{
				// not sure what to do at this point zzzZZz
			}
			
			
		});	
		
		
		
		      
      
        // Replace token with your own value:
        session.connect(token, function(error) {
          if (error) {
            OT.log("Unable to connect: ", error.message);
          } else {
            //document.getElementById('disconnectBtn').style.display = 'block';
            //$('#disconnectBtn').hide();
            console.log("session.connect, Connected to the session.");
          }
        });
        
        session.on("signal", function(event) {
      		console.log("Signal sent from connection " + event.from.id);
      		// Process the event.data property, if there is any data.
      		//$('#text_area').append("\n" + event.data);
      		$('#text_area ul').append('<li><span class="textmsg">' +event.data+ '</span></li>');
      		$('#text_area').scrollTop(  $('#text_area')[0].scrollHeight   );
		});
        
        
       
		
		
		
		
		
		
		window.sendMSG = function() {       
       
       
	        session.signal(
	  			{
	    			data: session.connection.data + ": " + $('#message').val()
	  			},
	  			function(error) {
	    			if (error) {
	      				console.log("signal error ("
	                   		+ error.code
	                   		+ "): " + error.message);
	    			} else {
	      				console.log("signal sent.");
	    			}
	  			}
			);
			
			
			$('#message').val("");
			
        };
        
        
        
        
        
        
        
        
        
        
        
        
	  }
    }


  
//START PUBLISHING------------------------------------------------------
$('.connectdown').click( function (){
	
	//parent ID will be div "ivid1" thru 'ivid5'
	$parentID = $(this).parent().attr('id');
	
	
	publisher = OT.initPublisher($parentID, {name: session.connection.data, width: '100%', height: '100%', insertMode: 'append'});
	$('#' + $parentID + " .overlayno").attr('class', 'overlay');
	
	//remove hover on all other divs so only 1 publisher...
	$('.connectdown').each( function () {
		if( $(this).parent().attr('id') !== $parentID  ){
			$(this).attr('class', 'connectNONE');
		}
	});
	
	//publish audio/video
	session.publish(publisher);
	
	//Local user started publishing to the session
	publisher.on("streamCreated", function(event){
  	
		streamers++;
		console.log("local publisher started streaming, watchers: "+watchers+" & streamers: "+ streamers);
	});	  
 
	//Local user stoped publishing to the session
	publisher.on("streamDestroyed", function(event){
		streamers--;
		console.log("local publisher stopped streaming, watchers: "+watchers+" & streamers: "+ streamers);
	});
	
});  
      
      
//STOP PUBLISHING-------------------------------------------------------
$('.overlayno').click( function(){
	
	publisher.destroy();
	console.log("publisher dissstroyed");
	//disconnect();
	//console.log($(this).parent().attr('id') );
	
	$parentID = $(this).parent().attr('id');
	$(this).attr('class', 'overlayno');
	
	$('.connectNONE').each( function () {
		if( $(this).parent().attr('id') !== $parentID  ){
			
			console.log('inside  ' + this);
			$(this).attr('class', 'connectdown');
		}
	});
});
  

function removeSpaces(string) {
 return string.split(' ').join('');
}

connect();

	$('#msg button').click( function(){
		
		console.log('buttonclicked');
		sendMSG();
	});
	
	$('#message').keyup(function(event){
		if(event.keyCode == 13){
			console.log('enterHitt');
			sendMSG();
		}
	  
	});


});

