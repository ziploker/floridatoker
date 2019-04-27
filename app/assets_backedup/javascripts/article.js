


$(document).ready(function(){

	var colorArray = ['#2fd13e', '#269630', '#407132'];   

	var rand = colorArray[Math.floor(Math.random() * colorArray.length)];

	

	$("#navbox a").on("mouseover", function() {
    	$(this).css("color", "#2fd13e");

	}).on("mouseout", function() {
    	$(this).css("color", "#e0f2e6");
    	rand = colorArray[Math.floor(Math.random() * colorArray.length)];
	});

});