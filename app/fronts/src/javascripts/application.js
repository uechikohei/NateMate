$(function(){
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:4000,
    speed:1000,
    accessibility: true,
    dots:true,


    });
    $('.slick-dots li').on('mouseover', function() {
        $('.slider').slick('goTo', $(this).index());
});
});
$( document ).on('turbolinks:load',function() {

function readURL(input) {
  if (input.files && input.files[0]) {
  var reader = new FileReader();
  reader.onload = function (e) {
$('#img_prev').attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
  }
}
$("#present_img").change(function(){
  readURL(this);
});

});