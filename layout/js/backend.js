
$(function()
{
'use strict'
$('[placeholder]').focus(function(){
$(this).attr('data-text',$(this).attr('placeholder'));
$(this).attr('placeholder','');
}).blur(function(){
    $(this).attr('placeholder',$(this).attr('data-text'));

})
});

$('input').each(function(){
    if($(this).attr('required')==='required'){
        $(this).after('<span class="astrec">*</span>');
    }
});

var passField=$('.password');
;
$('.show-pass').click(function(){
   
    if(passField.attr('type')=='password')
    {
        passField.attr('type','text');
        $(this).addClass('fa-eye').removeClass('fa-eye-slash');
    }
    else
    {
        passField.attr('type','password');
        $(this).addClass('fa-eye-slash').removeClass('fa-eye');
    }

}
);

$('.confirm').click(function(){
   return confirm('Are You Sure to Do this');
});

function auto_grow(element) {
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}

// display or hidden form 
$('.signup-image-link').click(function(){

$('.sign-in-signup section').hide();
$('.'+$(this).data('class')).fadeIn(500).removeClass('d-none');
// $('form')

})

$('.view-hide-comments').click(function(){
    
   if($(this).text()=="view All Comments")
   { 
    $(this).text("Hide All Comments")
     $('.all-comments').hide();
    $('#'+$(this).data('id')).fadeIn(500).removeClass('d-none');  
   }
   else{
    $('.all-comments').hide();
    $(this).text("view All Comments")
   }
})
function view(element){
    
    if(element.value.length<50){
        $('.'+element.name+'2').text(element.value);
       
    }
    else{
        $('.'+element.name+'2').text(element.value.substr(0, 50)+'...' );
    }
    
}

// ////////////////////////////////////////////   ////////////////////////////////////
// add multi image
var abc = 0;      // Declaring and defining global increment variable.
$(document).ready(function() {
//  To add new input file field dynamically, on click of "Add More Files" button below function will be executed.
$('#add_more').click(function() {
$(this).before($("<div/>", {
id: 'filediv',
class:'col-lg-3'
}).fadeIn('slow').append($("<input/>", {
name: 'file[]',
type: 'file',
id: 'file'
}), $("")));
});

// Following function will executes on change event of file input to select different file.
$('body').on('change', '#file', function() {
if (this.files && this.files[0]) {
abc += 1; // Incrementing global variable by 1.
var z = abc - 1;
var x = $(this).parent().find('#previewimg' + z).remove();
$(this).before("<div id='abcd" + abc + "' class='abcd'><img id='previewimg" + abc + "' src=''/></div>");
var reader = new FileReader();
reader.onload = imageIsLoaded;
reader.readAsDataURL(this.files[0]);

$(this).hide();
$("#abcd" + abc).append($("<div>&times;</div>" ).click(function() {
$(this).parent().parent().remove();
}));
}
});

// To Preview Image
function imageIsLoaded(e) {
$('#previewimg' + abc).attr('src', e.target.result);
};
$('#upload').click(function(e) {
var name = $(":file").val();
if (!name) {
alert("First Image Must Be Selected");
e.preventDefault();
}
});
});
// end multi image