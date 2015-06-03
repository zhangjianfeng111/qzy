<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
<title>品类</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="format-detection" content="telephone=no"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<meta http-equiv="Cache-Control" content="no-transform "/>
<meta name="keywords" content="">
<meta name="description" content="">  
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/mobile/css/style.css">
</head>
</body>
<div id="a-wrap">
    <section id="section" class="section">
        <aside></aside>
        <header id="header" class="header gb">
            <h2>品类</h2>
        </header>
        <article id="article" class="article">
            <div class="classifyWeb">
                <div class="form-list-a" id="category">
                    <ul>
                    	<#if cates?has_content>
                    	<#list cates as info>
                        <li class="fl-item more"><a href="${request.contextPath}/mobile/product/list/p1/?cateIds=${info.cateCode}"><b>${info.cateName}</b></a></li>
                    	</#list>
                    	</#if>
                    </ul>
                </div>
            </div>
            </div>
        </article>
<#include "../footer.ftl">
</#escape>	