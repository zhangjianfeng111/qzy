<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
<title>产品列表</title>
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
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/mobile/css/style.css">
</head>
</body>
<div id="a-wrap">
    <section id="section" class="section">
    <aside></aside>
    <header id="header" class="header gb">
        <h2>产品列表</h2>
        <nav>
            <a class="iback left" href="javascript:history.back();"></a>
        </nav>
        <div class="altmsg" name="off"><h4>成功加入购物车</h4></div>
        <div class="sort">
            <ul>
            	 <li data-sort="0" <#if request.queryString?has_content && request.queryString?index_of('sort=update_time.desc') gt -1>class="cur"</#if> onclick="location.href='${request.contextPath}/mobile/product/list/p1/?sort=update_time.desc'">新品</li>	
                 <li data-sort="1" <#if request.queryString?has_content && request.queryString?index_of('sort=sell_count.desc') gt -1>class="cur"</#if> onclick="location.href='${request.contextPath}/mobile/product/list/p1/?sort=sell_count.desc'">热卖</li>
                 <li data-sort="2,3" <#if request.queryString?has_content && request.queryString?index_of('sort=preferential_price.asc') gt -1>class="cur"</#if> onclick="location.href='${request.contextPath}/mobile/product/list/p1/?sort=preferential_price.asc'">价格
                 <b  class="arrDown"></b></li>
            </ul>
        </div>
    </header>
    <article id="article" class="article">
        <div class="productList">
        	<div class="pbox-list-a pic-120">
    			<ul id="newProduct" class="con">
    			  <#include "ajax-product-list.ftl">
    			  <#assign prePage = page.prePage/>
                  <#if page.totalPages == prePage><#else><li id="J_addmore" onclick="addmore(${page.totalPages});" class="list-item load" value="0"><h3 style="display: block;width: 100%;text-align: center;">加载更多...</h3></li></#if>
                </ul>
                <ul id="saleMost" class="con"></ul>
            	<ul id="price" class="con"></ul>
            </div>
        </div>
    </article>
<script>
var pageNo = 2;
function addmore(totalPages){
	if(pageNo > totalPages){
		$("#J_addmore").remove();
		return ;
	}
	var html="";
	$.ajax({
		type: "GET",
		url: "${request.contextPath}/mobile/product/ajaxproductlist/?pageNo="+pageNo,
		dataType: "json",
		success: function( data ){
			if(data) {
				pageNo = pageNo + 1;
				for(var i=0; i<data.length;i++){
					html = html + "<li><a href=\"${request.contextPath}/mobile/product/view/"+data[i].productId+"\">"+
			   "<div class=\"list-item\">"+
			       "<div class=\"p-pic\"><img src=\"${request.contextPath}/resources/admin/store/"+data[i].imageNum+"\" alt=\""+data[i].productName+"\" /></div>"+
			       "<div class=\"d-con\">"+
			            "<h3 class=\"d-tit clamp-2\">"+data[i].productName+"</h3>"+
			            "<p class=\"d-spe\">"+data[i].keyword+"</p>"+
			        "<div class=\"db-con\">"+
			            "<h1 class=\"d-price ot\">￥"+data[i].preferentialPrice+"</h1>"+
			            "<b data-sku-id=\"5417\" class=\"cart\"></b>"+
			        "</div></div></div></a></li>"
				}
				$("#J_addmore").before(html);
			} 
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}
</script>
<#include "../footer.ftl">
</#escape>