$(document).ready(function(){

//	$.ajax({
 //   url: '/votes' + "?uid=" + $(uid).attr("data-user-uid") + "&username=" + $(username).attr("data-user-username"),
 //   type: 'POST',
 //   success: function(data) {
 //     var status = JSON.parse(data);
 //   }
 // });
 				search = "{\
			      search_1: bills(first: 100, jurisdiction: \"Florida\") {\
			        edges {\
			          node {\
			            id\
			            identifier\
			            title\
			          }\
			        }\
			      }\
			    }"
 				
 				var rails_env = $('#RAILS_ENV_CONSTANT_HOMEPAGE').text();
 				var sunlight = "<%= ENV['sunlight_foundation_api_key'] %>";

 				

				if ( rails_env == "development" ){

					openstates_url_request = "/lookups/bills"
				
				}else {

					openstates_url_request = "https://ancient-shore-55511.herokuapp.com/lookups/bills"
				}

				fetch( openstates_url_request, {
					method: 'POST',
					mode: 'cors',
					headers: { 'Content-Type': 'application/json', 'X-API-KEY': sunlight, 'Accept': 'application/json' },
					body: JSON.stringify({ "search": search}),
				})
					
				.then(function(response){
					

					//returns the extracted json to the next .then
					return response.json();
				})
				.then(function(myJson){
					
					$.each(myJson.bills.data.search_1.edges, function( index, value ) {
					  console.log(value.node.identifier +" "+ value.node.title );
					});



					

					console.log(JSON.stringify(myJson));



				






        
		    
		    


	});
});