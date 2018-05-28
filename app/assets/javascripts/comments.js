
//Checks if element is in viewport Boolean
//and also gets offset (how far under the viewport the replysection is
//after getting toggled into view) that offset is added to current scrolltop
//to get new scrolltop value scrolls up.
function isThere(elementToBeChecked) {
    var TopView = $(window).scrollTop();
    console.log('topview: ' + TopView);
    
    var BotView = TopView + $(window).height();
    console.log('botview: ' + BotView);
    
    var TopElement = $(elementToBeChecked).offset().top;
    console.log('topelement: ' + TopElement);
    
    var BotElement = TopElement + $(elementToBeChecked).height() + 20;
    console.log('botelement: ' + BotElement);

    var lowerOffset = (BotElement - BotView) + TopView;

    return [(BotElement < BotView), lowerOffset];

}

$(document).ready(function(){

    var randomguestnumer = Math.floor(Math.random() * 9876) + 1234;

    var nickname = ("guest-" + randomguestnumer);
    
    //lastclicked anchor used for reply section toggle
    var lastClicked = "thc";
    var lastId = 'thc';
    

    


    // every time a reply link is clicked
    $(".rep").unbind("click").click(function (event) {
            
        
        
        
        //checks global variable to see if this is first
        // time a "reply was clicked. thc is initial value.
        if (lastClicked == "thc"){

            //get nessesary variables based on anchor that was clicked 
            var CommentId = $(this).attr('id');
            var parentId = $(this).attr("data-id");
            var myElement = $(this).parent().parent().parent().next().find('.testscroll').eq(0);

            // set global lastclicked var to ID of the last anchor that was clicked
            lastClicked = "#" + CommentId + ".replybox";
            lastId = "#" + CommentId;
            //changes text value of "reply" anchor to "cancel"
            $("#" + CommentId).text('Cancel');
            console.log("#" + CommentId);
            //show the hidden reply section of anchor that was clicked
            $("#" + CommentId + ".replybox").toggle('slow', function() {
                
                //gets array from function
                var resultz = isThere( myElement );
                


                //if resultz[0] is not true ...aka(not in VIEWport)
                //then scrolltop to new value to show replysection in viewport
                if (!resultz[0] && $( window ).width() > 1000){

                    $('html,body').animate({scrollTop: resultz[1]}, 1000);

                }

            });
                

            //apply focus to newly toggled replysection
            //$(this).parent().parent().parent().next().find('.commenterrors').show().empty().append("<h2>Please enter a comment> </h2").delay(1000).fadeOut(4278);
            $(this).parent().parent().parent().next().find('textarea').eq(0).focus();
          
        
        //if the same anchor was clicked aka..(reply was cancled)
        }else if (lastClicked == "#" + $(this).attr('id') + ".replybox"){

            //get nessesary variables based on clicked 
            var CommentId = $(this).attr('id');
            var parentId = $(this).attr("data-id");
            var myElement = $(this).parent().parent().parent().next().find('.testscroll').eq(0);

            // reset global lastclicked var...
            lastClicked = "thc";
            lastId = "#" + CommentId;

            //resets the anchor text back to "reply" from "cancel"
            $("#" + CommentId).text('Reply');
            
            //toggles the reply section back closed
            $("#" + CommentId + ".replybox").toggle("slow");
            
                      
        //if multiple "reply" anchors of different comments are clicked  
        }else{    
            
            //get nessesary variables based on clicked
            var CommentId = $(this).attr('id')
            var parentId = $(this).attr("data-id");
            var myElement = $(this).parent().parent().parent().next().find('.testscroll').eq(0);
            
            
            //resets the anchor text back to "reply" from "cancel"
            $(lastId).text('Reply');
            
            //sets lastId to this anchor that was clicked
            lastId = "#" + CommentId;

            //changes text value of "reply" anchor to "cancel"
            $("a#" + CommentId).text('Cancel');
            
            // toggle back the last clicked anchor
            $(lastClicked).toggle("slow");

            // set global lastclicked var to ID of the last anchor that was clicked
            lastClicked = "#" + CommentId + ".replybox";

            //show the hidden reply section of anchor that was clicked
            $("#" + CommentId + ".replybox").toggle("slow", function () {
                
                //gets array from function
                var resultz = isThere( myElement );
                
               
                //if resultz[0] is not true ...aka(not in VIEWport)
                //then scrolltop to new value to show replysection in viewport
                if (!resultz[0] && $( window ).width() > 1000){

                    $('html,body').animate({scrollTop: resultz[1]}, 1000);
                }
            });
            
           
            //apply focus to newly toggled replysection
            $(this).parent().parent().parent().next().find('textarea').eq(0).focus(); 
        }
    }); 

    
    $('#submit0').click(function (event) { 

        event.preventDefault(); 
        console.log('submit0');

        var comment = $(this).parent().parent().find('.textarea0').val();


        if(comment == "" ){
            console.log('insideIT');
            $(this).parent().find('.commenterrors').show().empty().append("<h2>Please enter a comment.</h2").delay(1000).fadeOut(4278);
            //$('#lookup_errors').show().empty().append("Please enter at least a zipcode.");
            return;
        }


        
        var csrnickname = $('#nickname0').val();

        console.log(csrnickname);


        if (csrnickname == "") {

            
            $('#nickname0').val(nickname);
            
            console.log("was blank, loaded default");
        }else{

            console.log("it was added");
        }
        $('#leveloneform').submit();

    });
        



    $('.submit1').on('click', function (event) { 

        event.preventDefault(); 
        console.log('submit1');
        
        //get commentid attribute
        //var commentId = $(this).parent().parent().parent().parent().parent().find('.rep').attr('id');
        
        //use commentid to build full address of error box
        //var commentErrorsAddy = 'comment_errors' + commentId;
        var comment = $(this).parent().parent().find('.textarea1').val();


        if(comment == "" ){
            console.log('insideIT');
            $(this).parent().find('.commenterrors').show().empty().append("<h2>Please enter a comment.</h2").delay(1000).fadeOut(4278);
            //$('#lookup_errors').show().empty().append("Please enter at least a zipcode.");
            return;
        }







        //$(this).parent().parent().parent().parent().find('.commenterrors').text('testerrors');

        
        

        var csrnickname = $(this).parent().find('.nickname').eq(0).val();
        //console.log(csrnickname);


        if (csrnickname == "") {

            
            $(this).parent().find('.nickname').eq(0).val(nickname);
            
            //console.log("was blank, loaded default");
        }else{

            //console.log("it was added");
        }
        $(this).parent().parent().submit();

    });

    

    $('.destsubmit').on('click', function (event) { 

        event.preventDefault(); 
        console.log('.destsubmit');

        var comment = $(this).parent().parent().find('.textarea').val();
        console.log(comment);

        if(comment == "" ){
            console.log('insideIT2');
            $(this).parent().find('.commenterrors').show().empty().append("<h2>Please enter a comment.</h2").delay(1000).fadeOut(4278);
            //$('#lookup_errors').show().empty().append("Please enter at least a zipcode.");
            return;
        }
        



        var csrnickname = $(this).parent().find('.destnick').eq(0).val();

        //console.log(csrnickname);


        if (csrnickname == "") {

            
            $(this).parent().find('.destnick').eq(0).val(nickname);
            
            //console.log("was bblank, loaded default");
        }else{

            //console.log("it was added");
        }
        $(this).parent().parent().submit();

    });

    

    $('.sourcesubmit').on('click', function (event) { 

        event.preventDefault(); 
        
        
        var comment = $(this).parent().parent().find('.textarea').val();


        if(comment == "" ){
            console.log('insideIT');
            $(this).parent().find('.commenterrors').show().empty().append("<h2>Please enter a comment.</h2").delay(1000).fadeOut(4278);
            //$('#lookup_errors').show().empty().append("Please enter at least a zipcode.");
            return;
        }




        var csrnickname = $(this).parent().find('.sourcenick').eq(0).val();

        if (csrnickname == "") {

            $(this).parent().find('.sourcenick').eq(0).val(nickname);
            
        }else{

            //console.log("it was addedd");
        }
        
        var csrnickname = $(this).parent().find('.sourcenick').eq(0).val();
        //console.log('finish: ' + csrnickname);

        //get parent id from the submit button click
        var destaddress = $(this).attr('data-destaddy');

        //get comment id from the submit button click
        var sourceaddress = $(this).attr('data-sourceaddy');
        
        //use comment id from above to get comment body
        var fulldestaddy = '#sourceaddress' + destaddress;  
        var fullnickaddy = '#destnick' + destaddress;       
        var sourcebody = $('#sourcebody' + sourceaddress).val();
        
        $(fulldestaddy).val(sourcebody);
        $(fullnickaddy).val(csrnickname);
        

        $('#destform' + destaddress).submit();
        


    });

    


    var InOrOut = function(element){
        console.log(element);
        if (element.length) {

            var offset = element.offset().top - $(window).scrollTop();
            offset = offset + 100;
            console.log('windowinnerheight: ' + window.innerHeight);
            console.log(offset);
            console.log('elementoffsettop: ' + element.offset().top);
            console.log('windowscrolltop: ' + $(window).scrollTop());

            if(offset > window.innerHeight){
                // Not in view

                $('html,body').animate({scrollTop: offset}, 1000);
                return false;
            }else{
           return true;
            
            }
        }else{
            console.log('no no no');
        }
    };
    

    var IsIt = function(element){

        var top_of_element = $(element).offset().top;
        var bottom_of_element = $(element).offset().top + $(element).outerHeight;
        var bottom_of_screen = $(window).scrollTop() + $(window).height();

        if((bottom_of_screen > top_of_element) && (bottom_of_screen < bottom_of_element)){
            console.log('is');
        }
        else {
            // The element is not visible, do something else
            console.log('isNOT');
        }


    };
    
});



   



