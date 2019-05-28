
function clickedRooms(evt, selectedTab) {
	// Declare all variables
	var i, tabcontent, tablinks;

	document.getElementById("Rooms").style.display = "block";
	document.getElementById("Users").style.display = "none";
	
	//document.getElementById("Room").className.replace(" active", "");
	//document.getElementById("Users").className.replace(" active", "");

	evt.currentTarget.className += " active";
		
}


function clickedUsers(evt, selectedTab) {
	// Declare all variables
	var i, tabcontent, tablinks;

	document.getElementById("Rooms").style.display = "none";
	document.getElementById("Users").style.display = "block";
	
	//document.getElementById("Room").className.replace(" active", "");
	//document.getElementById("Users").className.replace(" active", "");

	evt.currentTarget.className += " active";
		
}



$(document).ready(function(){





	




});
