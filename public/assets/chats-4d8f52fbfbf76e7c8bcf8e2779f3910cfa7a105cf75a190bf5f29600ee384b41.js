
function clickedRooms(evt, selectedTab) {
	// Declare all variables
	var i, tabcontent, tablinks;

	document.getElementById("Create").style.display = "none";
	document.getElementById("Rooms").style.display = "block";
	document.getElementById("Users").style.display = "none";
	
	

	$("#userButt").attr('class', 'tablinks');
	$("#roomButt").attr('class', 'tablinks active');
	$("#createButt").attr('class', 'tablinks');
	
	



		
		
		
}


function clickedUsers(evt, selectedTab) {
	// Declare all variables
	var i, tabcontent, tablinks;

	document.getElementById("Create").style.display = "none";
	document.getElementById("Rooms").style.display = "none";
	document.getElementById("Users").style.display = "block";
	
	
	$("#userButt").attr('class', 'tablinks active');
	$("#roomButt").attr('class', 'tablinks');
	$("#createButt").attr('class', 'tablinks');

	


}

function clickedCreate(evt, selectedTab) {
	// Declare all variables
	var i, tabcontent, tablinks;

	document.getElementById("Create").style.display = "block";
	document.getElementById("Rooms").style.display = "none";
	document.getElementById("Users").style.display = "none";
	
	$("#userButt").attr('class', 'tablinks');
	$("#roomButt").attr('class', 'tablinks');
	$("#createButt").attr('class', 'tablinks active');
		
}



$(document).ready(function(){





	




});
