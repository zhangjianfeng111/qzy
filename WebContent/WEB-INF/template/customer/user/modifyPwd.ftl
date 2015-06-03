<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<style>
	.error{
		color:red;
	}
</style>

			<div class="section clearfix">
			</div>
			<div class="personal">
        <div class="wrap">
            <div class="position">
                您当前的位置：首页 > 个人中心 > 修改密码
            </div>
            <div class="personal_list">
                <div class="icon">
                <img src="${request.contextPath}/resources/carbon/image/logo_02.png" width="184" height="58">
            </div>
            <div class="account_manage">
                账号管理
            </div>
            <div class="manage_list">
                <ul>
                    <li>
                        <a href="${request.contextPath}/cus/order/list/p1.html">我的订单</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/userCenter">账户余额</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/addressList">收货地址管理</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/modifyPwd/input">账户安全</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/redpacket/list/p1?cusId=${Session["user"].id}">我的红包</a>
                    </li>
                </ul>
            </div>
            </div>
            <div class="personal_wr">
                <div class="tit">
                    安全绑定
                </div>
                <p>绑定手机：</p> 
                <div class="tit">
                    修改密码
                </div>
                <form class="change_form" id="saveForm" action="${request.contextPath}/cus/info/modifyPwd"  action-back="${request.contextPath}/cus/info/userCenter" >
                    <div class="ipt_pa">
						<label><span style="color:red;">*</span>原密码：&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="password" name="oldPwd" />
						<span></span>
					</div>
					<div class="ipt_pa">
						<label><span style="color:red;">*</span>新密码：&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="password" id="newPwd" name="newPwd"/>
						<span></span>
					</div>
					<div class="ipt_pa">
						<label><span style="color:red;">*</span>确认密码：</label>
						<input type="password" name="pwdConfirm"/>
						<span></span>
					</div>
                    <div class="ipt_pa">
                        <p>&nbsp;</p>
                        <input type="button" value="确认修改" onclick="modifyPwd();">
                    </div>
                </form>
            </div>
            <div class="clear"></div>
        </div>
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
			var errorPlace = element.nextAll("span").first();
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