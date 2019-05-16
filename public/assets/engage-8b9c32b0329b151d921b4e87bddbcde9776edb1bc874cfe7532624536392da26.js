//


$(document).ready(function(){

	$('#progressbar').hide();
	$('#lookup_errors').hide();


	//var zip = $('#lookup_zip').val();
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

	

	//do this everytime "find" button is pressed
	$('#lookup_button').click(function () {

		$("#lookup_button").attr("disabled", true);

		$('#progressbar').fadeIn(500);
		
		$('.progress-bar .meter').css('width', '15%');
		$('.progress-bar .meter').css('width', '20%');
		$('.progress-bar .meter').css('width', '30%');
		$('.progress-bar .meter').css('width', '40%');
		$('.progress-bar .meter').css('width', '50%');
		//user input stored
		addy = $('#lookup_address').val();
		city = $('#lookup_city').val();
		
		
		if(addy == "" || city == ""){
			$('#flag').hide();
			$('#lookup_errors').show().empty().append("Please enter address and city.");
		//}else if ( $("#lookup_zip").val().replace(/ /g,'').length != 5){	
		
		//	$('#lookup_errors').show().empty().append("zipcode must be 5 digits");

		//}else if(!$.isNumeric($("#lookup_zip").val())){

		//	$('#lookup_errors').show().empty().append("zipcode must be numbers");


		} else {
			
			$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?address=" + addy + "," + city + "&components=administrative_area:FL|country:US&key=" + google, function(json){
        	$('.progress-bar .meter').css('width', '65%');
			
				if (json.results.length > 1){
					$('#lookup_errors').empty().append("too many results, be more spicific.");
					$('#progressbar').hide();
				} else {


				 	//$('#lookup_errors').empty().append("Lat: " + json.results[0].geometry.location.lat + "<br>" + "Lng:" + json.results[0].geometry.location.lng + "<br>" + sunlight + "<br>" + google);
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
							$("#lookup_button").attr("disabled", false);


						},
						error: function(jqXHR, textStatus, errorThrown){

							alert("DOH!! something went wrong");
						}
					})
			 		

			 	}
			 	
			 	
		 	});

		 	
		}

	});

});
