
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


$('.cat h3').click(function(){
    $(this).next('.full-view').fadeToggle(200);
  })


  $('.show-child').click(function(){

    $(this).next('ul').fadeToggle(200).removeClass('hidden');
    if($(this).find('i').hasClass('fa-plus'))
    {
        $(this).find('i').removeClass('fa-plus').addClass('fa-minus');
    }
    else{
        $(this).find('i').removeClass('fa-minus').addClass('fa-plus');
    }
  })


$('.ordering span').click(function(){
  $(this).addClass('active').siblings('span').removeClass('active');
  if($(this).data('view')==='full')
  {
      $('.cat .full-view').fadeIn();
  }
  else
  {
    $('.cat .full-view').fadeOut();
}
})

function auto_grow(element) {
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}
