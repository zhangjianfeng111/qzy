<#escape x as x!"">
<#include "common/header.ftl">
<div class="section clearfix">
	<form class="log-reg" id="saveForm">
		<div class="in-group clearfix">
			<label>手机号</label>
			<input name="mobile" id="mobile" type="text" value=""/>
			<p id="mobileError"></p>
		</div>
		<div class="in-group clearfix">
			<a style="padding-left:0;" class="btn" href="javascript:void(0);" onclick="sendSmsCode('${request.contextPath}/cus/info/snapPwd')">找回密码</a>
			<label style="margin-top: 5px; padding-left: 120px; text-align: left;"><span id="timeShow"></span></label>
		</div>
		
		
		
	</form>
	<div class="right-side">
		<p>已有账号，现在 <a href="${request.contextPath}/cus/info/login/">登录</a></p>
	</div>
</div>
<#include "common/footer.ftl">
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
			passwordAgain:{
				required: true,
				equalTo:"#password"
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
			passwordAgain:{
				required: '请输入密码',
				equalTo: '密码不一致'
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
</script>
</#escape>