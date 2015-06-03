<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>更多</title>
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
            <h2>更多</h2>
          
        </header>
        <article id="article" class="article">
            <div class="moreWeb" style="padding-top:0;">
                <div class="form-list-a">
                    <ul>
                        <li class="fl-item more"><a href="${request.contextPath}/sample/mobile/aboutus/" name="about" class="more_pick"><b class="name">关于我们</b><span class="detail"></span></a></li>
                        <li class="fl-item more"><a href="${request.contextPath}/sample/mobile/peisong/" name="delivery" class="more_pick"><b class="name">配送说明</b><span class="detail"></span></a></li>
                        <li class="fl-item more"><a href="${request.contextPath}/sample/mobile/tuihuo/" name="returngoods" class="more_pick"><b class="name">售后服务</b><span class="detail"></span></a></li>
                        <li class="fl-item more"><a href="${request.contextPath}/sample/mobile/wenti/" name="business" class="more_pick"><b class="name">常见问题</b><span class="detail"></span></a></li>
                    </ul>
                </div>
                <div class="form-list-a" style='border-bottom:1px solid #d4d5d5;margin-bottom:20px'>
                    <ul>
                        <li class="fl-item" style="padding:0px;"><a  href="tel:400-680-1054" style="display:block;padding:15px 0px;"><b class="name">联系客服</b><span class="detail gt">400-680-1054 </span></a></li>
                        <li class="fl-item" style="padding:0px;"><a  href="tel:0571-86335599" style="display:block;padding:15px 0px;"><b class="name">业务洽谈</b><span class="detail gt">0571-86335599 </span></a></li>
                        
                    </ul>
                </div>
                
                <div id="btnLogout"   
                onclick="location.href='${request.contextPath}/mobile/cus/<#if user??>loginOut<#else>login</#if>'"  style="background:#fff;border:1px solid #ccc;height:44px;text-align:center;line-height:44px;color:#f99b00;border-radius:3px;margin:0 10px;">
                <b class="name"  style="color: #f99b00;"><#if user??>退出帐号<#else>登入</#if> </b><span class="detail"></span></a>
               </div>
            </div>
        </article>
    </section>
</div>
</body>
</html>
<#include "footer.ftl">
</#escape>