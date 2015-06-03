<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
<title>我的订单</title>
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
</head>
<body>
<div id="a-wrap">
    <section  class="section tabBox" id="leftTabBox">
     <header id="header" class="header gb">
        <h2>我的订单</h2>
        <nav>
            <a class="iback left" href="javascript:history.back();"></a>
        </nav>
        <div class="sort hd" id="sort_hd_div">
            <ul>
                 <li onclick="location.href='${request.contextPath}/mobile/order/list/p1/?payStatus=no_pay'" class="item-cont <#if !bean.payStatus?has_content || bean.payStatus=="no_pay">on</#if>">未付款</li>
                 <li onclick="location.href='${request.contextPath}/mobile/order/list/p1/?payStatus=pay_ok'" class="item-cont <#if bean.payStatus?has_content && bean.payStatus=="pay_ok">on</#if>">已付款</li>
            </ul>
        </div>
     </header>
     <article id="article" class="article">
         <div class="myOrderlist od-mode">
             <div class="pbox-list-a pic-120 bd" >
                <ul id="unDone" class="con">
                <#if infos?has_content>
                <#list infos as info>
					<li class="list-item">
					<a href="${request.contextPath}/mobile/order/view/${info.orderId}">
					<div class="p-pic">
					<img src="${request.contextPath}/resources/admin/store/${(info.productImage)!''}" alt="">
					</div>
					<div class="d-con">
					<h3 class="d-tit clamp-2">编号:${info.orderCode}</h3>
					<p class="d-spe"><#if info.orderTime?has_content>${info.orderTime?string("yyyy-MM-dd HH:mm:ss")}</#if></p>
					<div class="db-con">
					<h1 class="d-price ot">￥${info.totalFee}</h1> 
					<span>
					<#if ((info.orderStatus)!'')=='un_audit'>
					未审核
					<#elseif  ((info.orderStatus)!'')=='pass'>
					已审核
					<#elseif  ((info.orderStatus)!'')=='wait_ship'>
					待发货
					<#elseif  ((info.orderStatus)!'')=='ship'>
					已发货
					<#elseif  ((info.orderStatus)!'')=='refund'>
					退货
					<#elseif  ((info.orderStatus)!'')=='canceled'>
					交易取消
					<#elseif  ((info.orderStatus)!'')=='canceled'>
					完结
					</#if>
					</span></div></div></a></li>
					</#list>
					</#if>
					<li class="list-item load" value="3"><h3 style="display: block;width: 100%;text-align: center;">没有更多显示内容</h3></li>
                </ul>
             </div>
         </div>
     </article>
	<#include "../footer.ftl">
</#escape>	