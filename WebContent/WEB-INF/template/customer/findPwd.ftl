<#escape x as x!"">
<#include "common/header.ftl">

<div class="login">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 找回密码
        </div>
        <form class="login_form" id="saveForm">
            <h3>找回密码</h3>
            <div class="ipt_wr">
                    <span class="pic">
                        <img src="${request.contextPath}/resources/carbon/image/login_01.png" width="20" height="20" >
                    </span>
                <input type="text" class="ipt"  name="mobile" id="mobile" placeholder="请输入手机号">
                <label style="margin-top: 5px; padding-left: 120px; text-align: left;"><span id="timeShow"></span></label>
            </div>
            <div class="btn">
                <input type="button" value="找回密码" onclick="sendSmsCode('${request.contextPath}/cus/info/snapPwd')">
                
            </div>
        </form>
        <div class="login_box">
            <img src="${request.contextPath}/resources/carbon/image/logo.png" width="257" height="82">
        </div>
        <div class="layer bubbleLayer_show" style="top: 120px;display:none;color:red" id="showdiv"> 
            <div class="layer_hd"></div>
            <div class="layer_mid">
                <div class="error_tt">
                    <p id="mobileError"></p>
                </div>
            </div>
            <div class="layer_ft"></div>
            <div class="layer_arrow"></div>
        </div>
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
		"请正确填写手机号码!"
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
			document.getElementById("showdiv").style.display="";
			errorPlace.html(error.html());
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
	/*		lable.remove(); */
	document.getElementById("showdiv").style.display="none";
		},
		onkeyup: false
	});
});
</script>
</#escape>

