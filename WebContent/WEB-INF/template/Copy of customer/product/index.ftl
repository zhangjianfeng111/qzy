<#escape x as x!"">
<#include "../common/header.ftl">

<link rel="stylesheet" href="${request.contextPath}/resources/front/css/jquery.mThumbnailScroller.css">

<script type="text/javascript" src="${request.contextPath}/resources/front/js/js.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/front/js/jquery-1.8.3.min.js"></script>

			<div class="section" style="width:960px;height:343px;">
				<div style="width:960px;height:343px;">
					<div class="yx-rotaion" style="width:960px;height:343px;">
						<ul class="rotaion_list" style="width:960px;height:343px;">
						<#if pc_hp?has_content>
	                          <#list pc_hp as info>
							<li><a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" alt="${info.advName}" width="960" height="343" style="width:960px;height:343px;"></a></li>
							</#list>
	                            </#if>
						</ul>
					</div>
				</div>
			</div>
			
			<!--- xxdj, 新鲜到家 -->
			<div class="section list1 hoverimg">
				<div class="leftpart">
					<#if catePageLists?has_content>
					<#list catePageLists as info>
						<a href="javascript:;" class="btn <#if info_index==0>active</#if>">${(info.cateName)!''}</a>
					</#list>
					</#if>
				
				</div>
				<div class="rightpart">
				<#if adv1?has_content>
                          <#list adv1 as info>
                          <#if info_index ==0>
					<a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" class="item-pic"></a>
					</#if>
					</#list>
					</#if>
				</div>
				<div class="items">
					<div class="content-a">
						<#if cateProducts?has_content>
						<#list cateProducts as products> 
						<div class="content-a-block">
							<#if products?has_content>
							<#list products as product>
							<div class="item">
								<a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}">
										<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" class="item-pic"></a>
								<p class="price">￥<#if product.customerStatus?has_content && product.customerStatus==1>${product.productPrice}<#elseif product.isday?has_content && product.isday==1>${product.dayPrice}<#else>${product.preferentialPrice}</#if></p>
								<p class="title"><a href="${request.contextPath}/cus/product/detail?id=${product.productId}">${product.productName}<br>${(product.keyword)!''}</a></p>	
							</div>
							</#list>
							</#if>
						</div>
						</#list>
						</#if>

					</div>
				</div>
			</div>
			<div class="section">
				<#if adv2?has_content>
                          <#list adv2 as info>
                          <#if info_index ==0>
					<a href="${info.advLinkAddress}"><img style="width:100%;" src="${request.contextPath}/resources/admin/store/${info.advImg}" ></a>
					</#if>
					</#list>
					</#if>
			</div>
			<div class="section diqu hoverimg">
				<ul class="header">
					<li class="active">国产水果<span class="down-arrow"></span></li>
					<li>进口水果<span class="down-arrow"></span></li>
					<li>台湾水果<span class="down-arrow"></span></li>
				</ul>

				<div class="leftpart">
				<#if adv3?has_content>
                          <#list adv3 as info>
					<a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" alt="${info.advName}" width="195px" height="426px"></a>					
					</#list>
					</#if>					
				</div>
				<div class="items">
					<#if cateProducts2?has_content>
					<#list cateProducts2 as products> 
					<div class="diqu-b">
						<#if products?has_content>
						<#list products as product>
						<div class="item">
							<a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}" >
								<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" alt="${(product.productName)!''}" height="170px" width="170px"></a>
							<p class="title"><a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}">
							<#if  (product.productName) ?? && product.productName?length gt  15>
 	 						${product.productName?substring(0,15)}...
							<#else>
								${(product.productName)!''}
							</#if>
							
							</a></p>
							<p class="price clearfix"><span class="old">￥${product.marketPrice}</span><span class="new">￥${product.preferentialPrice}</span>/
							<#if  (product.keyword) ?? && product.keyword?length gt 6>
							${product.keyword?substring(0,6)}...
							<#else>
								${(product.keyword)!''}
							</#if>	
							</p>
						</div>
						</#list>
						</#if>
					</div>
					</#list>
					</#if>
				</div>
			</div>
		</div>
		<img src="${request.contextPath}/resources/admin/store/15020317065811212133.gif" class="longbanner">
		<div class="container">
			<div class="section list2">
				<div class="rightpart">
				<#if adv5?has_content>
                          <#list adv5 as info>
                          <#if info_index ==0>
					<a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" height="152" width="450" class="list2-item"></a>
					</#if>
					<#if info_index ==1>
					<a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" height="152" width="450" class="list2-item"></a>
					</#if>
					</#list>
					</#if>
				</div>
				<#if adv4?has_content>
                          <#list adv4 as info>
                          <#if info_index ==0>
					<a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" height="310" width="500" class="xinpin"></a>
					</#if>
					</#list>
					</#if>
			</div>
			<div class="section tg hoverimg" id="content-4">
			<#if adv6?has_content>
                          <#list adv6 as info>
					<a href="${info.advLinkAddress}" class="tg-pic"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" height="153" width="200"></a>				
					</#list>
					</#if>
				<ul class="items">
					<#if dtos?has_content>
					<#list dtos as product>
					<li class="item">
						 ${product}
						<a href="${request.contextPath}/cus/product/detail?id=${product.productId}">
							<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" height="150" width="153" class="item-pic"></a>
						<div class="info">
							<p class="title">${(product.productName)!""}</p>
							<p class="num">${(product.amount)!0}人下单</p>
						</div>
					</li>
					</#list>
					</#if>
				</ul>
			</div>
			<div class="section tips">
			<#if infos?has_content>
                          <#list infos as info>
                          <#if info_index == 0>
				<a href="${request.contextPath}/news/list/p1" class="tips-pic"><img src="${request.contextPath}/resources/admin/store/150203141932Untitled-19.jpg" height="165" width="165"></a>
				</#if>
					</#list>
					</#if>
				<div class="wrapper">
				 <#if infos?has_content>
                          <#list infos as info>
                          <#if info_index lt 3>
					<div class="tip">
						<p class="tip-title"><span class="red-dot"></span><a href="${request.contextPath}/news/input/${info.id}">${(info.title)!'暂无'}</a></p>
						<p class="tip-text"><#if (info.seoDesc?length > 40)>${info.seoDesc[0..40]}...<#else> ${(info.seoDesc)!'暂无'}</#if></p>
						<p class="detail"><a href="${request.contextPath}/news/input/${info.id}">[详细]</a></p>
					</div>
					</#if>
					</#list>
					</#if>
					
					
				</div>
			</div>
<#include "../common/footer.ftl">
  <script src="${request.contextPath}/resources/front/js/jquery.mThumbnailScroller.js"></script>
		<script src="${request.contextPath}/resources/front/js/rotation.js"></script>

	<script>
		(function($){
			$(window).load(function(){
				
				
				$("#content-4").mThumbnailScroller({
					theme:"hover-precise"
				});
				
			});
		})(jQuery);
	</script>

	<script type="text/javascript">
	$(".yx-rotaion").yx_rotaion({auto:true});
	</script>
</#escape>
