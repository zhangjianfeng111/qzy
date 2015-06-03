(function() {
    var noop = function noop() {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = window.console || {};

    while (length--) {
        // Only stub undefined methods.
        console[methods[length]] = console[methods[length]] || noop;
    }
}());
var REGION_AJAX_URL ;
var WEB_ROOT;
$(function(){
	if(!!YS){
		REGION_AJAX_URL = YS.config.path.rootPath+"/findregions/";
		WEB_ROOT = YS.config.path.rootPath;
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
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
	});
});
function save(url, toUrl) {
// var queryString = $("#saveForm").serialize();
	saveForm("saveForm",url,toUrl);
}

function  saveForm(key,url, toUrl) {
	var queryString = $("#"+key).serialize();
	$.ajax({
		type : "POST",
		url : url,
		data : queryString,
		dataType : "json",
		success : function(data) {
			if (data.isSuccess) {
				alert("保存成功！");
				if(toUrl){
					if("do_refesh"==toUrl || 'refresh'==toUrl){
						location.href=location.href;
					}else if("ajax" ==toUrl){
						
					}else {
						location.href=toUrl;
					}
				}
			} else {
				alert(data.message);
			}
		},
		error : function() {
			alert("网络错误，请重试！");
		}
	});
}

function deleteOne(id, url) {
	if (confirm("确定删除？")) {
		$.ajax({
			type : "GET",
			url : url,
			data : {
				id : id
			},
			dataType : "json",
			success : function(data) {
				if (data) {
					alert("删除成功！");
					window.location.reload();
				} else {
					alert("删除失败！");
				}
			},
			error : function() {
				alert("网络错误，请重试！");
			}
		});
	}
}

function search() {
	$("#searchForm").submit();
}

function go() {
	var localUrl = location.href;
	var urls = localUrl.split("?");
	var oldQuery = urls[1] ? urls[1].split("&") : [];
	var baseUrl = urls[0];
	var queries = [];

	var sort = $("#sort").val();
	var startPrice = $("#startPrice").val();
	var endPrice = $("#endPrice").val();
	var customerStatus = $("#customerStatus").prop("checked");
	var isNew = $("#isNew").prop("checked");
	var cateIds = $("#cateIds").val();

	if (startPrice != "" && isNaN(startPrice)) {
		alert("请输入正确的价格格式!");
	} else {
		if (startPrice != "") {
			queries.push("startPrice=" + startPrice);
		}

	}

	if (endPrice != "" && isNaN(endPrice)) {
		alert("请输入正确的价格格式!");
	} else {
		if (endPrice != "") {
			queries.push("endPrice=" + endPrice);
		}

	}

	cateIds
	queries.push("queries=" + queries);
	queries.push("sort=" + sort);
	if (customerStatus) {
		queries.push("customerStatus=" + 1);
	}
	if (isNew) {
		queries.push("isNew=" + 1);
	}

	var q = uniqueQuery(oldQuery, queries);
	baseUrl += q.length > 0 ? '?' + q.join("&") : '';

	location.href = baseUrl;
}

function searchProduct(o) {
	location.href = $(o).attr("data-url") + $("#searchProductName").val();
	;

}

function uniqueQuery(base, update) {

	var hash = {}, arr = [];
	for (var i = 0; i < base.length; i++) {
		var key = base[i].split("=")[0];
		var value = base[i].split("=")[1];
		hash[key] = value;
	}
	for (var j = 0; j < update.length; j++) {
		var newKey = update[j].split("=")[0];
		var newValue = update[j].split("=")[1];
		hash[newKey] = newValue;
	}
	for (key in hash) {
		if (hash[key] != '') {
			arr.push(key + '=' + hash[key]);
		}
	}
	return arr;
};

function addCookAndShow(productId, url) {
	addCookProduct(productId);
	var productIds = $.cookieHelper('productIds') || [];

	$.ajax({
		type : "POST",
		url : url,
		data : {
			"productIds" : productIds
		},
		dataType : "html",
		success : function(data) {
			$("#historyDiv").html(data);
		},
		error : function() {
			alert("网络错误，请重试！");
		}
	});

}

function newestShow(url) {
	var productIds = $.cookieHelper('productIds') || [];

	$.ajax({
		type : "POST",
		url : url,
		data : {
			"productIds" : productIds
		},
		dataType : "html",
		success : function(data) {
			$("#historyDiv").html(data);
		},
	});

}


function addCookProduct(productId) {
	var productIds = $.cookieHelper('productIds') ;
	if( !! productIds ){
		productIds =productIds.split(",");
	}else {
		productIds =[];
	}
	
	for ( var index in productIds) {
		if (productIds[index] == productId) {
			return;
		}
	}

	if (productIds.size >= 4) {
		productIds.pop();
	}

	productIds.unshift(productId);
	$.cookieHelper('productIds',null);
	$.cookieHelper('productIds', productIds.join(","),{expires: 7, path: '/'});
}


function ajaxPage(showId, url){
	$.ajax({
		type: "GET",
		"url": url,
// data: {parentId : state},
		dataType: "html",
		success: function( data ){
			$("#"+showId).html(data);
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}


