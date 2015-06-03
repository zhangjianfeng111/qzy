<#escape x as x!"">
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" href="${request.contextPath}/resources/front/css/styles.css" type="text/css">
		
<!--[if !IE]> -->
    <script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->
	</head>
	<body class="dh">
		<div class="dh-banner"><a href="${request.contextPath}/" style="color:#fff;line-height:52px;padding-left:50px;">首页</a></div>
		<div class="dh-wrap">
			<img src="${request.contextPath}/resources/front/img/logo.png" height="71" width="147" class="logo">
			<p class="title">礼品券兑换</p>
			<div class="formdiv">
				<div>
					<label>卡号</label><input id="giftNo" name="giftNo" type="text" placeholder="输入礼券的卡号">
				</div>
				<div>
					<label>密码</label><input id="giftPassword" name="giftPassword" type="text" placeholder="输入刮开图层后的密码">
				</div>
				<div>
					<label></label><a href="javascript:convert();" class="confirm-btn">确定</a>
				</div>
				<div>
				<!--
					<label></label><a href="#" class="link">查看兑换方式</a>
					-->
				</div>
			</div>
		</div>
		<div class="dh-banner">
			<p>400-111-2222</p>
		</div>
		<script>
		function convert(){
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
		</script>
	</body>
</html>
</#escape>	