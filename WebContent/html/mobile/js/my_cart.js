var cart = {
	$productList 	: $('.myCart div.buys ul'),
	$action			: $('.action'),
	$btnOpenDel		: $('.idel.right'),
	$switch			: $('.right,.on'),
	$btnDel			: $('.del-item'),
	$ttp			: $('#ttp'),
	getGiftContainer	: function(){
		return $('.pbox-list-a.pic-70.pbox-gift ul');
	},
	getBtnChangeVal	: function(){
		return $('.deC,.inC');
	},
	reloadCount	: function(cart){
		$('#ttp').text(cart.total);
	},
	updateCount		: function(skuId,qty,ele){
		var updateCountUrl = ctx + '/cart/updateCount/' + skuId + '/' + qty;
		ajax(updateCountUrl,null,function(jsonData){
			$(ele).parent().find('.qty').val(qty);//添加成功后修改数量
			cart.reloadNotice(jsonData);//赠品、抵扣通知
			cart.reLoadGift(jsonData);
			loadCount();//重新计算数量
			cart.reloadCount(jsonData);
		});
	},
	reLoadGift		: function(cartJsonData){
		//两类赠品，需要加载到同一个位置
		var signedGift		= cart.getGiftTpl(cartJsonData.signedGift);
		var moneyUptoGifts	= cart.getGiftTpl(cartJsonData.moneyUptoGifts);
		
		var gifts =  moneyUptoGifts + signedGift;
		$giftContainer = $('.pbox-list-a.pbox-gift ul');
		if(gifts.length && !$('.pbox-list-a.pbox-gift ul').length)
			cart.loadGiftContainer();
		if(!gifts.length)
			cart.removeGift();
		$giftContainer = $('.pbox-list-a.pbox-gift ul');
		$giftContainer.html(gifts + '<div class="c"></div>');
	},
	loadGiftContainer : function(){
		//加载赠品标题
		var title = '<div class="form-list-a" style="border-top: 1px solid #ccc;margin-top:10px;background: #fff">'+
                    ' <ul>'+
                    '    <li class="fl-item">'+
                    '        <b class="name">赠品来啦</b>'+
                    '    </li>'+
                    ' </ul>'+
                 '</div>';
        var container = '<div class="pbox-list-a pic-70 pbox-gift">'+
                    		'<ul></ul>'+
                 		'</div>';
        $('.myCart').append(title).append(container);//加载到文档中
	},
	getGiftTpl: function(giftArr){
		if(!giftArr)
			return "";
		var giftTplArr = [];
		$.each(giftArr,function(idx,thisGift){
			var oneGift = '<li>'+
		        '     <div class="list-item p">'+
		        '         <div class="p-pic"><img src="'+thisGift.product_photo+'" alt="'+thisGift.product_name+'"></div>'+
		        '         <div class="d-con">'+
		        '             <p class="d-spe clamp-2">'+thisGift.product_name+'</p>';
		    if(thisGift.gg_name)
		        oneGift +='             <p class="d-spe clamp-2">'+thisGift.gg_name+'</p>';
		        oneGift +='</div>'+
			        '     </div>'+
			        ' </li> ';
			giftTplArr.push(oneGift);
		});
		return giftTplArr.join(' ');
	},
	disable :function(){
		cart.$action.remove();// 计算按钮和总计
		cart.$btnOpenDel.remove();// 显示删除选项的按钮
		$('.myCart').html('<div style="padding-top: 141px;padding-left: 46px;font-size: 1.2em;">篮子空空，还不赶紧首页找优惠去！</div>');
	},
	removeGift:function(){
		// 赠品信息移除
		var $gifts = cart.getGiftContainer().parent();
		var $title = $gifts.prev();
		$title.remove();
		$gifts.remove();
	},
	changeCount : function(event,eventObj,callback){
		// JS效果的修改数量
		var $this = $(eventObj);
		var $txtQty = $this.parent().find('.qty');
		var count;
		if($this.hasClass('deC')){
			count = $txtQty.val() - 0 + 1;
		}else if($this.hasClass('inC')){
			if($txtQty.val() < 2)
				return;
			count = $txtQty.val() - 1;
		}
		var skuId = $txtQty.parent().data('sku-id');
		//在这里先不修改数量，有可能增加数量失败,需要在回调函数里面使用
		if(callback)
			callback(skuId,count,eventObj);
	},
	update 		: function(event){
		cart.changeCount(event,this,cart.updateCount);
	},
	del			: function(){//删除
		var $this = $(this);
		var skuId = $this.data('sku-id');
		
		var delUrl = ctx + '/cart/del/' + skuId;
		ajax(delUrl,null,function(jsonData){
			$this.parent().remove();
			//如果没有商品，则禁用掉购物车类的操作
			if(!jsonData.cart_array)
				cart.disable();
			cart.reLoadGift(jsonData);
			loadCount();//重新计算数量
			cart.reloadNotice(jsonData);
			cart.reloadCount(jsonData);
		});
	},
	reloadNotice: function(jData){
		var notice = '';
		if(!jData)
			notice = '';
		if(jData.money_upto_notice)
			notice += '<div class="notice">' + jData.money_upto_notice + '</div>';
		if(jData.discout_price_notice)
			notice += '<div class="notice">' + jData.discout_price_notice + '</div>';
		$('#noticeCont').html(notice);
	}
};
// 享用晚餐
$(function(){
	cart.getBtnChangeVal().on('click',cart.update);
	cart.$btnDel.on('click',cart.del);
});