<#escape x as x!"">
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
<title>${info.productName}</title>
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
</body>
<div id="a-wrap">
    <section id="section" class="section">
        <header id="header" class="header gb">
            <h2>产品详情</h2>
            <nav>
                <a class="iback left back" href="javascript:window.history.go(-1);"></a>
                <a href="${request.contextPath}/mobile/shopcart/list/p1.html" class="icart right" > <#if userShopingCart?has_content && userShopingCart &gt; 0><i id="cartCount"> ${userShopingCart}  </i><#else><i id="cartCount" style="display:none" > </i></#if></a>
                <div class="altmsg" name="off"><h4>成功加入购物车</h4></div>
            </nav>
            <div class="sort">
                <ul>
                     <li class="cur base-info">基本信息</li>
                     <li class="detail">详细信息</li>
                     <li class="comment">用户评论</li>
                </ul>
            </div>
        </header>
        <article id="article" class="article">
            <div class="productDetailed">
                <div class="base-info ">
                     <div id="focus" class="focus"><!-- 轮播图展示 -->
                        <div class="hd">
                            <ul></ul>
                        </div>
                        <div class="bd">
                            <ul>
                            <li><a href="${request.contextPath}/mobile/product/view/${info.productId}"><img src="${request.contextPath}/resources/admin/store/${info.imageNum}" /></a></li>
                            </ul>
                        </div>
                     </div>
                     <div class="pd-tit">
                         <div class="p-nav">
                            <div class="cotl">
                            	<a id="like" href="javascript:;" data-id="3602" class="liked"></a>
                            </div>
                            <div class="num_sel_lage">
                            <#if info.productId==7475 || info.productId==7454>
								<#else>
                                <div class="inC minus">-</div>
                                </#if>
                                <input type="text" <#if info.productId==7475 || info.productId==7454>readonly="readonly"</#if> id="buy_num" disabled value="1"/>
                                <#if info.productId==7475 || info.productId==7454>
								<#else>
                                <div class="deC plus">+</div>
                                </#if>
                            </div>
                        </div>
                        <div class="p-info">
                            <h3>${info.productName}</h3>
                            <div class="d-price">
                                <span class="ot">￥<h1>
                                <#if price??> ${price} 
							<#else>
								${(info.preferentialPrice)!'0'}
							</#if>
                                </h1></span>
                            </div>
                        </div>
                        <div class="c"></div>
                     </div>
                     <div class="form-list-a">
                        <ul>
                            <hr />
                            <li class="fl-item" style="padding-top: 20px">
                                <dl class="spec" data-sku-id="5417">
                                    <dl class="on" data-sku-id="5417" data-prc=199 data-oldprc="" >${info.keyword}</dl>
                                <div class="c"></div>
                                </dl>
                             </li>
                        </ul>
                     </div>
                </div>
                <div class="detail">${info.productDesc}</div>
                <div class="user-comment comment" style="display: none;"><!-- 用户评论 -->
                    <div class="comm-head"><h1>唯有亲口品鉴，方知其中滋味</h1></div>
                    <div class="comm-main">
                        <ul id="comment">
                        <#if comments?has_content>
                        <#list comments as cinfo>
                          <li class="comm-iteam">
                            <div class="us-hd">    
                              <div class="us-score start-${(info.lcommentEvel)!5}"></div>    
                              <div class="us-name">${cinfo.createUser}</div>
                            </div>
                            <div class="us-comm">${cinfo.commentDesc}</div><div class="us-time"><#if cinfo.createTime?has_content>${cinfo.createTime?string("yyyy-MM-dd HH:mm:ss")}</#if></div>
                          </li>
                          </#list>
                          </#if>
                        </ul>
                        <div class="pbox-more" id="moreComment"  productId="${info.productId}"  fromUrl="${request.contextPath}/mobile/comment/listAjax/list" ><span>加载更多...</span></div>
                    </div>
                </div>
            </div>
        </article>
        <footer class="footer">
            <div class="form-sub-a fx">
               <div class="action product_action">
               		 <a href="${request.contextPath}/mobile/index.html" class="act-btn"><i class="icon_home"></i>返回首页</a>
                     <div class="act-iner m">
					
					<#if Session['user']?has_content>
                        <a id="addtocart" href="javascript:;" data-url="${request.contextPath}/mobile/shopcart/addCart" data-value="${user.mobile}" class="a-iteam b-orgn ml ae J_add_cart"><span>加入购物车</span></a>
                    <#else>
                    	<#if info.stock?has_content && info.sellCount?has_content && ((info.sellCount) >= info.stock)>
                    	<a id="addtocart" href="#" class="a-iteam b-orgn ml ae J_add_cart"><span>已售罄</span></a>
                    	<#else>
						<a href="${request.contextPath}/mobile/cus/login/?backUrl=${request.requestUri}?${request.queryString}" class="a-iteam b-orgn ml ae"><span>加入购物车</span></a>
						</#if>
					</#if>
					<!--
					<a href="http://www.yephouse.com/sample/maiguangle" class="a-iteam b-orgn ml ae J_add_cart"><span>今日已售罄</span></a>
					-->
					<!--
                     <#if !isSellTime >
                        <a id="addtocart" href="http://www.yephouse.com/sample/maiguangle" class="a-iteam b-orgn ml ae J_add_cart"><span>今日已售罄</span></a>
                    <#else>
                    		 <#if Session['user']?has_content>
                        <a id="addtocart" href="javascript:;" data-url="${request.contextPath}/mobile/shopcart/addCart" class="a-iteam b-orgn ml ae J_add_cart"><span>加入购物车</span></a>
                    <#else>
						<a href="${request.contextPath}/mobile/cus/login/?backUrl=${request.requestUri}?${request.queryString}" class="a-iteam b-orgn ml ae"><span>加入购物车</span></a>
					</#if>
					</#if>
					-->
                        	<input type="hidden" id="addCartSkuId"  value="${(sku.skuId)!''}" />
							<input type="hidden" id="addCartProductId"  value="${(info.productId)!''}" />
                    </div>
                </div>
            </div>
        </footer>
    </section>
</div>
</body>
</html>
</#escape>