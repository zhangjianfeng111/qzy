<#escape x as x!"">
<!DOCTYPE html>
<html>
	<head>
	<link rel="shortcut icon" href="/resources/front/images/favicon.ico">
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<link rel="stylesheet" href="${request.contextPath}/resources/front/css/styles.css" type="text/css">
		

<!--[if !IE]> -->
    <script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<script src="${request.contextPath}/resources/front/myJs/js.js"></script>
		<script src="${request.contextPath}/resources/front/myJs/common.js"></script>
		<script src="${request.contextPath}/resources/front/myJs/jqueryCookie.js"></script>
		<script type="text/javascript">
			var YS = YS || {data:{},util:{}};
			YS.config = {path:{rootPath:"${request.contextPath}"}}
		</script>
		<title>杭州味道网- 杭州味道网</title>
		<script type="text/javascript">

    function browserRedirect() { 

    var sUserAgent= navigator.userAgent.toLowerCase(); 

    var bIsIpad= sUserAgent.match(/ipad/i) == "ipad"; 

    var bIsIphoneOs= sUserAgent.match(/iphone os/i) == "iphone os"; 

    var bIsMidp= sUserAgent.match(/midp/i) == "midp"; 

    var bIsUc7= sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4"; 

    var bIsUc= sUserAgent.match(/ucweb/i) == "ucweb"; 

    var bIsAndroid= sUserAgent.match(/android/i) == "android"; 

    var bIsCE= sUserAgent.match(/windows ce/i) == "windows ce"; 

    var bIsWM= sUserAgent.match(/windows mobile/i) == "windows mobile"; 

    if ( bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) { 

    window.location.href= '/mobile/index'; 

    } 

    } 

    browserRedirect(); 

</script>
	</head>
	<body>
		<div id="navbar">
			<ul class="menus clearfix">
				<#if ! Session['user']?has_content>
				<li><a href="${request.contextPath}/cus/info/login">请登录</a></li>
				<li><a href="${request.contextPath}/cus/info/regist">免费注册</a></li>
				<#else>
				<li><a href="${request.contextPath}/cus/info/userCenter">个人中心</a></li>
				<li><a href="${request.contextPath}/cus/info/loginOut">退出登录</a></li>
				</#if>
				<li><a href="${request.contextPath}/cus/order/list/p1.html">我的订单</a></li>
				<li style="position:relative;"><a href="${request.contextPath}/cus/cart/list/p1.html">购物车</a>   <#if userShopingCart?has_content && userShopingCart &gt; 0><span id="gwcnum" class="gwcnum" > ${userShopingCart}  </span> <#else><span id="gwcnum" class="gwcnum" style="display:none"> </span> </#if></li>
				<!-- 
				<li><a href="#">我的优选<span class="down-arrow"></span></a></li>
				<li><a href="#">帮助中心<span class="down-arrow"></span></a></li>
				<li><a href="#">网站导航<span class="down-arrow"></span></a></li> -->
				<li></li>
			</ul>
		</div>
		<div class="container">
			<div id="header">
				<div class="logo-div"><a href="${request.contextPath}/index.html"></a></div>
				<div class="search-div">
					<div class="search-wrap clearfix">
						
						<input type="text" name="productName" id="searchProductName"  value="${(searchBean.productName)!''}"  class="search-i" placeholder="如：车厘子">
						<span class="search-btn" data-url="${request.contextPath}/cus/product/list/p1?productName=" onclick="searchProduct(this)">搜索</span>
					</div>
					<ul class="keys">    
						<li><a href="${request.contextPath}/cus/product/list/p1?productName=车厘子">车厘子</a></li>
						<li><a href="${request.contextPath}/cus/product/list/p1?productName=蓝莓">蓝莓</a></li>
						<li><a href="${request.contextPath}/cus/product/list/p1?productName=牛油果">牛油果</a></li>
					</ul>
				</div>
				<ul class="menus">
					<li <#if (request.requestUri = request.contextPath + "/" || (request.requestUri?index_of('index') > -1)) && request.requestUri?index_of('comp/index') == -1>class="active"</#if>><a href="${request.contextPath}/index.html">首页</a></li>
					<li <#if request.queryString?has_content && request.queryString?index_of('cateIds=xxdj') gt -1>class="active"</#if>><a href="${request.contextPath}/cus/product/list/p1?cateIds=xxdj">新鲜到家</a></li>
					<li <#if request.requestUri?index_of('cus/product/day') gt -1>class="active"</#if>><a href="${request.contextPath}/cus/product/day">每日优惠</a></li>
					<li <#if request.queryString?has_content && request.queryString?index_of('cateIds=cyzq')  gt -1>class="active"</#if>><a href="${request.contextPath}/cus/product/list/p1?cateIds=cyzq">茶叶专区</a></li>
					<li <#if request.requestUri?index_of('comp/index') gt -1>class="active"</#if>><a href="${request.contextPath}/comp/index">企业订购</a></li>
					<li <#if request.requestUri?index_of('cus/product/customer/list/p') gt -1>class="active"</#if>><a href="${request.contextPath}/cus/product/customer/list/p1.html">团购</a></li>
				</ul>
			</div>
</#escape>