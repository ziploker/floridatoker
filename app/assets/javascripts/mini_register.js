$(document).ready(function(){  

	$('#go_mini').click(function () {
		var e = $('#email_mini').val(); 
		window.location.href = "users/sign_up?e=" + e;

	});







});