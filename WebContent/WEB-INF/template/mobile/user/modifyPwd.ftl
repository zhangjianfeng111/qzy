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
<style>
.error {
	color:red;
}
</style>

<title>修改密码</title>

</head>
<body>
<div id="a-wrap">
    <section id="section" class="section">
        <aside></aside>
        <header id="header" class="header gb">
            <h2>修改密码</h2>
            <nav>
                <a class="left text" href="javascript:history.go(-1);">取消</a>
                <!--
                <a class="right text" href="http://m.fruitday.com:80/user/toRegist">注册</a>
                -->
            </nav>
        </header>
        <article id="article" class="article">
            <div class="loginWeb">
                <form  method="post" id="saveForm" action="${request.contextPath}/mobile/cus/modifyPwd"  action-back="${request.contextPath}/mobile/cus/userCenter" >
	                <div class="form-list-a ma">
	                    <ul>
	                        <li class="fl-item"><b class="name"><input type="text" id="username" name="oldPwd" placeholder="原密码" /><p class="error" ></p>  </b></li>
	                        <li class="fl-item"><b class="name"><input type="password" id="newPwd" name="newPwd" placeholder="新密码" /> <p class="error"></p> </b></li>
                            <li class="fl-item"><b class="name"><input type="password" id="pwdConfirm" name="pwdConfirm" placeholder="再输一次" /> <p class="error"></p> </b></li>
                             <li class="fl-item"><b class="name">  <button type="button" onclick="modifyPwd()">  修改 </button> </b></li>
	                    </ul>
	                </div>
                </form>
            </div>
        </article>
        <script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
        
		<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>
       <script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
        <script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/message.js"></script>
       <script>
       
       function modifyPwd() {
	if(!$("#saveForm").valid())
		return;
		var  url = $("#save").attr("action");;
		var toUrl = $("#saveForm").attr("action-back");
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
       	$("#saveForm").validate({
		/* 设置验证规则 */	 
		rules: {
			oldPwd: {
				required: true
			},
			newPwd: {
				required: true
			},
			pwdConfirm:{
				required: true,
				equalTo: '#newPwd'
			}
			
		},
		/* 设置错误信息 */	 
		messages: {
			
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
       
       })
       </script>
       
<#include "../footer.ftl">
</#escape>