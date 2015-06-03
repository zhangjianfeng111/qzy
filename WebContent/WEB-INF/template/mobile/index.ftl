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

<title>家具清洁网</title>

</head>
</body>
<div id="a-wrap">
    <section id="section" class="section">

        <header id="header" class="header gb">

        <div class="headermain">
         <h2>家具清洁网</h2>
            <nav>
                <#if user?has_content>
	               	<a class="right text" href="${request.contextPath}/mobile/cus/userCenter.html" style="font-size: 0.9em;text-shadow: 0 0 2px #000;">个人中心</a>
	            <#else>
	                <a class="right text" href="${request.contextPath}/mobile/cus/login.html" style="font-size: 0.9em;text-shadow: 0 0 2px #000;">登录</a>
	            </#if>
            </nav>

        </div>
        </header>
        <article id="article" class="article">
            <div class="indexWeb">
                 <div id="focus" class="focus"><!-- 轮播图展示 -->
                    <div class="hd">
                        <ul></ul>
                    </div>
                    <div class="bd">
                        <ul>
                        	
                        </ul>
                    </div>
                 </div>
                 <div class="shortcut">
                    <ul class="c-box">
	                    <li><a class="ae" _rha_event="indexNew" _rha_remark="洗衣服务" href="${request.contextPath}/mobile/product/list/p1/?cateIds=xyfw" ><span class="c-1"></span>洗衣服务</a></li>
		                <li><a class="ae" _rha_event="indexDayPrivilege" _rha_remark="家政套餐" href="${request.contextPath}/mobile/product/list/p1/?cateIds=jztc" ><span class="c-2"></span>家政套餐</a></li>
		                <li><a class="ae" _rha_event="indexHot" _rha_remark="手机特惠" href="${request.contextPath}/mobile/product/list/p1/?cateIds=sjth" ><span class="c-3"></span>手机特惠</a></li>
		                <li><a class="ae" _rha_event="indexMobile" _rha_remark="出租速递" href="${request.contextPath}/mobile/product/list/p1/?cateIds=czsd" ><span class="c-4"></span>出租速递</a></li>
                    </ul>
                     <ul class="c-box">
                         <li><a class="ae" _rha_event="indexNew" _rha_remark="特惠套餐" href="${request.contextPath}/mobile/product/list/p1/?cateIds=thtc" ><span class="c-5"></span>特惠套餐</a></li>
                         <li><a class="ae" _rha_event="indexDayPrivilege" _rha_remark="除味房间" href="${request.contextPath}/mobile/product/list/p1/?cateIds=cwfj" ><span class="c-6"></span>除味房间</a></li>
                         <li><a class="ae" _rha_event="indexHot" _rha_remark="汽车除味" href="${request.contextPath}/mobile/product/list/p1/?cateIds=qccw" ><span class="c-7"></span>汽车除味</a></li>
                         <li><a class="ae" _rha_event="indexMobile" _rha_remark="生活小家电" href="${request.contextPath}/mobile/product/list/p1/?cateIds=shxjd" ><span class="c-8"></span>生活小家电</a></li>
                     </ul>
                </div>
                <div class="card-list">
                <ul>
                    	<#if mobile_hp?has_content>
                          <#list mobile_hp as info>
                          <#if info_index lt 6 >
						<li><a class="ae" _rha_event="topic" _rha_remark="${info.advName}"
							href="${info.advLinkAddress}">
								<div class="p-iner">
									<div class="p-info">
										<div class="d-tit">
											<!-- <h3>上海杭州北京深圳成都</h3> -->
										</div>
									</div>
								</div>
								<div class="pic">
									<img
										src="${request.contextPath}/resources/admin/store/${info.advImg}"
										alt="${info.advName}" />
								</div>
						</a></li>
						</#if>
						</#list>
                            </#if>
                </ul>
                </div>
        </article>
<#include "footer.ftl">
</#escape>