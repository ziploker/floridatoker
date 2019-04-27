$(document).ready(function(){

//green1: #2fd13e
//green2: #269630

//green3: #407132
	

	$("#path42").on("mouseover", function() {
    	$("#path42").css({fill: "#2fd13e", transition: ".25s"});
    	$("#path40").css({fill: "#407132", transition: ".25s"});
    	$("#path38").css({fill: "#269630", transition: ".25s"});
	}).on("mouseout", function() {
    	$("#path42").css({fill: "#407132", transition: "1.2s"});
    	$("#path40").css({fill: "#269630", transition: "1.2s"});
    	$("#path38").css({fill: "#2fd13e", transition: "1.2s"});
    });


	$("#path40").on("mouseover", function() {
    	$("#path40").css({fill: "#2fd13e", transition: ".5"});
    	$("#path42").css({fill: "#269630", transition: ".5s"});
    	$("#path38").css({fill: "#407132", transition: ".5s"});
	}).on("mouseout", function() {
    	$("#path40").css({fill: "#269630", transition: ".5s"});
    	$("#path42").css({fill: "#407132", transition: ".5s"});
    	$("#path38").css({fill: "#2fd13e", transition: ".5"});
    });

	$("#path38").on("mouseover", function() {
    	$("#path38").css({fill: "#407132", transition: ".5s"});
    	$("#path40").css({fill: "#2fd13e", transition: ".5"});
    	$("#path42").css({fill: "#269630", transition: ".5s"});
	}).on("mouseout", function() {
    	$("#path38").css({fill: "#2fd13e", transition: ".5"});
    	$("#path42").css({fill: "#407132", transition: ".5s"});
    	$("#path40").css({fill: "#269630", transition: ".5s"});
    });







});