<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
    <title>个人中心</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="format-detection" content="telephone=no"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<meta http-equiv="Cache-Control" content="no-transform "/>
<meta name="keywords" content=" ">
<meta name="description" content="">  
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/mobile/css/style.css">
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/js.js"></script>
</head>

<body>
<div id="a-wrap" style="overflow:hidden">
    <section id="section" class="section" >
        <header id="header" class="header gb">
            <h2>个人中心</h2>
            <nav>
                <a class="iback left" href="javascript:history.go(-1);"></a>
            </nav>
        </header>
        <article id="article" class="article">
            <div class="orderSub">
                <div class="form-list-a">
                    <ul>
                    	<li class="tit"><h4>账户</h4></li>
                        <li class="fl-item"><b class="name">余额</b><span class="detail ot">￥${(cusInfo.balance)!0}</span></li>
                    	<li class="fl-item more foucs"><a href="${request.contextPath}/mobile/giftlog/load">充值卡兑换</a></li>
                    </ul>
                   
                    <ul>
                        <li class="tit"><h4>收货地址</h4></li>
                        <li class="fl-item more foucs"><a href="${request.contextPath}/mobile/cus/address/list?from=userCenter">修改</a></li>
                    </ul>
                    <ul>
                        <li class="tit"><h4>密码</h4></li>
                        <li class="fl-item more foucs"><a href="${request.contextPath}/mobile/cus/modifyPwd/input">修改</a></li>
                    </ul>
                </div>
            </div>
        </article>
<#include "../footer.ftl">


<script>
function is_weixin(){
var ua = navigator.userAgent.toLowerCase();
if(ua.match(/MicroMessenger/i)=="micromessenger") {
return true;
} else {
return false;
}
}

function  payMoney(price ){
	
	if(is_weixin()){
		location.href = "${request.contextPath}/weixin/paygift?giftPrice="+price;
	}else {
		location.href = "${request.contextPath}/mobile/alipaygift?giftPrice="+price;
	}
}

$(function(){
	
	if(is_weixin() ){
		$("#orderFrom").val("weixing");
	}else {
		$("#orderFrom").val("alipay");
	}

})

</script>

</#escape>
