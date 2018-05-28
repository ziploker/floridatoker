
var myfunc = function(){
    alert(this.name);
};

var obj_a = {
    name:  "FOO"
};

var obj_b = {
    name:  "BAR!!"
};
Now you can call:

myfunc.call(obj_a);




//var htmlshit = "<h1>TEST</h1>"
//alert($jQuery.parseHTML(htmlshit));
//$('#comment_body').val($jQuery.parseHTML(htmlshit));

alert("testtt");