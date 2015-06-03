<#escape x as x!"">
<#include "common/header.ftl">
<div class="section clearfix">
	<form id="saveForm" class="log-reg">
		<div class="in-group clearfix">
			<label>手机号</label>
			<input name="mobile" id="mobile" type="text" value="" />
			<p id="mobileError"></p>
		</div>
		<div class="in-group clearfix">
			<label>密码</label>
			<input name="password" type="password" value="" />
			<p></p>
		</div>
		<a href="javascript:login();" class="btn">登录</a>
	</form>
	<div class="right-side">
		<p>还没有账号，现在 <a href="${request.contextPath}/cus/info/regist/">注册</a></p>
			<!-- 
				<p><a href="javascript:sendSmsCode('${request.contextPath}/cus/info/snapPwd')">忘记密码？</a><span id="timeShow"></span></p>
			-->
		<p><a href="${request.contextPath}/cus/info/findPwd">忘记密码？</a><span id="timeShow"></span></p>
	</div>
</div>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>

<script>
function login() {
	if(!$("#saveForm").valid())
		return;
	var opts = {
		type: "POST",
		url: "${request.contextPath}/cus/info/loginin",
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				if( !!  data.result ){
					location.href=data.result;
				}else {
				location.href="${request.contextPath}/index.html";
				}
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
<#include "common/footer.ftl">
</#escape>