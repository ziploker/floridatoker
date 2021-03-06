$(document).ready(function(){
	
	$('.progressbar').hide();
	$('.lookup_errors').hide();
	//$('#results_wrap').hide();
	//$('#flag').hide();


	var rails_env = $('#RAILS_ENV_CONSTANT').text();
	var lat = $('#LAT').text();
	var lng = $('#LNG').text();

	

	var myJson = $('#JSON').data('url');



	

	
/*

	if ( rails_env == "development" ){

					openstates_url_request = "http://localhost:3000/lookups/api"
				
				}else {

					openstates_url_request = "https://ancient-shore-55511.herokuapp.com/lookups/api"
				}

				fetch( openstates_url_request, {
					method: 'POST',
					mode: 'cors',
					headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
					body: JSON.stringify({ lat: lat, lng: lng}),
				})
					
				.then(function(response){
					

					//returns the extracted json to the next .then
					return response.json();
				})
				.then(function(myJson){

*/



					console.log("jj" + myJson);


					var title1 = "Senator";
					var title2 = "Representative";

		 		  

					//STEP TWO:::::   use lat and lng to lookup reps.
				 	//$.getJSON("https://openstates.org/api/v1/legislators/geo/?lat=" + lat + "&long=" + lng + "&apikey=" + sunlight, function(results) {
						
			 		$('.progress-bar .meter').css('width', '41%');	
					
					
					if (myJson.data.people.edges[0].node.chamber[0].organization.classification == "upper"){

						

						$("#headshot").attr("src", myJson.data.people.edges[0].node.image);
						var badUrlCheck = myJson.data.people.edges[1].node.image;
						var goodUrl = badUrlCheck.replace("flhouse","myfloridahouse");
						$("#headshot2").attr("src",goodUrl);
					
						
						$("#results_name").empty().append( title1 +" "+ myJson.data.people.edges[0].node.name);
						$("#name_to_controller").val( title1+ " "  + myJson.data.people.edges[0].node.name);
						$("#results_party").empty().append( myJson.data.people.edges[0].node.party[0].organization.name + " Party");
						$("#results_chamber").empty().append( myJson.data.people.edges[0].node.chamber[0].organization.name);
						$("#results_district").empty().append( "District " + myJson.data.people.edges[0].node.chamber[0].post.label);
						$('#district_1').val("District " + myJson.data.people.edges[0].node.chamber[0].post.label);
						
					
						$("#results_name2").empty().append( title2+" " + myJson.data.people.edges[1].node.name);
						$("#name2_to_controller").val( title2 + " " + myJson.data.people.edges[1].node.name);
						$("#results_party2").empty().append( myJson.data.people.edges[1].node.party[0].organization.name + " Party");
						$("#results_chamber2").empty().append(myJson.data.people.edges[1].node.chamber[0].organization.name);
		 		  		$("#results_district2").empty().append("District "+ myJson.data.people.edges[1].node.chamber[0].post.label)
		 		  		$('#district_2').val("District " + myJson.data.people.edges[1].node.chamber[0].post.labelt);



		 		  		//for senantors emails
		 		  		var indexWithEmailInIt = 1978;

						//loop each time till yoAbout 4,220 results (0u get the email field
						$.each(myJson.data.people.edges[0].node.contactDetails, function (index, value){
						
							if (value.type == "email"){
								
								indexWithEmailInIt = index;
								return false;
							}
						});

						if (myJson.data.people.edges[0].node.name == "Janet Cruz"){

							$("#results_email").empty().append( "cruz.janet@flsenate.gov");
							$("#email_to_controller").val("cruz.janet@flsenate.gov");
						}else if  (indexWithEmailInIt != 1978){
							$("#results_email").empty().append( myJson.data.people.edges[0].node.contactDetails[indexWithEmailInIt].value);
							$("#email_to_controller").val(myJson.data.people.edges[0].node.contactDetails[indexWithEmailInIt].value);
						}else{
							$("#results_email").empty().append( "*** missing email ***");
							$("#email_to_controller").val("missing email");

						}


						//for house members emails
						var spaceCount = myJson.data.people.edges[1].node.name.split(" ").length - 1;
						//console.log("answer is " + spaceCount);

					
						//if first and last names are not blank and have no spaces in them, use it to build the missing email
						if (myJson.data.people.edges[1].node.givenName != "" && hasWhiteSpace(myJson.data.people.edges[1].node.givenName) == -1 && hasWhiteSpace(myJson.data.people.edges[1].node.familyName) == -1){

							var houseEmail = myJson.data.people.edges[1].node.givenName+ "."+myJson.data.people.edges[1].node.familyName+"@myfloridahouse.gov";
							$("#results_email2").empty().append( houseEmail);
							$("#email2_to_controller").val(houseEmail);
							//this is if given and family name are blank, get the full name field and see if theres only
							//one space, if thete is then split it and use it to build the missing email
						}else if (  spaceCount == 1   ){

							var fullName = myJson.data.people.edges[1].node.name;
							var firstN = fullName.substr(0,fullName.indexOf(' ')); 
							var lastN = fullName.substr(fullName.indexOf(' ')+1); 


							var houseEmail = firstN.toLowerCase()+"."+lastN.toLowerCase()+"@myfloridahouse.gov *";
							$("#results_email2").empty().append( houseEmail);
							$("#email2_to_controller").val(houseEmail);
							

					
							//then last resort, scrape other site to get the missing email	
						}else{
						

							if ( rails_env == "development" ){

								house_email_api_url = "http://localhost:3000/lookups/getinfo"
							}else {

								house_email_api_url = "https://ancient-shore-55511.herokuapp.com/lookups/getinfo"
							}


							$.ajax({
						  		type: "get",
						  		url: house_email_api_url,
						  		
						  		//this sends the name to the controller
						  		data: {"name": myJson.data.people.edges[1].node.name },


						  		success: function(data){
						  			
						  			var houseEmail = data.missingEmail;
						  			$("#results_email2").empty().append( houseEmail+" **");
									$("#email2_to_controller").val(houseEmail);


						  		},
						  		error: function(error){
						  			var houseEmail = "*** missing email **";
						  			$("#results_email2").empty().append( houseEmail);
									$("#email2_to_controller").val("missing email");

									
						  		}

			  				});


						//var houseEmail = "** missing emaiL **"

						};



					



					//else if [0] is for "HOUSE -LOWER and [1] is for upper -Senators"
					}else{

						

						$("#headshot").attr("src",myJson.data.people.edges[1].node.image);
						var badUrlCheck = myJson.data.people.edges[0].node.image;
						var goodUrl = badUrlCheck.replace("flhouse","myfloridahouse");
						$("#headshot2").attr("src", goodUrl);
						
					
						
						$("#results_name").empty().append( title1 +" "+ myJson.data.people.edges[1].node.name);
						$("#name_to_controller").val( title1+ " "  + myJson.data.people.edges[1].node.name);
						$("#results_party").empty().append( myJson.data.people.edges[1].node.party[0].organization.name + " Party");
						$("#results_chamber").empty().append( myJson.data.people.edges[1].node.chamber[0].organization.name);
						$("#results_district").empty().append( "District " + myJson.data.people.edges[1].node.chamber[0].post.label);
						//$('#district_1').val("District " + myJson.data.people.edges[1].node.chamber[0].post.label);
						
					
						$("#results_name2").empty().append( title2+" " + myJson.data.people.edges[0].node.name);
						$("#name2_to_controller").val( title2 + " " + myJson.data.people.edges[0].node.name);
						$("#results_party2").empty().append( myJson.data.people.edges[0].node.party[0].organization.name + " Party");
						$("#results_chamber2").empty().append(myJson.data.people.edges[0].node.chamber[0].organization.name);
		 		  		$("#results_district2").empty().append("District "+ myJson.data.people.edges[0].node.chamber[0].post.label)
		 		  		//$('#district_2').val("District " + myJson.data.people.edges[0].node.chamber[0].post.labelt);



		 		  		//for seators emails
		 		  		// if its still 1978 after each loops, it means loop diddnt find email
		 		  		var indexWithEmailInIt = 1978;

						$.each(myJson.data.people.edges[1].node.contactDetails, function (index, value){
						
							if (value.type == "email"){
								
								indexWithEmailInIt = index;
								return false;
							}
						});

						if (myJson.data.people.edges[1].node.name == "Janet Cruz"){

							$("#results_email").empty().append( "cruz.janet@flsenate.gov");
							$("#email_to_controller").val("cruz.janet@flsenate.gov");
						}else if  (indexWithEmailInIt != 1978){
							$("#results_email").empty().append( myJson.data.people.edges[1].node.contactDetails[indexWithEmailInIt].value);
							$("#email_to_controller").val(myJson.data.people.edges[1].node.contactDetails[indexWithEmailInIt].value);
						}else{
							$("#results_email").empty().append( "*** missing email ***");
							$("#email_to_controller").val("missing email");

						}


						//for house members emails
						var spaceCount = myJson.data.people.edges[0].node.name.split(" ").length - 1;
						//console.log("answer is " + spaceCount);

					
						//if first and last names are not blank and have no spaces in them, use it to build the missing email
						if (myJson.data.people.edges[0].node.givenName != "" && hasWhiteSpace(myJson.data.people.edges[0].node.givenName) == -1 && hasWhiteSpace(myJson.data.people.edges[0].node.familyName) == -1){

							var houseEmail = myJson.data.people.edges[0].node.givenName+ "."+myJson.data.people.edges[0].node.familyName+"@myfloridahouse.gov";
							$("#results_email2").empty().append( houseEmail);
							$("#email2_to_controller").val(houseEmail);
							//this is if given and family name are blank, get the full name field and see if theres only
							//one space, if thete is then split it and use it to build the missing email
						}else if (  spaceCount == 1   ){

							var fullName = myJson.data.people.edges[0].node.name;
							var firstN = fullName.substr(0,fullName.indexOf(' ')); 
							var lastN = fullName.substr(fullName.indexOf(' ')+1); 


							var houseEmail = firstN.toLowerCase()+"."+lastN.toLowerCase()+"@myfloridahouse.gov *";
							$("#results_email2").empty().append( houseEmail);
							$("#email2_to_controller").val(houseEmail);
							

					
							//then last resort, scrape other site to get the missing email	
						}else{
						

							if ( rails_env == "development" ){

								house_email_api_url = "http://localhost:3000/lookups/getinfo"
							}else {

								house_email_api_url = "https://ancient-shore-55511.herokuapp.com/lookups/getinfo"
							}


							$.ajax({
						  		type: "get",
						  		url: house_email_api_url,
						  		
						  		//this sends the name to the controller
						  		data: {"name": myJson.data.people.edges[0].node.name },


						  		success: function(data){
						  			
						  			var houseEmail = data.missingEmail;
						  			$("#results_email2").empty().append( houseEmail+" **");
									$("#email2_to_controller").val(houseEmail);


						  		},
						  		error: function(error){
						  			var houseEmail = "*** missing email **";
						  			$("#results_email2").empty().append( houseEmail);
									$("#email2_to_controller").val("missing email");

									
						  		}

			  				});


						//var houseEmail = "** missing emaiL **"

						};


						
					};
						
					


	 		  		

					$('.progress-bar .meter').css('width', '58%');

					
					


					//first.last@myfloridahouse.gov
					
					
						

					
						
					
					$('.progress-bar .meter').css('width', '58%');
					
					

						
					$('.progress-bar .meter').css('width', '100%');
					$('.progressbar').fadeOut(1000);
					$('.lookup_errors').delay(1000).fadeOut(2000);	
					
					



					console.log('alpha');
					
					
					
					$('.progressbar').fadeOut(1000);						
					$('.lookup_errors').delay(1000).fadeOut(2000);					
					
//				});
	//do this when user clicks find button. or enter key?
	var getLookup = function(){
	
		//user input stored
		var addy = $('.lookup_address').val();
		var city = $('.lookup_city').val();
		//var zip = $('.lookup_zip').val();
		var lat;
		var lng;
		var acc;
		var leg_id0;
		var leg_id1;

		var rails_env = $('#RAILS_ENV_CONSTANT').text();

		var openstates_url_request;
		var house_email_api_url;

		var google = "AIzaSyAdiUvnwghttRAxeemccUDdH6PaGZCxRVA";
		var sunlight = "70717a1b-75dc-45cc-82cd-5ba4725e4f0d";
		
		if(addy == "" || city == ""){
			$('#flag').show();
			$('.lookup_errors').show().empty().append("Please enter address and city.");
		//}else if ( $(".lookup_zip").val().replace(/ /g,'').length != 5){	
		
		//	$('.lookup_errors').show().empty().append("zipcode must be 5 digits");

		//}else if(!$.isNumeric($(".lookup_zip").val())){

		//	$('.lookup_errors').show().empty().append("zipcode must be numbers");


		} else {
			$('#flag').show();
			$('.lookup_errors').show().empty().append("Retreving info, please wait....");
			$('.progressbar').show();
			
			$("#results_name").empty();
			$("#results_party").empty();
			$("#results_chamber").empty();
			$("#results_email").empty();
			$("#results_term").empty();
					
			$("#results_name2").empty();
			$("#results_party2").empty();
			$("#results_chamber2").empty();
			$("#results_email2").empty();
			$("#results_term2").empty();
					
			$("#results_work").empty();
			$("#results_phone").empty();
			$("#results_address").empty();
			$("#results_work-b").empty();
			$("#results_phone-b").empty();
			$("#results_address-b").empty();
					
			$("#results_work2").empty();
			$("#results_phone2").empty();
			$("#results_address2").empty();
			$("#results_work2-b").empty();
			$("#results_phone2-b").empty();
			$("#results_address2-b").empty();
	
			
			
			//STEP ONE;;;;   get lat and lng info based on user input
			$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?address=" + addy + "," + city + "&components=administrative_area:FL|country:US&key=" + google, function(json){
            
				
				if (json.results.length > 1){
					$('.lookup_errors').empty().append("too many results, be more spicific.");
					$('.progressbar').hide();
				} else {


				 	//$('.lookup_errors').empty().append("Lat: " + json.results[0].geometry.location.lat + "<br>" + "Lng:" + json.results[0].geometry.location.lng + "<br>" + sunlight + "<br>" + google);
			 		lat = json.results[0].geometry.location.lat;
			 		lng = json.results[0].geometry.location.lng;
			 		acc = json.results[0].geometry.accuracy;
			 		$('.progress-bar .meter').css('width', '22%');
			 		$('#mainwrapper').append(lat + " " + lng + " " + addy + " " + city + " " + acc);


			 	}

			 	//was used when request to openstates was made by client instead of from server
			 	//done by server because of cors issues
				var myQuery = "\
					{\
					  people(latitude: " +lat+", longitude: " +lng+", first: 100) {\
					    edges {\
					      node {\
					        name\
					        givenName\
					        familyName\
					        image\
					        party: currentMemberships(classification:\"party\") {\
					        	organization {\
					          		name\
            					}\
					        }\
					        contactDetails {\
						      note\
						      type\
						      value\
						    }\
					        chamber: currentMemberships(classification:[\"upper\", \"lower\"]) {\
					          post {\
					            label\
					          }\
					          organization {\
					            name\
					            classification\
					            parent {\
					              name\
					            }\
					          }\
					        }\
					      }\
					    }\
					  }\
					}\
				";


				//var myHeaders = new Headers();
				//myHeaders.append("Accept", "application/json");
				//myHeaders.append("Content-Type", "application/json");
				//myHeaders.append("X-API-KEY", sunlight);

				//fetch(API_url, {
				//method: ‘POST’,
				//mode: ‘cors’,
				//headers: myHeaders,
				//body: JSON.stringify({query: myQuery}),
				//})

				//console.log(myQuery);


				/*
				//local fetch request to openstates, done by server instead due to cors issues
			 	fetch('https://openstates.org/graphql', {
					method: 'POST',
					mode: 'cors',
					headers: { 'Content-Type': 'application/json', 'X-API-KEY': sunlight, 'Accept': 'application/json' },
					body: JSON.stringify({ query: myQuery}),
				})
					
				.then(function(response){
					return response.json();
				})
				.then(function(myJson){
  					  		 		  

				

				console.log("yes" + myJson);
				*/








				

				if ( rails_env == "development" ){

					openstates_url_request = "http://localhost:3000/lookups/api"
				
				}else {

					openstates_url_request = "https://ancient-shore-55511.herokuapp.com/lookups/api"
				}

				fetch( openstates_url_request, {
					method: 'POST',
					mode: 'cors',
					headers: { 'Content-Type': 'application/json', 'X-API-KEY': sunlight, 'Accept': 'application/json' },
					body: JSON.stringify({ lat: lat, lng: lng}),
				})
					
				.then(function(response){
					

					//returns the extracted json to the next .then
					return response.json();
				})
				.then(function(myJson){
					console.log(myJson);


					
							
						
					
				
					
				});
				
			
			


			





			}); 

		};
		console.log('done');
		
	
	};
	
	

	var getLogic = function(){

		// if getlookup finds something it will set flag visible
		if ( $('#flag').is(":visible") ){

			//only if getlookup finds something, then toggle display
			$('#results_wrap, #arrow').toggle();
			
		}

	};

	var getLogic2 = function(){
		//if second getlookup found something info was already updated 
		if ( $('#flag').is(":visible") ){

			// info was already updated 
			//do additional stuff ?!?

		}else{

			// else if second search failed, display inital arrow div again
			$('#results_wrap, #arrow').toggle();
			
		
		}
	};

	var getGuts = function(){
		// if initial "Arrow" div is showing then run getlookup first and set flag
		if (  $('#arrow').is(":visible")  ){
			
			$.when( getLookup() ).then( getLogic() );

		// on a second search run getlookup and set according flag
		}else if ( $('#flag').is(":visible") ){

			$.when( getLookup() ).then( getLogic2() );
		}


	};
	
	
	//do this everytime "find" button is pressed
	$('.lookup_button').click(function () {
		
		getGuts();

	});
	


	$('.lookup_address').keyup(function(event){
		if(event.keyCode == 13){
			getGuts();
		}
	  
	});
	$('.lookup_city').keyup(function(event){
		if(event.keyCode == 13){
			getGuts();
		}
	  
	});

	function hasWhiteSpace(string) {
  		return string.indexOf(' ');
	}
	//$('.lookup_zip').keyup(function(event){
	//	if(event.keyCode == 13){
	//		getGuts();
	//	}
	  
	//});
});
