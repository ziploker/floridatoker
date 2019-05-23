$(document).ready(function(){
	
	$('.progressbar').hide();
	$('.lookup_errors').hide();
	
	var rails_env = $('#RAILS_ENV_CONSTANT').text();
	
	var lat = $('#LAT').text();
	var lng = $('#LNG').text();

	
	var myJson = $('#JSON').data('url');

	if (!myJson.hasOwnProperty('errors')){




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

			};


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


			};


			
		};
		
	

		
	}else{

		$(".buttontwo").attr("disabled", true);
		$('.featured_main').fadeTo(500, 0.6);
		$("#headshot2").css('margin-left', '200px');

	}
	


  	$('.progress-bar .meter').css('width', '58%');
	
	

		
	$('.progress-bar .meter').css('width', '100%');
	$('.progressbar').fadeOut(1000);
	$('.lookup_errors').delay(1000).fadeOut(2000);	
	
	



	console.log('alpha');
	
	
	
	$('.progressbar').fadeOut(1000);						
	$('.lookup_errors').delay(1000).fadeOut(2000);					
					

	


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
			//$('#flag').show();
			$('.lookup_errors').show().empty().append("Please enter address and city.");
		//}else if ( $(".lookup_zip").val().replace(/ /g,'').length != 5){	
		
		//	$('.lookup_errors').show().empty().append("zipcode must be 5 digits");

		//}else if(!$.isNumeric($(".lookup_zip").val())){

		//	$('.lookup_errors').show().empty().append("zipcode must be numbers");


		} else {
			
			$('.lookup_errors').show().empty().append("Retreving info, please wait....");
			$('.progressbar').show();
			
			//$("#results_name").empty();
			//$("#results_party").empty();
			//$("#results_chamber").empty();
			//$("#results_email").empty();
			//$("#results_term").empty();
			//$("#results_district").empty();
			//$("#results_img").empty();
					
			//$("#results_name2").empty();
			//$("#results_party2").empty();
			//$("#results_chamber2").empty();
			//$("#results_email2").empty();
			//$("#results_term2").empty();
			//$("#results_district2").empty();
			//$("#results_img2").empty();
					
			
			$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?address=" + addy + "," + city + "&components=administrative_area:FL|country:US&key=" + google, function(json){
        	$('.progress-bar .meter').css('width', '65%');

        		console.log(json);
        		console.log("STATUS = "+ json.status);
			
				if (json.results.length > 1){
					$('.lookup_errors').empty().append("too many results, be more spicific.");
					$('.progressbar').fadeOut(500);
				} else if (json.status == "OK"){


				 	//$('.lookup_errors').empty().append("Lat: " + json.results[0].geometry.location.lat + "<br>" + "Lng:" + json.results[0].geometry.location.lng + "<br>" + sunlight + "<br>" + google);
			 		lat = json.results[0].geometry.location.lat;
			 		lng = json.results[0].geometry.location.lng;
			 		acc = json.results[0].geometry.accuracy;
			 		$('.progress-bar .meter').css('width', '80%');



			 		$.ajax({
						type: "GET", 
						
						//send to lookup#info
						url: "/find/info/?lat="+lat+"&lng="+lng,
						

						
						
						//data: {"lat":lat, "lng":lng},
						
						
						success: function(data, textStatus, jqXHR){
							$(".lookup_button").attr("disabled", false);


						},
						error: function(jqXHR, textStatus, errorThrown){

							alert("DOH!! something went wrong");
						}
					})
			 		

			 	}else {

			 		$('.lookup_errors').fadeIn(500);

		 			$('.lookup_errors').empty().append(json.status+", TRY AGAIN :)");
		 			$('.progressbar').fadeOut(500);

		 			$(".lookup_button").attr("disabled", false);
		 			$('.lookup_errors').fadeOut(3000);


			 	}
			 	
			 	
		 	});


		};
		console.log('done');
		
	
	};
	
	

	

	//do this everytime "find" button is pressed
	$('.lookup_button').click(function () {
		
		getLookup();

	});
	


	
	$('.lookup_address').keyup(function(event){
		if(event.keyCode == 13){
			getLookup();
		}
	  
	});
	$('.lookup_city').keyup(function(event){
		if(event.keyCode == 13){
			getLookup();
		}
	  
	});

	
	function hasWhiteSpace(string) {
  		return string.indexOf(' ');
	}
	
});
