$(document).ready(function(){

var 높이 = document.documentElement.scrollHeight-document.documentElement.clientHeight;      
    window.addEventListener('scroll', function(){
        var 스크롤길이 = document.documentElement.scrollTop;
        var 게이지바 = (스크롤길이 / 높이) *100;
        $('.gagebar').css('width',게이지바 + '%');

        if(스크롤길이 > 400){
          document.querySelector(".topscroll").style.display = "block";
      } else{
          document.querySelector(".topscroll").style.display = "none";
      }
    });
    document.querySelector('.topscroll').addEventListener('click', function(){
      window.scrollTo(0,0);
   });




//로그인 누르면 loginbgout이 나오게 하는 효과
$('#loginuser1').click(function(){
  $('.loginbgout').addClass("show");
});

$('.closebtn').click(function(){
  $('.loginbgout').removeClass("show");
})

//검은화면 눌러도 꺼지게 하는 효과
$('.loginbgout').click(function(e){
  if(e.target == document.querySelector('.loginbgout')){
  $('.loginbgout').removeClass("show");
  }
})


//로그인 누르면 loginbgout이 나오게 하는 효과
$('#loginuser2').click(function(){
  $('.reportbgout').addClass("show");
});
$('.closebtn1').click(function(){
  $('.reportbgout').removeClass("show");
})
//검은화면 눌러도 꺼지게 하는 효과
$('.reportbgout').click(function(e){
  if(e.target == document.querySelector('.reportbgout')){
  $('.reportbgout').removeClass("show");
  }
})




 //메인이미지슬라이드 효과
 var 안바낌 = 0;
 $('.headerimg>li:gt(0)').hide();
let interval = setInterval(slidea,5000);
 
function slidea(){
   if(2 > 안바낌){
     $('.headerimg>li').fadeOut();
     안바낌 ++;
     $('.headerimg>li').eq(안바낌).fadeIn();
    
   } else if(안바낌 >= 2){
     $('.headerimg>li').fadeOut();
    안바낌 = 0;
    $('.headerimg>li').eq(안바낌).fadeIn();
   }
 }

 $('.btnb').click(function(){
   if(2 > 안바낌){
   $('.headerimg>li').fadeOut();
   안바낌++;
     $('.headerimg>li').eq(안바낌).fadeIn();
   }
    else if(안바낌 >= 2){
     안바낌 = 0;
     $('.headerimg>li').fadeOut();
     $('.headerimg>li').eq(안바낌).fadeIn();
   }
 });

 $('.btna').click(function(){
   if(안바낌 > 0){
   $('.headerimg>li').fadeOut();
   안바낌--;
     $('.headerimg>li').eq(안바낌).fadeIn();
   }
    else if(안바낌 == 0){
     안바낌 = 2;
     $('.headerimg>li').fadeOut();
     $('.headerimg>li').eq(안바낌).fadeIn();
   }
 });



 /////버튼관련종료


//레이어팝업
$('#laybtn').click(function(){
  $('.layerpopup').addClass("show");
  $('body').addClass("scrollnone");
});
$('.cbtn').click(function(){
  $('.layerpopup').removeClass("show");
  $('body').removeClass("scrollnone");
});
//레이어팝업종료



});