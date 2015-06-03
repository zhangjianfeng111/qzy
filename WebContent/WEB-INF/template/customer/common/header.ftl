<#escape x as x!"">
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${request.contextPath}/resources/carbon/css/style.css" type="text/css">
    <script src="${request.contextPath}/resources/carbon/js/jquery-1.11.2.min.js"></script>
    <script src="${request.contextPath}/resources/front/myJs/js.js"></script>
		<script src="${request.contextPath}/resources/front/myJs/common.js"></script>
		<script src="${request.contextPath}/resources/front/myJs/jqueryCookie.js"></script>
		<script src="${request.contextPath}/resources/carbon/js/index.js"></script>
    <script type="text/javascript">
		var YS = YS || {data:{},util:{}};
		YS.config = {path:{rootPath:"${request.contextPath}"}}
	</script>
</head>
<body>
<div class="container">
    <div class="nav_bar_01">
        <div class="wrap">
            <div class="left">
            	<#if ! Session['user']?has_content>
				<a href="${request.contextPath}/cus/info/login">请登录</a>
				</#if>
				<#if Session['user']?has_content>
				<a href="${request.contextPath}/cus/info/loginOut">退出登录</a>
				</#if>
                <img src="${request.contextPath}/resources/carbon/image/line-01.png" width="2" height="21" class="middle">
                <a href="${request.contextPath}/cus/info/regist/">免费注册</a>
            </div>
            <div class="right">
                <ul class="nav">
                    <li>
                        <a href="#">公司官网</a>
                    </li>
                    <li>
                        关注我们：
                        <a href="#"><img src="${request.contextPath}/resources/carbon/image/xinlangweibo.png" class="middle"></a>
                        <a href="#"><img src="${request.contextPath}/resources/carbon/image/TXQQ.png" class="middle"></a>
                        <img src="${request.contextPath}/resources/carbon/image/bottom.png" class="middle">
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/order/list/p1.html">
                            个人中心
                            <img src="${request.contextPath}/resources/carbon/image/bottom.png" class="middle">
                        </a>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <div class="header">
        <div class="wrap">
            <div class="logo l">
                <a href="${request.contextPath}/index.html"><img src="${request.contextPath}/resources/carbon/image/logo.png" width="257" height="82"></a>
            </div>
            <form class="form l" action="">
                    <span class="s_ipt_wr">
                        <input id="searchProductName" class="s_ipt" type="text" value="" name="productName" placeholder="如：炭博士">
                    </span>
                    <span class="s_btn-wr">
                        <input class="s_btn" type="button" data-url="${request.contextPath}/cus/product/list1/p1?productName=" onclick="searchProduct(this)" value="搜索">
                    </span>
            </form>
            <div class="service r">
                <ul>
                    <li>
                        <img src="${request.contextPath}/resources/carbon/image/service-02.png">
                        <p font-weight="bolder">30天退换货</p>
                        <p color="#999999">购物有保障</p>
                    </li>
                    <li>
                        <img src="${request.contextPath}/resources/carbon/image/service-03.png">
                        <p font-weight="bolder">满108就包邮</p>
                        <p color="#999999">闪电发货</p>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <div class="nav_bar_02">
        <div class="wrap">
            <div class="main_nav">
                <div id="main_nav_link" class="main_nav_link">
                    <a href="${request.contextPath}/index.html">全部商品分类</a>
                </div>
                <div id="main_cata" class="main_cata" style="display: none;">
                    <ul>
                    	<#if catePageLists?has_content>
						<#list catePageLists as cate> 
                        <li >
                            <h3>
                            	<a href="${request.contextPath}/cus/product/list1/p1?cateIds=${(cate.cateCode)!''}">${cate.cateName}</a>
                            </h3>
                            <#if catePageList?has_content>
                            <#list catePageList as info>
                            <#if info.parentCateId==cate.cateId>
                            <div class="dd">
                                <a href="${request.contextPath}/cus/product/list1/p1?cateIds=${(info.cateCode)!''}">${info.cateName}</a>
                            </div>
                            </#if>
                            </#list>
						    </#if>
                        </li>
                        </#list>
						</#if>
                    </ul>
                </div>
             </div>   
            <ul class="sub_nav">
                <li >
                    <a <#if request.requestUri?index_of('cus/product/day') gt -1>class="active"</#if> href="${request.contextPath}/cus/product/day">每日优惠</a>
                </li>
                <li >
                	<a <#if request.queryString?has_content && request.queryString?index_of('cateIds=9c9052ca-4ceb-4cfb-8377-0ff1e6898621') gt -1>class="active"</#if>  href="${request.contextPath}/cus/product/list1/p1?cateIds=9c9052ca-4ceb-4cfb-8377-0ff1e6898621">家政服务</a>
                    
                </li>
                <li >
                	<a <#if request.queryString?has_content && request.queryString?index_of('d1c3d8b3-6a80-4df7-925a-8603aca85ebd') gt -1>class="active"</#if> href="${request.contextPath}/cus/product/list1/p1?cateIds=d1c3d8b3-6a80-4df7-925a-8603aca85ebd">烧烤生活</a>
                    
                </li>
                <li>
                	<a <#if request.queryString?has_content && request.queryString?index_of('feb6f13f-3c8a-4ad3-a619-2575ec757e66') gt -1>class="active"</#if> href="${request.contextPath}/cus/product/list1/p1?cateIds=feb6f13f-3c8a-4ad3-a619-2575ec757e66">商品出租</a>
                </li>
                <li >
                    <a <#if request.requestUri?index_of('comp/index') gt -1>class="active"</#if> href="${request.contextPath}/comp/index">企业订购</a>
                </li>
                <li >
                    <a <#if request.requestUri?index_of('cus/product/customer/list/p') gt -1>class="active"</#if> href="${request.contextPath}/cus/product/customer/list/p1">团购</a>
                </li>
                <li >
                    <a <#if request.queryString?has_content && request.queryString?index_of('869b0b74-d632-4c7c-9edc-c4b090f2011e') gt -1>class="active"</#if> href="${request.contextPath}/cus/product/list1/p1?cateIds=869b0b74-d632-4c7c-9edc-c4b090f2011e">合作频道</a>
                </li>
            </ul>
            <div class="hd_cart">
                <a href="${request.contextPath}/cus/cart/list/p1.html">
                        <span class="al">
                            <img src="${request.contextPath}/resources/carbon/image/shopping.png">
                        </span>
                        <span class="ar">
                            <img src="${request.contextPath}/resources/carbon/image/shopping-right.png">
                        </span>
                </a>
            </div>
        </div>
    </div>
</#escape>
<script>
	$(document).ready(function(){
    $("#main_nav_link").hover(function(){
        $("#main_cata").show();
    },function(){
        $("#main_cata").hide();
    });

    var len = $("#bootha li").length;
    var indexs = 0;
    var adTimer;
    $("#bootha li").click(function(){
        indexs = $(this).index();
        showIMG(indexs);
    });
    $("#booth").hover(function(){
        clearInterval(adTimer);
    },function(){
        adTimer = setInterval(function(){
            indexs++;
            if( indexs == len){
                indexs = 0;
            }
            showIMG(indexs);
        },3000)
    }).trigger("mouseleave");
});

function showIMG(index){
    var adWidth = $("#booth").width();
    $("#booths").stop().animate({left:-adWidth*index},1000);
    $("#bootha li").removeClass("on").eq(index).addClass("on");
}
function showBg(){
    $("#dialog").show();
}
function closeBg(){
    $("#dialog").hide();
}
</script>