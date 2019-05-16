
/*	

$(document).ready(function(){

//	$.ajax({
 //   url: '/votes' + "?uid=" + $(uid).attr("data-user-uid") + "&username=" + $(username).attr("data-user-username"),
 //   type: 'POST',
 //   success: function(data) {
 //     var status = JSON.parse(data);
 //   }
 // });

			




 				search = "{\
				  search_1: bills(first: 100, jurisdiction: \"Florida\", session: \"2019\") {\
				    edges {\
				      node {\
				        id\
				        identifier\
				        title\
				        classification\
				        legislativeSession {\
				          identifier\
				          jurisdiction {\
				            name\
				          }\
				        }\
				        actions {\
				          date\
				          description\
				          classification\
				        }\
				        documents {\
				          date\
				          note\
				          links {\
				            url\
				          }\
				        }\
				      }\
				    }\
				    pageInfo {\
				      hasNextPage\
				      endCursor\
				    }\
				  }\
				}\
				"

				var nextSearch;
 				
 				var hasNextPage;
 				var rails_env = $('#RAILS_ENV_CONSTANT_HOMEPAGE').text();
 				var sunlight = "<%= ENV['sunlight_foundation_api_key'] %>";
 				
 				var counter = 0;
 				var endCursor;

 				

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
					
					
					hasNextPage = myJson.bills.data.search_1.pageInfo.hasNextPage;
					endCursor = myJson.bills.data.search_1.pageInfo.endCursor;


					
					$.each(myJson.bills.data.search_1.edges, function( index, value ) {
				  		console.log(value.node.identifier +" "+ value.node.title );
				  		counter ++;
					});

					
					

					console.log(myJson.bills.data.search_1.pageInfo.hasNextPage + " = " + hasNextPage);
					console.log(myJson.bills.data.search_1.pageInfo.endCursor + " = " + endCursor);
					console.log("COUNTER IS " + counter);

					
				


					console.log("HAS NEXT = "+ hasNextPage);
					if (hasNextPage == true){

						console.log("in");
					

						do {

							nextSearch = setQuery(endCursor);
							console.log("NEEEXXT SEAARRCCHH" + nextSearch);
								
								
							fetch( openstates_url_request, {
								method: 'POST',
								mode: 'cors',
								headers: { 'Content-Type': 'application/json', 'X-API-KEY': sunlight, 'Accept': 'application/json' },
								body: JSON.stringify({ "search": nextSearch}),
							})
								
							.then(function(response){
								

								//returns the extracted json to the next .then
								return response.json();
							})
							
							.then(function(myJson){
								
								
								hasNextPage = myJson.bills.data.search_1.pageInfo.hasNextPage;
								endCursor = myJson.bills.data.search_1.pageInfo.endCursor;

								
								$.each(myJson.bills.data.search_1.edges, function( index, value ) {
							  		console.log(value.node.identifier +" "+ value.node.title );
							  		counter ++;
								});

								
								
								console.log(myJson.bills.data.search_1.pageInfo.hasNextPage + " = " + hasNextPage);
								console.log(myJson.bills.data.search_1.pageInfo.endCursor + " = " + endCursor);
								console.log("COUNTER IS " + counter);

								
							});

						}

						while (hasNextPage == true);
					}
				});
						




					

				

				


	function setQuery(endCursor){


		search = "{\
				  search_1: bills(first: 100, jurisdiction: \"Florida\", session: \"2019\", after: \""+endCursor+"\", classification: \"bill\" ) {\
				    edges {\
				      node {\
				        id\
				        identifier\
				        title\
				        classification\
				        legislativeSession {\
				          identifier\
				          jurisdiction {\
				            name\
				          }\
				        }\
				        actions {\
				          date\
				          description\
				          classification\
				        }\
				        documents {\
				          date\
				          note\
				          links {\
				            url\
				          }\
				        }\
				      }\
				    }\
				    pageInfo {\
				      hasNextPage\
				      endCursor\
				    }\
				  }\
				}\
				"

		return search;

		console.log(search);


	}






		

		

	

	
});



*/