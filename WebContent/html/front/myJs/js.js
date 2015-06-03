
///   商品详情
$(function() {
	$(".skuSpan").bind("click", function() {
		$(".skuSpan").removeClass("active");
		var skuPrice = $(this).attr("data-price");
		$(this).addClass("active");
		$("#skuPrice").html(skuPrice);

		var skuId = $(this).attr("data-id");
		$("#skuId").val(skuId);

	})

})

function chooseSecond(showId, parentId, currentId){
	$.ajax({
		type: "GET",
		url: REGION_AJAX_URL,
		data: {parentId : parentId}, 
		dataType: "json",
		success: function( data ){
			var html = "<option></option>";
			for(var i=0; i<data.length;i++){
				if(data[i].regionId == currentId ){
					html = html + "<option value="+data[i].regionId+"  selected  >"+data[i].regionName+"</option>"
				}else {
					html = html + "<option value="+data[i].regionId+">"+data[i].regionName+"</option>"
				}
			}
			$("#"+showId).html(html);
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
	
}

function intoModifyAddress(id ){
	var district = parseInt($("#district_"+id).attr("data-value"));
	$("#intoModifyAddress_"+id).parent().find('.realb').show();
	$("#intoModifyAddress_"+id).parent().find('.reala').hide();
	$("#intoModifyAddress_"+id).hide();
	$("#modifyAddress_"+id).show();
}

function modifyAddress(id, url){
	if(!$("#saveForm_"+id).valid())
		return;
	var opts = {
		type: "POST",
		url: url,
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				location.reload(true);
			} 
		}
	};
	$("#saveForm_"+id).ajaxSubmit(opts);
	
	
//	
//	$.ajax({
//		   type: "POST",
//		   url: url,
//		   data: $("#saveForm_"+id).serialize(),
//		   success: function(data){
//			   alert(data.message);
//				if(data && data.isSuccess) {
//					location.reload(true);
//				} 
//		   },
//		   dataType: "json"
//		});
	
}

///   修改地址
$(function() {
	$(".xgdz").bind("click", function() {
//		$(this).parent().find('.realb').show();
//		$(this).parent().find('.reala').hide();
//		$(this).html('保存');
	})
	
	
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
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
	});

})

// 团购
$(function() {

	setInterval(function() {

		$(".last_mins").each(function(index, o) {
			var time = $(this).attr("data-time");

			if (time >= 0) {
				var day = parseInt(time / (60 * 60));
				var h = parseInt((time / 60) % 24);
				var m = time % 60;
				$(this).html("	剩余： " + day + "  天   " + h + "时  " + m + " 分")
				$(this).attr("data-time", time - 1);
			} else {
				return;
			}
			h

		})
	}, 1000 * 60)

})

// 注册
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

$(function() {
	// $("")

})

function registerFun(url, toUrl) {

	var mobile = $("#mobile").val();
	// if()
	save(url, toUrl);

}

// /////////===================购物车
$(function() {

	$(".down").bind("click", function() {
		var id = $(this).attr("data-id");
		var amount = $("#amount_" + id).val();
		var price = $("#price_"+id).attr("data-price");
		
		ajaxModifyAcount(id, parseInt(amount) - 1);
	});
	$(".up").bind("click", function() {
		var id = $(this).attr("data-id");
		var amount = $("#amount_" + id).val();
		ajaxModifyAcount(id, parseInt(amount) + 1);
	})

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
	// 不ajax 刷新就不拦截
//	var back = $("#amount_" + id).val();
//	if (back == amount) {
//		return;
//	}
	var url = $("#amount_" + id).attr("data-url");
	
	var price = $("#price_"+id).attr("data-price");
	$("#wholePrice_"+id).html( ( parseFloat(price) * parseInt(amount)) .toFixed(2)) ;
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
	var totalProductNum = 0;
	$(".shopItemPrice").each(function(index, element){
		shopTotalPrice += parseFloat($(this).html());
	})
	$(".J_product_num").each(function(index, element){
		totalProductNum += parseInt($(this).html());
	})
	parseFloat(shopTotalPrice).toFixed(2);
	$(".number").html(totalProductNum);
	$("#shopTotalPrice").html(parseFloat(shopTotalPrice).toFixed(2));
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
