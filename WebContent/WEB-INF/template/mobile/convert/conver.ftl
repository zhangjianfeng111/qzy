
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
	<script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
<title>充值卡</title>

</head>
<body>
<div id="a-wrap">
    <section id="section" class="section">
        <aside></aside>
        <header id="header" class="header gb">
            <h2>充值卡</h2>
            <nav style="" class="more_nav">
                <a class="iback left" href="javascript:history.go(-1);"></a>
            </nav>
            <!--
            <nav>
                <a class="left text" href="javascript:history.go(-1);">取消</a>
                <a class="right text" href="http://m.fruitday.com:80/user/toRegist">注册</a>
            </nav>
            -->
        </header>
        <article id="article" class="article">
            <div class="loginWeb">
                <form id="saveForm" method="post">
	                <div class="form-list-a ma">
	                    <ul>
	                        <li class="fl-item"><b class="name"><input type="text" id="giftNo" name="giftNo" placeholder="输入礼券的卡号" /><p></p></b></li>
	                        <li class="fl-item"><b class="name"><input type="text" id="giftPassword" name="giftPassword"  placeholder="输入刮开图层后的密码" /><p></p></b></li>
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
                        <a id="btnLogin" href="javascript:convert();" class="a-iteam b-orgn"><span>提交</span></a>
                    </div>
                </div>  
            </div>
            
        </footer>
    </section>
</div>
</body>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>
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
						location.href= "${request.contextPath}/mobile/cus/userCenter.html";
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
                    required: true,
                }
            },
            /* 设置错误信息 */
            messages: {
                giftNo: {
                    required: '请输入卡号'
                },
                giftPassword: {
                    required: '请输入密码',
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

</html>