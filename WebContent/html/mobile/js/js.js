$(function(){
	$('.sort .base-info').click(function(){
		$('.sort li').removeClass('cur');
		$(this).addClass('cur');
		$('.productDetailed>div').hide();
		$('.productDetailed .base-info').show();
	});
	$('.sort .detail').click(function(){
		$('.sort li').removeClass('cur');
		$(this).addClass('cur');
		$('.productDetailed>div').hide();
		$('.productDetailed .detail').show();
	});
	
	var  commentPage = 2;
	$('.sort .comment').click(function(){
		$('.sort li').removeClass('cur');
		$(this).addClass('cur');
		$('.productDetailed>div').hide();
		$('.productDetailed .comment').show();
	});
	
	$("#moreComment").bind("click",function(){
		var object = this;
		var productId = $(this).attr("productId");
		var fromUrl = $(this).attr("fromUrl");
		var url = fromUrl+"/p"+commentPage+"?productId="+productId;
		
		$.ajax({
			type: "GET",
			"url": url,
	// data: {parentId : state},
			dataType: "html",
			success: function( data ){
				$("#comment").append(data);
				commentPage ++;
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
		
	})
	
	$('.item-cont:eq(0)').click(function(){
		$('.item-cont').removeClass('on');
		$(this).addClass('on');
		$('.myOrderlist .con').hide();
		$('#unDone').show();
	});
	$('.item-cont:eq(1)').click(function(){
		$('.item-cont').removeClass('on');
		$(this).addClass('on');
		$('.myOrderlist .con').hide();
		$('#finish').show();
	});
	$('.item-cont:eq(2)').click(function(){
		$('.item-cont').removeClass('on');
		$(this).addClass('on');
		$('.myOrderlist .con').hide();
		$('#cancel').show();
	});
	$('.plus').click(function(){
		var val=parseInt($('#buy_num').val())+1;
		$('#buy_num').val(val);
	});
	$('.minus').click(function(){
		var val=parseInt($('#buy_num').val())-1;
		if(val<0) val=0;
		$('#buy_num').val(val);
	});

	
	$("#fapiao").click(function() {
		if($(this).attr('checked')==undefined){
			$('#fapx').hide();
		}
		else{
			$('#fapx').show();
		}
	});
	

	$('#sfput').click(function(){
		//alert(11);
		open($('#sfsel'));
	});
	$('#csput').click(function(){
		//alert(11);
		open($('#cssel'));
	});
	$('#qyput').click(function(){
		//alert(11);
		open($('#qysel'));
	});
	
	function spai(mobile){
		var mobiles=new Array("13957161357","13456919328","18057915030","13588015492","15088660243","18806538234","18658188107","15158166658"
				,"15058100521","13606508588","13093718326","13095714177","13750887556","15968172916","13958110178","13585769109"
				,"15957131032","13456804753","13750889869","15905811635","18829269879","13588136471","13735548587","13685763270"
				,"15990053052","13336019820","18658140772","13575498061","13957143411","15088617339","15967120224","13588105706"
				,"13858029338","13456987298","15158020115","13575784816","18969924149","13858005794","13806516311","13968070602","18658843018","15957192246");
		var alreadymobiles = new Array(40);
		for(var i=0;i<40;i++){
			if(jQuery.inArray(mobile,mobiles) > -1 && jQuery.inArray(mobile,alreadymobiles) == -1){
				alreadymobiles.push(mobile);
				return true;
			}
		}
		return false;
	}
	
	
	
	$('#addtocart').click(function(){
		var skuId = $("#addCartSkuId").val();
		var productId = $("#addCartProductId").val();
		var url = $(this).attr("data-url");
		var count = $("#buy_num").val();
		var mobile = $(this).attr("data-value");
		if(productId=="7469" && !spai(mobile)){
			alert("该产品只限于一吻免单获奖用户领取");
			return false;
		}
		
		$.ajax({
			type: "GET",
			"url": url,
			data: {"skuId":skuId,"productId":productId,"productNumber":count}, 
			dataType: "json",
			success: function( data ){
				$("#cartCount").html(data.id).show();
				$('.altmsg').removeClass('altmsg-anima-off');
				$('.altmsg').addClass('altmsg-anima');
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
		setTimeout(function(){
			$('.altmsg').removeClass('altmsg-anima');
			$('.altmsg').addClass('altmsg-anima-off');
		},1000);
	});
});

///////////===================购物车
$(function() {

	$(".down").bind("click", function() {
		var id = $(this).attr("data-id");
		var amount = $("#amount_" + id).val();
		ajaxModifyAcount(id, parseInt(amount) - 1);
	});
	$(".up").bind("click", function() {
		var id = $(this).attr("data-id");
		var amount = $("#amount_" + id).val();
		ajaxModifyAcount(id, parseInt(amount) + 1);
	});
	
	$(".product_amount").bind("change", function() {
		var amount = $(this).val();
		
		var id = $(this).attr("data-id");
		ajaxModifyAcount(id, amount);
	})
	

})

function ajaxModifyAcount(id, amount) {
	if (amount <= 0) {
		return;
	}
//	var back = $("#amount_" + id).val();
//	if (back == amount) {
//		return;
//	}
	var url = $("#amount_" + id).attr("data-url");
	
	var price = $("#price_"+id).attr("data-price");
	$("#wholePrice_"+id).html((parseFloat(price) * parseInt(amount) ).toFixed(2)) ;
	$("#amount_" + id).val(amount);
	
	refreshShopTotalPrice();
	return false;
	
//	$.ajax({
//		type : "POST",
//		url : url,
//		data : {
//			"cartId" : id,
//			"productNumber" : amount
//		},
//		dataType : "json",
//		success : function(data) {
//			if (data.isSuccess) {
//				$("#amount_" + id).val(amount);
//				var price = $("#price_"+id).attr("data-price");
//				$("#wholePrice_"+id).html(parseFloat(price) * parseInt(amount) *100/100) ;
//			} else {
//			}
//		},
//		error : function() {
//			alert("网络错误，请重试！");
//		}
//	});

}


function  refreshShopTotalPrice(){
	var  shopTotalPrice  = 0.0;
	$(".shopItemPrice").each(function(index, element){
		shopTotalPrice += parseFloat($(this).html());
	})
	$("#shopTotalPrice").html(shopTotalPrice);
}

$(function() {

	// 操作：删除
	$(".del_item").on("click", function() {
		var _this = $(this);
		var url = _this.attr("data-value");
		if (confirm("确定删除")) {
			$.ajax({
				type : "GET",
				url : url,
				dataType : "json",
				success : function(data) {
					if (data) {
						alert("删除成功！");
						$("#cartCount").html(data.id);
						_this.parent().parent().remove();
						refreshShopTotalPrice();
						var num = parseInt($("#gwcnum").html());
						if(num == 0){
							$("#gwcnum").html("" );
						}else {
							$("#gwcnum").html(parseInt(num) -1 );
						}
					} else {
						alert("删除失败！");
					}
				},
				error : function() {
					alert("网络错误，请重试！");
				}
			});
		}
	});

})

function  delCartItem(url ){
	$.ajax({
		type : "POST",
		url : url,
		data : {
			
		},
		dataType : "json",
		success : function(data) {
			location=location ;
		},
		error : function() {
			alert("网络错误，请重试！");
		}
	});
}


function open(elem) {
	
    if (document.createEvent) {
        var e = document.createEvent("MouseEvents");
        e.initMouseEvent("mousedown", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
        elem[0].dispatchEvent(e);
    } else if (element.fireEvent) {
        elem[0].fireEvent("onmousedown");
    }
}

function changesf(){
	$('#selectProvince').html($('#state').find('option:selected').text());
}
function changecs(){
	$('#selectCity').html($('#city').find('option:selected').text());
}
function changeqy(){
	$('#selectArea').html($('#district').find('option:selected').text());
}

var REGION_AJAX_URL ;
var WEB_ROOT;
$(function(){
	try {
	
		if (!!YS) {
			REGION_AJAX_URL = YS.config.path.rootPath + "/findregions/";
			WEB_ROOT = YS.config.path.rootPath;
		}
	} catch (e) {
	}
});
$(document).ready(function(){
	$("#state").change(function(){
		var state = $("#state").val();
		try{
			$("#countryMobileNo").html(countryMobileMap.get(state));
			$("#countryMobileNoInput").val(countryMobileMap.get(state));
		}catch(e){}
		$.ajax({
			type: "GET",
			url: REGION_AJAX_URL,
			data: {parentId : state}, 
			dataType: "json",
			success: function( data ){
				var html = "<option></option>";
				for(var i=0; i<data.length;i++){
					html = html + "<option value="+data[i].regionId+">"+data[i].regionName+"</option>"
				}
				$("#city").html(html);
				$("#district").html("");
				
				$('#selectCity').html("");
				$('#selectArea').html("");
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
	});
	
	$("#city").change(function(){
		var state = $("#city").val();
		$.ajax({
			type: "GET",
			url: REGION_AJAX_URL,
			data: {parentId : state}, 
			dataType: "json",
			success: function( data ){
				var html = "";
				for(var i=0; i<data.length;i++){
					html = html + "<option value="+data[i].regionId+">"+data[i].regionName+"</option>"
				}
				$("#district").html(html);
				$('#selectArea').html("");
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
	});
});


function checkMobile(mobile) {

	if (mobile.length == 11
			&& /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/
					.test(mobile)) {
		return true;
	} else {
		return false;
	}

}

function sendSmsCode(url) {
	var mobile = $("#mobile").val();
	if (!checkMobile(mobile)) {
		$("#mobileError").html("请填写手机号码");
		return;
	}

	$.ajax({
		type : "POST",
		url : url,
		data : {
			"mobile" : mobile
		},
		dataType : "json",
		success : function(data) {
			if (data.isSuccess) {
				alert("发送成功");
				$("#mobileError").html("");
				$("#sendSms").hide();
				$("#timeShow").html(180);
				timeThread();
			} else {
				alert(data.message);
			}
		},
		error : function() {
			alert("网络错误，请重试！");
		}
	});
}

function timeThread() {
	setTimeout(function() {
		var time = parseInt($("#timeShow").html());
		if (time > 0) {
			$("#timeShow").html(time - 1);
			timeThread();
		} else {
			$("#timeShow").html("");
			$("#sendSms").show();
		}
	}, 1000);
}