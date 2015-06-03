<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="apple-touch-fullscreen" />
<meta name="format-detection" content="telephone=no" />
<meta content="telephone=no" name="format-detection" />
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport"
content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<meta http-equiv="Cache-Control" content="no-transform " />
<meta name="keywords" content=" ">
<meta name="description" content="">
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/mobile/css/style.css?v=20141229">
<script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
<title>家具清洁网</title>
</head>
<div id="a-wrap">
    <section id="section" class="section">
        <header id="header" class="header gb">
            <h2>注册账户</h2>
            <nav>
                <a class="left text" href="javascript:history.go(-1);">取消</a>
            </nav>
        </header>
        <article id="article" class="article">
            <div class="loginWeb">
            	<form id="saveForm">
                <div class="form-list-a ma">
                    <ul>
                        <li class="fl-item"><b class="name"><input name="mobile" id="mobile" type="text" value="" placeholder="请输入手机号码"/><p></p></b></li>
                        <li class="fl-item"><b class="name"><input name="password" id="password" type="password" placeholder="请输入密码"/><p></p></b></li>
                        <li class="fl-item"><b class="name"><input name="yzm" id="yzm" type="text" placeholder="请输入验证码"/><p></p></b></li>
                    </ul>
                </div>
                </form>
            </div>
        </article>
        <footer class="footer">
            <div class="form-sub-a">
                <div class="action">
                    <div class="act-iner m">
                        <a href="javascript:void(0)" onclick="sendSmsCode('${request.contextPath}/mobile/cus/sendMessage')" id="codeTipA" class="a-iteam b-green"><span id="timeShow">获取验证码(180)</span></a>
                        <a href="javascript:void(0);" onclick="registerFun1('${request.contextPath}/mobile/cus/usersave','${request.contextPath}/mobile/index')" id="codeTipB" class="a-iteam b-orgn ml"><span id="btnLogin">注册</span></a>
                    </div>
                </div>  
            </div>
        </footer>
    </section>
</div>
<input type="hidden" name="connect_id" id="connect_id"/>

<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>
<script>
function registerFun1(url, toUrl) {
	if(!$("#saveForm").valid())
		return;
	var opts = {
		type: "POST",
		url: url,
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				location.href=toUrl;
			} 
		}
	};
	$("#saveForm").ajaxSubmit(opts);
}

$(function(){
	// 手机号码验证
	$.validator.addMethod(
		"isMobileRule",
		function(value, element) {
			var length = value.length;
			return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));
		},
		"请正确填写正确的手机号码"
	);	 
	
	$("#saveForm").validate({
		/* 设置验证规则 */	 
		rules: {
			password: {
				required: true
			},
			mobile: {
				required: true,
				isMobileRule: true
			},
			yzm: {
				required: true
			}
		},
		/* 设置错误信息 */	 
		messages: {
			password: {
				required: '请输入密码'
			},
			mobile: {
				required: '请输入手机号码',
				isMobileRule: '请输入正确的手机号码'
			},
			yzm: {
				required: '请输入手机验证码'
			}
		},
		/* 错误信息的显示位置 */	 
		errorPlacement: function(error, element) {
			var errorPlace = element.nextAll("p").first();
			errorPlace.html(error.html());
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			lable.remove();
		},
		onkeyup: false
	});
});

function sendSmsCode(url) {
	var mobile = $("#mobile").val();
	if (!checkMobile(mobile)) {
		alert("请正确填写手机号码");
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

function checkMobile(mobile) {
	if (mobile.length == 11
			&& /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/
					.test(mobile)) {
		return true;
	} else {
		return false;
	}
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
</script>
</body>
</html>
</#escape>