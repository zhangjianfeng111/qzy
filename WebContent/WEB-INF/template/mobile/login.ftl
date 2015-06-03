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

<!--[if !IE]> -->
    <script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->
<script type="text/javascript">
			var YS = YS || {data:{},util:{}};
			YS.config = {path:{rootPath:"${request.contextPath}"}}
		</script>
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/js.js"></script>
<style>
.error{
	color:red;
}
</style>
<title>家具清洁网</title>
</head>
<body>
<div id="a-wrap">
    <section id="section" class="section">
        <aside></aside>
        <header id="header" class="header gb">
            <h2>登录账户</h2>
            <nav>
                <a class="left text" href="javascript:history.go(-1);">取消</a>
                <a class="right text" href="${request.contextPath}/mobile/cus/regist/">注册</a>
            </nav>
        </header>
        <article id="article" class="article">
            <div class="loginWeb">
                <form id="saveForm" method="post">
	                <div class="form-list-a ma">
	                    <ul>
	                        <li class="fl-item"><b class="name"><input type="text" id="mobile" value=""  name="mobile" placeholder="手机号" /><p id="mobileError"></p></b></li>
	                        <li class="fl-item"><b class="name"><input type="password" id="password" value="" name="password" placeholder="密码" /><p></p></b></li>
	                    </ul>
	                </div>
                </form>
            </div>
        </article>
        <footer class="footer">
            <div class="form-sub-a">
                <div class="action">
                    <div class="act-iner m">
                        <!-- <span class="a-iteam" style="text-align:left;padding-left:10px;"><a href="#" class="link-txt ot">忘记密码?</a></span> -->
                        <a id="btnLogin" href="javascript:login();" class="a-iteam b-orgn"><span>登录</span></a>
                        
                    </div>
                    
                      <div class="act-iner m">
                         <a  href="${request.contextPath}/mobile/cus/findPwd" class=""> <span style="color:#F99B00;">找回密码</span></a>
                    </div>
                </div>  
            </div>
            
        </footer>
    </section>
</div>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>

<script>
function login() {
	if(!$("#saveForm").valid())
		return;
	var opts = {
		type: "POST",
		url: "${request.contextPath}/mobile/cus/loginin",
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				if( !!  data.result ){
					location.href=data.result;
				}else {
					location.href="${request.contextPath}/mobile/index.html";
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
			errorPlace.html(error.html()).addClass("error");
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			lable.remove();
		},
		onkeyup: false
	});
});
</script>
</body>
</html>
</#escape>