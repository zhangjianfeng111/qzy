//body 最小高度 
var win_h = $(window).height()
    $(document).ready(function() {
        $('body').css({'minHeight': win_h}); 
    });
//购物车删除商品
function cartDelPro(obj){
	var shop_main = $('#cartPro ul li');
	if ($(obj).hasClass('on')) {
		$(obj).removeClass('on');
		$(obj).addClass('idel');
		shop_main.css({"left": '0px'});
	}else {

        $(obj).addClass('on');
		$(obj).removeClass('idel');
		shop_main.css({"left": '-70px'});

     }
}
//我的收藏删除商品
function favtDelPro(obj){
	var fav_main = $('.myFavorites ul li');
	if ($(obj).hasClass('on')) {
		$(obj).removeClass('on');
		$(obj).addClass('idel');
		fav_main.css({"left": '0px'});
	}else {
        $(obj).addClass('on');
		$(obj).removeClass('idel');
		fav_main.css({"left": '-70px'});

     }
}
//地址列表选择地址
$(".add-box").on('click',function(){
	$(".add-box").css({'left':'0px'});
	$(".add-box").attr({'name':'off'});
	if($(this).attr('name')=='on'){
		$(this).css({'left':'0px'});
		$(this).attr({'name':'off'});
	}else{
		$(this).attr({'name':'on'});
		$(this).css({'left':'30px'});
	}
        $("#selectedaddress_id").val($(this).attr('id'));
        $('#theForm').submit();
})
//品类
$(".openlis").on('click',function(){
	if($(this).attr('name')=='off'){
		$(this).attr('name','on');
		$(this).removeClass('openlis');
		$(this).addClass('offlis');
		$(this).next().css({'display':'block'});
	}else{
		$(this).attr('name','off');
		$(this).removeClass('offlis');
		$(this).addClass('openlis');
		$(this).next().css({'display':'none'});
	}
})
//滑块按钮动画 和下面内容展开
$(".silde-btn").on('click',function(){
	if($(this).attr('name')=='off'){
		$(this).attr('name','on')
		$(this).children('i').removeClass('silde-anima-u');
		$(this).children('i').addClass('silde-anima-i');
		$(this).css({'background':'#56d43c','border':'1px solid #56d43c'})	
		$(this).parent().siblings('.od_hide_obj').show();
		$(this).parent('.fl-item').removeClass('nobd');
	}else{
		$(this).attr('name','off');
		$(this).children('i').removeClass('silde-anima-i');
		$(this).children('i').addClass('silde-anima-u');
		$(this).css({'background':'#f1f1f1','border':'1px solid #ccc'})	
		$(this).parent().siblings('.od_hide_obj').hide();
		$(this).parent('.fl-item').addClass('nobd');
	}
})
function addCart(){
	//$('.mask').css({'display':'block'});
	if($('.altmsg').attr('name')=='off'){
		$('.altmsg').attr('name','off');
		$('.altmsg').attr('name','on');
		$('.altmsg').removeClass('altmsg-anima-off');
		$('.altmsg').addClass('altmsg-anima');
		setTimeout(function() {
			$('.altmsg').removeClass('altmsg-anima');
			$('.altmsg').addClass('altmsg-anima-off');
			$('.altmsg').attr('name','off');
		}, 1000);
		}else{
			$('.altmsg').attr('name','off');
			$('.altmsg').removeClass('altmsg-anima');
		}
	 event.preventDefault();//阻止a标签href事件
	}
//商品详情-添加购物车
//$(function(){
//$('#add-cart').on('click',function(){addCart()});
//$('.cart').on('click',function(){addCart()});
//})
//商品详情-内容切换
$(function(){
$('.sort li').on('click',function(){
	$(this).siblings().removeClass('cur')
	$(this).addClass('cur');
	var name='.'+$(this).attr('name');
	$(name).siblings().css({'display':'none'});
	$(name).css({'display':'block'});
	})
});

//商品详情-产品规格选择
$(function(){
$('.spec dl').on('click',function(){
	$(this).siblings().removeClass('on')
	$(this).addClass('on')
})
});

//下拉显示列表,遮罩层
function showmask(){
    $('.mask').css({'display':'none'})
    $('.header').css({'display':'block'})
    $('.footer').css({'display':'block'})
}
function hidemask () {
     $('.mask').css({'display':'block'})
    $('.header').css({'display':'none'})
    $('.footer').css({'display':'none'})
}

$('.layername').on('click',function(){
    $(this).parent('span').css({'z-index':'99'})
    $(this).next('.mlist').css({'display':'block'})
    hidemask();
  
})
$('.mlist dd').on('click',function(){
    $(this).parent().parent('span').css({'z-index':''})
    $(this).parent('.mlist').css({'display':'none'})
    showmask();
})
//优惠券选择
$('.coup_pick').on('click',function (){
	$(this).css({'background':'#f1f1f1'})
	$(this).siblings('li').css({'background':''})
})
//更多
$('.more_pick').on('click',function () {
	$('.moreWeb').hide();
	$('.moreimg').show();
	$('.more_nav').show();
	
	var navtit=$(this).children('.name').html();
	$('.more_nav').prev('h2').html(navtit);
	var imgname='#'+$(this).attr('name');
	var imgsrc=$(imgname).attr('_src');
	$('.more_nav').children('a').on('click',function(){
		$('.moreWeb').show();
		$('.moreimg').hide();
		$('.more_nav').hide();
		$('.more_nav').prev('h2').html('更多');
		$(imgname).hide();
	})
	$(imgname).show();
	$(imgname).attr('src',imgsrc);
})
