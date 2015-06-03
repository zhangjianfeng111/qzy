<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>

			<div class="section clearfix">
				<form class="log-reg" id="saveForm" action="${request.contextPath}/cus/info/modifyPwd"  action-back="${request.contextPath}/cus/info/userCenter" >
					<div class="in-group clearfix">
						<label>原密码</label>
						<input type="password" name="oldPwd" />
						<p></p>
					</div>
					<div class="in-group clearfix">
						<label>新密码</label>
						<input type="password" id="newPwd" name="newPwd"/>
						<p></p>
					</div>
					<div class="in-group clearfix">
						<label>确认密码</label>
						<input type="password" name="pwdConfirm"/>
						<p></p>
					</div>
					<a class="btn" href="javascript:modifyPwd();">保存</a>
				</form>
			</div>
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
       
  <#include "../common/footer.ftl">
</#escape>