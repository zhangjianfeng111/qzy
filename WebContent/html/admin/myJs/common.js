//TODO  正式注释
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


function log(msg){
//	console.log(msg);
}

function checkTime(startTime,endTime){   
    var start=new Date(startTime.replace("-", "/").replace("-", "/"));   
    var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
    if(end<start){
    	alert("结束时间必须大于开始时间！");
        return false;  
    }  
    return true;  
} 

function save(url, toUrl){
	saveForm("saveForm",url, toUrl);
}


function checkNum(sort){
	  var reg = new RegExp("^[0-9]*$");
	 return reg.test(sort);
}

function saveCheck(key, url, toUrl){
	if(uf.validate()){
		saveForm(key,url,toUrl);
	}
}

//表单保存
$("#save").click(function(){
//	if($('#saveForm').valid()){
		$.ajax({
 		   type: "POST",
 		   url: $('#saveForm').attr('action'),
 		   data: $('#saveForm').serialize(),
 		   success: function(data){
 		     if(data){
 		    	 bootbox.alert("保存成功");
 		    	setTimeout(function(){
 		    	 if ($("#save").attr("urlkey")) {
 		    		doBack($("#save").attr("urlkey"));
 		    	 } else {
 		    		location.href = $('#saveForm').attr('action').replace("save/","list/p1/");
 		    	 }
 		    	 },3);
 		     }else{
 		    	bootbox.alert("保存失败");
 		     }
 		   },
 		   dataType: "json"
 		});
//	}
	
});

function saveForm(key,url, toUrl){
	var queryString = $("#"+key).serialize();
	
	$.ajax({
		type: "POST",
		'url': url,
		data: queryString, 
		dataType: "json",
		success: function( data ){
//			if(data.message !== null && data.message !=""){
//			alert(data.message);
//		}
			if(data.isSuccess == true){
				alert("操作成功！");
				if(!!data.result){
					location.href=data.result;
				}else if(toUrl){
					if("do_refesh"==toUrl || 'refresh'==toUrl){
						location.href=location.href;
					}else if("ajax" ==toUrl){
						
					}else {
						location.href=toUrl;
					}
				}
			}else {
//				alert(data.message);
			}
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}
$(function(){
	var ids="";
	$(".removeall").click(function(){
		var delurl = $(".removeall").attr("data-url");
		$("input[name='ids']:checkbox:checked").each(function(){
			ids+=$(this).val()+","
		});
		if(ids==""){
			alert("至少勾选一个用户！");
			return false;
		}
		window.location.href = delurl+"?ids="+ids;
		});
});

$(function(){	
	
    $(".toUrl").bind("click",function(){
      var toUrl = $(this).attr("data-toUrl");
      window.location.href = toUrl;
    });
 });

function selectAll(){
	if($("#all").attr("checked")){
		$("table input[type=checkbox]").attr("checked",true);
	}else {
		$("table input[type=checkbox]").attr("checked",false);
	}
}

$(function(){
	$("#doCheck input").bind("click",function(){
		if($(this).attr("checked")){
			$("#doCheck input").attr("checked",false);
			$(this).attr("checked",true);
		}
	});
});

function changeImg(t){
	$(t).attr("src",$(t).attr("src")+new Date());
}

/**
 * form id ="saveForm"
 * @param checkUrl
 * @param url
 * @param toUrl
 */
function yzmSave(checkUrl, url, toUrl){
	var yzm = $("#yzm").val();
	$.ajax({
		type: "POST",
		url: checkUrl,
		data: {"yzm":yzm}, 
		dataType: "json",
		success: function( data ){
//			alert(data.message);
			if(data== true){
				save(url, toUrl);
			}else{
				alert("Verification code error");
			}
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}

function deleteOne(id, url){
	var language = $("#language").val();
	if(confirm("确定删除？")){
		if(language){
			$.ajax({
				type: "GET",
				url: url,
				data: {id : id, language : language}, 
				dataType: "json",
				success: function( data ){
					if(data){
						alert("删除成功！");
						window.location.reload();
					}else{
						alert("删除失败！");
					}
				},
		        error: function() {
		            alert("网络错误，请重试！");
		        }
			});
		}else{
			$.ajax({
				type: "GET",
				url: url,
				data: {id : id}, 
				dataType: "json",
				success: function( data ){
					if(data){
						alert("删除成功！");
						window.location.reload();
					}else{
						alert("删除失败！");
					}
				},
		        error: function() {
		            alert("网络错误，请重试！");
		        }
			});
		}
	}
}



var REGION_AJAX_URL ;
var WEB_ROOT;
$(function(){
	if(!!YS){
		REGION_AJAX_URL = YS.config.path.rootPath+"/common/findregionByParentId";
		WEB_ROOT = YS.config.path.rootPath;
	}
});


$(document).ready(function(){
	$("#state").change(function(){
		var countryId = $("#state").val();
		try{
			$("#countryMobileNo").html(countryMobileMap.get(countryId));
			$("#countryMobileNoInput").val(countryMobileMap.get(countryId));
		}catch(e){}
		$.ajax({
			type: "GET",
			url: REGION_AJAX_URL,
			data: {parentId : countryId}, 
			dataType: "json",
			success: function( data ){
				var html = "<option></option>";
				for(var i=0; i<data.length;i++){
					html = html + "<option value="+data[i].regionName+">"+data[i].regionName+"</option>"
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
					html = html + "<option value="+data[i].regionName+">"+data[i].regionName+"</option>"
				}
				$("#district").html(html);
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
	});
});



$(function(){
	
	$(".upDown").bind("click",function(){
		var  topObject = $(this);
		var  url = $(this).attr("data-url");
		var  status = $(this).attr("data-status");
		var  id = $(this).attr("data-id");
		if(!status){
			status = "0";
		}
		var  doStatus = status==1? 0:1;  
		
		$.ajax({
			type: "post",
			"url": url,
			data: {"sellStatus" : doStatus}, 
			dataType: "json",
			success: function( data ){
//				alert(data.message);
				if(data.isSuccess){
					if(doStatus =="1"){
						$("#do_upDown_"+id).attr("data-status","1");
						$("#upDown_"+id).html("上架");
						$("#do_upDown_"+id).html("下架");
					}else {
						$("#upDown_"+id).html("下架");
						$("#do_upDown_"+id).html("上架");
						$("#do_upDown_"+id).attr("data-status","0");
					}
				}
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
	});
	
	
});



$(function(){
	
	$(".top").bind("click",function(){
		var  topObject = $(this);
		var  url = $(this).attr("data-url");
		var  status = $(this).attr("data-status");
		var  id = $(this).attr("data-id");
		if(!status){
			status = "0";
		}
		var  doStatus = status==1? 0:1;  
		
		$.ajax({
			type: "post",
			"url": url,
			data: {"status" : doStatus}, 
			dataType: "json",
			success: function( data ){
//				alert(data.message);
				if(data.isSuccess){
					if(doStatus =="1"){
						$("#top_"+id).html("置顶");
						$("#do_top_"+id).html("取消");
						$("#do_top_"+id).attr("data-status","1");
					}else {
						$("#top_"+id).html("普通");
						$("#do_top_"+id).html("置顶");
						$("#do_top_"+id).attr("data-status","0");
					}
				}
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
	});
	
	
});





function Map(){
this.container = new Object();
}


Map.prototype.put = function(key, value){
this.container[key] = value;
}


Map.prototype.get = function(key){
return this.container[key];
}


Map.prototype.keySet = function() {
var keyset = new Array();
var count = 0;
for (var key in this.container) {
//跳过object的extend函数
if (key == 'extend') {
continue;
}
keyset[count] = key;
count++;
}
return keyset;
}


Map.prototype.size = function() {
var count = 0;
for (var key in this.container) {
//跳过object的extend函数
if (key == 'extend'){
continue;
}
count++;
}
return count;
}


Map.prototype.remove = function(key) {
delete this.container[key];
}


Map.prototype.toString = function(){
var str = "";
for (var i = 0, keys = this.keySet(), len = keys.length; i < len; i++) {
str = str + keys[i] + "=" + this.container[keys[i]] + ";\n";
}
return str;
} 

var countryMobileMap = new Map();
countryMobileMap.put("1","0044");//英国
countryMobileMap.put("62","00351");//葡萄牙
countryMobileMap.put("104","0034");//西班牙
countryMobileMap.put("178","0030");//希腊
countryMobileMap.put("134","0039"); //意大利


(function($,undefined){
    //操作：全选
    $(".J_SelectAll").on("change", function(){
      if ($(this).prop("checked")) {
        $(".J_SelectSub").prop("checked", true);
      } else {
        $(".J_SelectSub").prop("checked", false);
      }
    });
    //操作：删除
    $(".J_Table").on("click", ".J_DeleteTr", function() {
      var _this = $(this);
      var url = _this.attr("data-value");
      bootbox.confirm("确认删除", function(result) {
       if(result) {
       	$.ajax({
			type: "GET",
			url: url,
			dataType: "json",
			success: function( data ){
				if(data){
					alert("删除成功！");
					_this.parent().parent().parent().remove();
				}else{
					alert("删除失败！");
				}
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
       }
      });
    });
    
    $(".J_Table").on("click", ".J_UpdateTr", function() {
        var _this = $(this);
        var url = _this.attr("data-value");
        bootbox.confirm("确认为回复成功？", function(result) {
         if(result) {
         	$.ajax({
  			type: "GET",
  			url: url,
  			dataType: "json",
  			success: function( data ){
  				if(data){
  					alert("回复成功！");
  					window.location.reload();
  				}else{
  					alert("回复失败！");
  				}
  			},
  	        error: function() {
  	            alert("网络错误，请重试！");
  	        }
  		});
         }
        });
      });
    
    $(".J_Table").on("click", ".status", function() {
        var _this = $(this);
        var url = _this.attr("data-value");
        bootbox.confirm("确认修改？", function(result) {
         if(result) {
         	$.ajax({
  			type: "GET",
  			url: url,
  			dataType: "json",
  			success: function( data ){
  				if(data){
  					alert("操作成功！");
  					window.location.reload();
  				}else{
  					alert("操作失败！");
  				}
  			},
  	        error: function() {
  	            alert("网络错误，请重试！");
  	        }
  		});
         }
        });
      });
  })(jQuery);
/**
 * iframe弹出
 * @param t
 */
function customIframe(t) {
	var _aObject,clickFlag = false;
	if (t.is("button")) {
		_aObject =  t.next();
	} else if (t.is("a")) {
		_aObject = t;
		clickFlag = true;
	} else {
		_aObject = t.parent().find("a");
	}
	if(!_aObject.attr("data-flag") || (_aObject.attr("data-flag") && _aObject.attr("data-flag")!=0)){
		var _title = _aObject.data("title");
		 if (!_title) {
			_title = t.data("title");
		 }
		 var _id = _aObject.attr('href');
		 var _src = _aObject.attr('data-src');
		 $(_id+' .modal-body').find("iframe").remove();
		 $(_id+' .modal-footer').hide();
		 $('<iframe src="'+_src+'" border="0" width=100% height="100%">').appendTo($(_id+' .modal-body'));
		 $(_id+' .table-header i').html(_title);
		 if (clickFlag == false) _aObject.click();
	}
}
//iframe
$(document).on("focus", ".J_InputSelect", function (){
	customIframe($(this));
});

$(document).on("click", ".J_LinkIFrame", function (){
	customIframe($(this));
 });

$(".J_InputSelect").next().click(function(){
	if (!$(this).is("a")) {
		customIframe($(this).prev());
	}
});
