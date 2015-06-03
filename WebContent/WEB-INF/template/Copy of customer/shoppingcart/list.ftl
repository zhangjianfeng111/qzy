<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<form id="saveForm" action="${request.contextPath}/cus/cart/account">
  <div class="section shopping-cart">
				<h1>购物车</h1>
				<ul class="header clearfix">
					<li>&nbsp;</li>
					<li>名称</li>
					<!--
					<li>规格</li>
					-->
					<li>单价</li>
					<li>数量</li>
					<li>价格</li>
					<li>操作</li>
				</ul>
				<input type="hidden" value="123"/>
				
				<#if infos?has_content>
					  <#list infos as info>
						<div class="item">
							<ul class="clearfix">
								<li class="cart-item-pic">
								
								<input type="hidden" name="shopCartIds"   value="${info.shopCart.cartId}" />
								
								<a href="${request.contextPath}/cus/product/detail?id=${(info.product.productId)!''}">
									<img src="${request.contextPath}/resources/admin/store/${(info.product.imageNum)!''}" height="62" width="65"></a></li>
								<li><a href="${request.contextPath}/cus/product/detail?id=${(info.product.productId)!''}">${(info.product.productName)!''}</a></li>
								<!--
								<li>${(info.skuProMap.title)!''}</li>
								-->
								
								
								<li>￥
								<span id="price_${info.shopCart.cartId}" data-price="${(info.shopCart.productPrice)!''}">${(info.shopCart.productPrice)!''}</span>
								</li>
								<li class="num"><div class="counter">
									<#if info.product.productId==7475 || info.product.productId==7454>
									<#else>
									<a href="javascript:void();" class="minus down"  data-id="${info.shopCart.cartId}"   >-</a>
									</#if>
									<input type="text"  name="shopCartNums" id="amount_${info.shopCart.cartId}" <#if info.product.productId==7475 || info.product.productId==7454>readonly="readonly"</#if> data-id="${info.shopCart.cartId}"   class="product_amount"  data-url="${request.contextPath}/cus/cart/addUp"    value="${(info.shopCart.productNumber)!0}" style="width:60px">
									<#if info.product.productId==7475 || info.product.productId==7454>
									<#else>
									<a href="javascript:void(0);" class="plus  up"  data-id="${info.shopCart.cartId}" data-value="1">+</a></div>
									</#if>
								</li>
								<li class="price">￥
								<span id="wholePrice_${info.shopCart.cartId}" class="shopItemPrice">
								 ${((info.shopCart.productPrice)!0)   *  ((info.shopCart.productNumber)!0) }
								</span>
								</li>
								<li class="del" ><a href="javascript:void(0);"   class="del_item" data-value='${request.contextPath}/cus/cart/del?cartId=${info.shopCart.cartId}' >删除</a></li>
							</ul>
						</div>
					</#list>
				</#if>
			
				<div class="settle">
					<a href="javascript:void(0);" onclick=" $('#saveForm').submit(); " class="settle-btn hoverbt">结算</a>
					
					<p><span class="hj"> 满100元免运费  合计（不含运费）：<span class="num"  >￥ <span id="shopTotalPrice">${totalPrice}<span> </span></span><a href="${request.contextPath}/cus/product/list/p1?cateIds=xxdj"><< 继续购物</a></p>
				</div>
			</div>
			</form>
<script src="${request.contextPath}/resources/admin/js/common/shopcart.js"></script>
  <#include "../common/footer.ftl">
</#escape>