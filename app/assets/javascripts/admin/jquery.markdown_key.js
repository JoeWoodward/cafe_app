// code to reveal and hide the markdown key
$('.markdown_toggle').live('click', function(){
  $('.markdown_toggle').hide();
  $('.markdown-key').animate({paddingLeft: 12, paddingRight: 12, paddingTop: 10, paddingBottom: 10, width: 261, height: 328}, 500);
  $('.markdown-key .content').delay(400).fadeIn(400, function(){$('.markdown_toggle').hide();})
})

$('.markdown-key .content').live('click', function(){
  $('.markdown-key .content').hide();
  $('.markdown-key').animate({paddingLeft: 2, paddingRight: 2, paddingTop: 2, paddingBottom: 2, width: 16, height: 112}, 500);
  $('.markdown_toggle').delay(400).fadeIn(400, function(){$('.markdown-key .content').hide();})
})
