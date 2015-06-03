<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>

<style>
	.error{
		color:red;
	}
</style>

<div class="personal">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 个人中心 > 账户余额
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
                </ul>
            </div>
        </div>
        <div class="personal_wr">
            <p class="yu">账户余额<span>￥${cusInfo.balance}</span></p>
            <form class="form" id="saveForm">
                <div class="row">
                    <label>卡号</label><input id="giftNo" name="giftNo" type="text" placeholder="输入礼券的卡号">
                   	<span></span>
                </div>
                <div class="row">
                    <label>密码</label><input id="giftPassword" name="giftPassword" type="text" placeholder="输入刮开图层后的密码">
                    <span></span>
                </div>
                <div class="row">
                    <label></label>
                    <input type="button" value="点击领取" onclick="convert();">
                </div>
            </form>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>	
<script>
		function convert(){
			if(!$("#saveForm").valid())
				return;
			var giftNo = $("#giftNo").val();
			var giftPassword = $("#giftPassword").val();
			if(!giftNo || giftNo=="" || !giftPassword || giftPassword==""){
				return;
			}
			$.ajax({
				type: "GET",
				url: "${request.contextPath}/cus/giftlog/convert/",
				data: {no:giftNo,password:giftPassword}, 
				dataType: "json",
				success: function( data ){
					alert(data.message);
					if(data && data.isSuccess) {
						//location.reload(true);
						location.href= "${request.contextPath}/cus/info/userCenter";
					} 
				},
		        error: function() {
		            alert("网络错误，请重试！");
		        }
			});
		}
		 $(function(){
       	$("#saveForm").validate({
		/* 设置验证规则 */	 
		rules: {
			giftNo: {
				required: true
			},
			giftPassword: {
				required: true
			},
		},
		/* 设置错误信息 */	 
		messages: {
			giftNo: {
				required: '卡号不能为空'
			},
			giftPassword: {
				required: '密码不能为空'
			},
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