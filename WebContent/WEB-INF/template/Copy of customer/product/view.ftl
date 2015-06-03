<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<!-- jquery js -->
		<script src="${request.contextPath}/resources/front/js/sweet-alert.js"></script>
		<link rel="stylesheet" href="${request.contextPath}/resources/front/css/sweet-alert.css">
		<script type="text/javascript" src="${request.contextPath}/resources/front/js/js.js"></script>
		
		
			<div class="section spxq-header">
				<div class="item-detail">
					<img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}"  height="291" width="291" class="item-detail-pic">
					<div class="extra">
						<ul class="icos clearfix">
							<li class="zpbz"><img src="${request.contextPath}/resources/front/img/zpbz.png" height="44" width="44"><p>正品保证</p></li>
							<li class="fwbz"><img src="${request.contextPath}/resources/front/img/fwbz.png" height="44" width="44"><p>服务保障</p></li>
							<li class="qcll"><img src="${request.contextPath}/resources/front/img/qcll.png" height="44" width="44"><p>全程冷链</p></li>
						</ul>
						<p class="temp">当前冷库温度<span>${(info.temperature)!''}℃</span></p>
						<p>产地：<span>${info.country}</span></p>
						<p>重量：<span>
						<#if (sku.propertiesName)??><@yep.findProductSkyWeight  sku.propertiesName /></#if>
						
						(含包装)</span></p>
						<p>商品编号:<span>${info.productCustomNumber}</span></p>
						<p class="praise">好评度：<span class="rectangle"></span><span class="num">97%</span></p>
						<p class="comment"><a href="#">  ${(commentCount)!0}条评论</a></p>
					</div>
					<div class="item-detail-info">
						<p class="item-title">${(info.productName)!''}</p>
						<p class="item-price"><span>优惠价：￥</span><span class="new-num"  id="skuPrice">
						<#if price??> ${price} 
						<#else>
						${(info.preferentialPrice)!'0'}
						</#if>
					
						</span>
						
						<span class="old">￥   ${(info.marketPrice)!'0'}</span></p>

						<!--<p class="types">
						
						<#if  !price?? >
						<#if list?has_content>
                      <#list list as proProductSku>
                      <span data-price="${proProductSku.skuRetailPrice}" data-weight=""  data-id="${proProductSku.skuId}"
						class="skuSpan <#if proProductSku.skuId ==( (sku.skuId)!0 ) > active</#if>"
					> 
                      	<#if (proProductSku.propertiesName)??>
                      		<@yep.findProductSkyTitle proProductSku.propertiesName />
                      	</#if>
                       </span>
                      </#list>
                      </#if>
                      </#if>
                      </p>-->
                      
                      <p class="types"><span class="active">${info.keyword}</span></p>
                      
                       <#if ((info.isday)!0) ==1>
                       <p class="types"><span class="active" id="productAmount" >
                      	剩余 :
                      	<#if  ((info.dayNum)!0) gt 0 >
                      			${ ((info.dayNum)!0) }
                      	<#else>
                      		0
                      	</#if>		
                       </span></p>
                       <#else>
                       <#if info.stock?has_content>
                       	<span class="active" id="productAmount" >
                      	剩余 :${info.stock-info.sellCount}
                       </span>
                       </#if>
                       </#if>
                       
                      
						<div class="add">
							<div class="add-counter">
								<input type="text" <#if info.productId==7475 || info.productId==7454>readonly="readonly"</#if> id="count" class="counter" value="1">
								<#if info.productId==7475 || info.productId==7454>
								<#else>
								<a href="javascript:;" class="plus skuRetailPrice">+</a>
								<a href="javascript:;" class="minus">-</a>
								</#if>
							</div>
							
							<input type="hidden" id="addCartSkuId"  value="${(sku.skuId)!''}" />
							<input type="hidden" id="addCartProductId"  value="${(info.productId)!''}" />
							
							<#if Session['user']?has_content>
							<a href="#" 
								data-url="${request.contextPath}/cus/cart/addCart" data-value="${user.mobile}"
							class="add-to-cart hoverbt J_add_cart">加入购物车</a>
							<#else>
								<#if info.stock?has_content && info.sellCount?has_content && ((info.sellCount) >= info.stock)>
								<a class="add-to-cart hoverbt " style="background:#aaa;">已售罄</a>
								<#else>
								<a href="${request.contextPath}/cus/info/login?backUrl=${request.requestUri}?${request.queryString}" 
								class="add-to-cart hoverbt">加入购物车</a>
								</#if>
							</#if>
							<!--
							<a class="add-to-cart hoverbt " style="background:#aaa;">今日已售罄</a>
							-->
							<!--
							<#if !isSellTime>
							<a class="add-to-cart hoverbt " style="background:#aaa;">今日已售罄</a>
							<#else>  
								<#if Session['user']?has_content>
							<a href="#" 
								data-url="${request.contextPath}/cus/cart/addCart" 
							class="add-to-cart hoverbt J_add_cart">加入购物车</a>
							<#else>
								<a href="${request.contextPath}/cus/info/login?backUrl=${request.requestUri}?${request.queryString}" 
								class="add-to-cart hoverbt">加入购物车</a>
							</#if>
							</#if>
							-->
						</div>
					</div>
				</div>
			</div>
			<div class="section spxq-body">
				<div class="rightpart">
					<div class="tj">
						<p class="tj-header">为您推荐</p>
						
						<#if others?has_content >
						<#list others as info>
						<div class="tj-item">
							<a href="${request.contextPath}/cus/product/detail?id=${(info.productId)!''}" class="tj-item-pic"><img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}" height="84" width="85"></a>
							<p class="tj-item-title"><a href="${request.contextPath}/cus/product/detail?id=${(info.productId)!''}">${(info.productName)!''}</a></p>
							<p class="tj-item-price">￥${(info.preferentialPrice)!''} / ${(info.productUnit)!''}</p>
						</div>
						</#list>
						</#if>
					
					</div>
					<div class="tj" id="historyDiv">
					
						
					</div>
				</div>
				<div class="content" id="details">
					<ul class="header clearfix">
						<li class="active">产品详情</li>
						<li>用户评价</li>
					</ul>
					<div class="entry">
						${info.productDesc}
					</div>
					<div class="comment-div">
						<div class="comment-header clearfix">
							<div class="score">
								<p>总体满意度</p>
								<p class="num">4.6分</p>
							</div>
							<!--
							<div class="stars-div">
								<p>
									<span class="stars-bg">
										<span class="star-5"></span>
									</span>
									<span class="rect">
										<span class="per"></span>
									</span>
									<span class="num-peo">30.5</span>%
								</p>
								<p>
									<span class="stars-bg">
										<span class="star-4"></span>
									</span>
									<span class="rect">
										<span class="per"></span>
									</span>
									<span class="num-peo">29.5</span>%
								</p>
								<p>
									<span class="stars-bg">
										<span class="star-3"></span>
									</span>
									<span class="rect">
										<span class="per"></span>
									</span>
									<span class="num-peo">20.0</span>%
								</p>
								<p>
									<span class="stars-bg">
										<span class="star-2"></span>
									</span>
									<span class="rect">
										<span class="per"></span>
									</span>
									<span class="num-peo">20.0</span>%
								</p>
								<p>
									<span class="stars-bg">
										<span class="star-1"></span>
									</span>
									<span class="rect">
										<span class="per"></span>
									</span>
									<span class="num-peo">10.0</span>%
								</p>
							</div>
							<div class="add-comment">
								<a href="${request.contextPath}/cus/order/list/p1.html">我要评论</a>
								<p>只有购买过该商品的用户才可以评论</p>
							</div>
							-->
							
							
						</div>
						<div id="commentsShows" class="comments">
							<#if commentList?has_content>
							<#list commentList as info>
							<div class="comment" id="comment" >
								<img src="${request.contextPath}/resources/front/images/user.jpg" height="52" width="53" class="comment-ava-pic">
								<div class="comment-wrap">
									<p class="comment-title"><span class="time">
										<#if (info.createTime)??>
											${info.createTime?string("yyyy年MM月dd日HH:mm:ss")}
										</#if>
									</span>
									<span class="stars-bg">
										<span class="star-${(info.lcommentEvel)!5}"></span>
									</span></p>
									<p class="comment-text"> ${info.commentDesc} </p>
								</div>
							</div>
							</#list>
							</#if>
						
							<ul class="pagination clearfix">
							
							<#if page?has_content>
								<#assign pageUrl>
									<@yep.searchPageUrl '${request.contextPath}/cus/comment/listAjax/list/p1' 'pageNo=#' 'productId=${(info.productId)!0}' />
								</#assign>
								<#assign ajaxPageShowId="commentsShows" >
								<#include "../common/pagesAjax.ftl">
							</#if>
							</ul>
						</div>
					</div>
				</div>
			</div>

 
</#escape>