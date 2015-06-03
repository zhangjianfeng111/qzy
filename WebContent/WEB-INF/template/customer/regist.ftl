<#escape x as x!"">
<#include "common/header.ftl">
<div class="login">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 注册
        </div>
        <form class="login_form" id="saveForm">
            <h3>注册</h3>
            <div class="ipt_wr">
                    <span class="pic">
                        <img src="${request.contextPath}/resources/carbon/image/login_01.png" width="20" height="20" >
                    </span>
                <input type="text" name="mobile" id="mobile" class="ipt" placeholder="手机号" style="height: 40px;width: 220px;">
            </div>
            <div class="ipt_wr">
                    <span class="pic">
                        <img src="${request.contextPath}/resources/carbon/image/login_02.png" width="20" height="20" >
                    </span>
                <input type="password" name="password" id="password" class="ipt" placeholder="密码" style="height: 40px;width: 220px;">
            </div>
            <div class="ipt_wr">
                    <span class="pic">
                        <img src="${request.contextPath}/resources/carbon/image/login_02.png" width="20" height="20" >
                    </span>
                <input type="password" name="passwordAgain" id="passwordAgain" class="ipt" placeholder="再输一次" style="height: 40px;width: 220px;">
            </div>
            <div class="ipt_wr">
                    <span class="pic">
                        <img src="${request.contextPath}/resources/carbon/image/login_03.png" width="20" height="20">
                    </span>
                <input type="text" name="yzm" id="yzm" class="ipt" placeholder="验证码" style="height: 40px;width: 120px;">
                <input type="button" id="send" onclick="sendSmsCode('${request.contextPath}/cus/info/sendMessage')" value="获取">
            </div>
            <div class="btn">
                <input type="button" onclick="registerFun1('${request.contextPath}/cus/info/usersave','${request.contextPath}/index')" value="注册">
            </div>
            <div class="on_login">
                <p>
                    已有账号？立即
                    <a href="${request.contextPath}/cus/info/login.html">登录</a>
                </p>
            </div>
        </form>
        <div class="login_box">
            <img src="${request.contextPath}/resources/carbon/image/logo.png" width="257" height="82">
        </div>
        <div class="layer bubbleLayer_show" style="top: 120px;display:none" id="mobilediv">
            <div class="layer_hd"></div>
            <div class="layer_mid">
                <div class="error_tt">
                    <p id="mobileError"></p>
                </div>
            </div>
            <div class="layer_ft"></div>
            <div class="layer_arrow"></div>
        </div>

        <div class="layer bubbleLayer_show" style="top: 185px;display:none" id="passworddiv">
            <div class="layer_hd"></div>
            <div class="layer_mid">
                <div class="error_tt">
                    <p id="passwordError"></p>
                </div>
            </div>
            <div class="layer_ft"></div>
            <div class="layer_arrow"></div>
        </div>

        <div class="layer bubbleLayer_show" style="top: 250px;display:none" id = "passwordAgaindiv">
            <div class="layer_hd"></div>
            <div class="layer_mid">
                <div class="error_tt">
                    <p id="passwordAgainError"></p>
                </div>
            </div>
            <div class="layer_ft"></div>
            <div class="layer_arrow"></div>
        </div>

        <div class="layer bubbleLayer_show" style="top: 315px;display:none" id="yzmdiv">
            <div class="layer_hd"></div>
            <div class="layer_mid">
                <div class="error_tt">
                    <p id="yzmError"></p>
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
			if(element.attr("name") == "mobile"){
				document.getElementById("mobilediv").style.display="";
				$("#mobileError").html(error.html());
			}
			if(element.attr("name") == "password"){
				document.getElementById("passworddiv").style.display="";
				$("#passwordError").html(error.html());
			}
			if(element.attr("name") == "passwordAgain"){
				document.getElementById("passwordAgaindiv").style.display="";
				$("#passwordAgainError").html(error.html());
			}
			if(element.attr("name") == "yzm"){
				document.getElementById("yzmdiv").style.display="";
				$("#yzmError").html(error.html());
			}
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			if($(lable).attr("for") == "mobile"){
				document.getElementById("mobilediv").style.display="none";
			}
			if($(lable).attr("for") == "password"){
				document.getElementById("passworddiv").style.display="none";
			}
			if($(lable).attr("for") == "passwordAgain"){
				document.getElementById("passwordAgaindiv").style.display="none";
			}
			if($(lable).attr("for") == "yzm"){
				document.getElementById("yzmdiv").style.display="none";
			}
		},
		onkeyup: false
	});
});
</script>
</#escape>