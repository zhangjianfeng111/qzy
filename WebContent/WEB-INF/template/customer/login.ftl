<#escape x as x!"">
<#include "common/header.ftl">
    <div class="login">
        <div class="wrap">
            <div class="position">
                您当前的位置：首页 > 登录
            </div>
            <form class="login_form" id="saveForm">
                <h3>登录</h3>
                <div class="ipt_wr">
                    <span class="pic">
                        <img src="${request.contextPath}/resources/carbon/image/login_01.png" width="20" height="20" >
                    </span>
                    <input type="text" class="ipt" name="mobile" placeholder="手机号" style="height: 40px;width: 220px;" id="mobile">
                </div>
                <div class="ipt_wr">
                    <span class="pic">
                        <img src="${request.contextPath}/resources/carbon/image/login_02.png" width="20" height="20">
                    </span>
                    <input  name="password" type="password" placeholder="密码" style="height: 40px;width: 220px;" class="ipt" value="">
                </div>
                <div class="choice">
                    <input type="checkbox" name="">记住密码
                </div>
                <div class="btn">
                    <input type="button" onclick="javascript:login();" value="登录">
                </div>
                <div class="forget">
                    <a href="${request.contextPath}/cus/info/findPwd/">忘记密码？</a>
                </div>
                <div class="no_login">
                    <p>
                        还没有账号？立即
                        <a href="${request.contextPath}/cus/info/regist/">注册</a>
                    </p>
                </div>
            </form>
            <div class="login_box">
                <img src="${request.contextPath}/resources/carbon/image/logo.png" width="257" height="82">
            </div>
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