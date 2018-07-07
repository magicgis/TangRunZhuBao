/**
 * Created by admin on 2018-05-03 15:05.
 */
/*
$("#valuator-scroll")*/
var length = $("#valuator-scroll .valuator-item").length;
var index = 0;
$('.valuator-item').hide();
$('.valuator-item:eq('+index+')').show();
$(".prev-btn").click(function(){
    index--;
    if(index<0){
        index = length-1;
    }
    $('.valuator-item').hide();
    $('.valuator-item:eq('+index+')').show().find('.face').addClass('animated bounceInRight');
    $('.valuator-item:eq('+index+')').show().find('.detail').addClass('animated bounceInLeft');
    $('.scroll-nav a').removeClass('active');
    $('.scroll-nav a:eq('+index+')').addClass('active');
})
$(".next-btn").click(function(){
    index++;
    if(index>length-1){
        index = 0;
    }
    $('.valuator-item').hide();
    $('.valuator-item:eq('+index+')').show().find('.face').addClass('animated bounceInRight');
    $('.valuator-item:eq('+index+')').show().find('.detail').addClass('animated bounceInLeft');
    $('.scroll-nav a').removeClass('active');
    $('.scroll-nav a:eq('+index+')').addClass('active');
})

$(function() {
	///////////路径需要改下  ctxStatic+"/modules/cms/front/themes/basic/asset/img/time.gif"
    $("img.lazy").lazyload({ placeholder : ctxStatic+"/modules/cms/front/themes/basic/asset/img/time.gif",effect: "show", threshold: 50});
});


/*
* 站点菜单自适应
* */
$(".min-menu-btn").click(function(){
    if($(".min-site-menu").attr('data-status') == '0') {
        $(".min-site-menu").animate({'left':'0'});
        $(".min-site-menu").attr('data-status','1');
    }else{
        $(".min-site-menu").animate({'left':'-100%'});
        $(".min-site-menu").attr('data-status','0');
    }
})
$(window).resize(function(){
    $(".min-site-menu").attr('data-status','0');
    $(".min-site-menu").css({'left':'-100%'});
})
