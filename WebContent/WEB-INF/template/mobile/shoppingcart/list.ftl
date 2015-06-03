<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
<title>我的购物车</title>
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
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/common.js"></script>

</head>
<body>
<div id="a-wrap">
    <section id="section" class="section">
        <header id="header" class="header gb">
            <h2>购物车</h2>
            <nav>
                <a class="iback left" href="javascript:history.go(-1);"></a>
                <a class="idel right " href="javascript:;"  onclick="cartDelPro(this)"><span>完成</span></a>
            </nav>
        </header>
        <article id="article" class="article">
        <form id="saveForm" action="${request.contextPath}/mobile/shopcart/account" method="get" >
            <div class="myCart">
        		<div class="pbox-list-a pic-70 buys" id="cartPro">
                    <ul>
                    <#if infos?has_content>
					  <#list infos as info>
        				<li>
        					<input type="hidden" name="shopCartIds"   value="${(info.shopCart.cartId)!''}" />
                           <div class="list-item p">
                               <div class="p-pic">
                               <a href="${request.contextPath}/mobile/product/view/${(info.product.productId)!''}">
                               <img src="${request.contextPath}/resources/admin/store/${(info.product.imageNum)!''}" alt="${(info.product.productName)!''}">
                               </a>
                               </div>
                               <div class="d-con">
                                    <a href="${request.contextPath}/mobile/product/view/${(info.product.productId)!''}">
                                        <h3 class="d-tit clamp-1">${(info.product.productName)!''}</h3>
                                    </a>
                                    <p class="d-spe">${(info.product.keyword)!''}</p>
                                    <div class="db-con">
                                        ￥<h1 class="d-price ot" id="price_${(info.shopCart.cartId)!''}" data-price="${(info.shopCart.productPrice)!''}">${(info.shopCart.productPrice)!''}</h1> 
                                        <span style="display:none" id="wholePrice_${info.shopCart.cartId}" class="shopItemPrice">
										 ${((info.shopCart.productPrice)!0)   *  ((info.shopCart.productNumber)!0) }
										</span>
                                    </div>
                                    <div class="num_sel_lage fr" data-sku-id="2649">
                                    	<#if info.product.productId==7475 || info.product.productId==7454>
										<#else>
                                        <div class="inC down" data-id="${info.shopCart.cartId}" >-</div>
                                        </#if>
                                        <input type="text"  name="shopCartNums" id="amount_${info.shopCart.cartId}" <#if info.product.productId==7475 || info.product.productId==7454>readonly="readonly"</#if> data-id="${info.shopCart.cartId}" class="qty product_amount"  data-url="${request.contextPath}/mobile/shopcart/addUp" value="${(info.shopCart.productNumber)!0}">
                                        <#if info.product.productId==7475 || info.product.productId==7454>
										<#else>
                                        <div class="deC up"  data-id="${info.shopCart.cartId}" data-value="1">+</div>
                                        </#if>
                                    </div>
                                    <div class="c"></div>
                               </div>
                           </div>
                           <div class="del-item" data-sku-id="2649"><a href="javascript:void(0);" class="del_item" data-value="${request.contextPath}/mobile/shopcart/del?cartId=${info.shopCart.cartId}"><h2>删除</h2></a></div>
                       </li>
                       </#list>
					</#if>
               		</ul>
                 </div>
            </div>
            </form>
        </article>
<footer class="footer">
    <div class="form-sub-a fx">
    	 	<div class="action" style="border-bottom:1px solid #ccc;padding: 5px 0">
                <div class="act-iner m">
                    <span class="a-iteam a-msg" ><u>合计:<i class="ot s">￥<em id="shopTotalPrice">${totalPrice}</em></i></u></span>
                    <a href="javascript:void(0);" onclick=" $('#saveForm').submit();" class="a-iteam b-orgn ae"><span>去结算</span></a>
                </div>
            </div>
         <div class="nav">
            <ul class="nav-iner">
                <li><a href="${request.contextPath}/mobile/index.html" class="a-iteam "><div class="ftnav-home"></div><span>首页</span></a></li>
                <li><a href="${request.contextPath}/mobile/product/catelist.html" class="a-iteam "><div class="ftnav-sort"></div><span>品类</span></a></li>
                <li><a href="${request.contextPath}/mobile/order/list/p1.html" class="a-iteam "><div class="ftnav-myfru"></div><span>我的订单</span></a></li>
                <li><a href="${request.contextPath}/mobile/shopcart/list/p1.html" class="a-iteam cur"><div class="ftnav-cart"><i id="cartCount"><#if userShopingCart?has_content>${userShopingCart}<#else>0</#if></i></div><span>购物车</span></a></li>
                <li><a href="${request.contextPath}/sample/mobile/more.html" class="a-iteam  "><div class="ftnav-more"></div><span>更多</span></a></li>
            </ul>
        </div>
    </div>
</footer>
    </section>
</div>
</body>
</html>
</#escape>