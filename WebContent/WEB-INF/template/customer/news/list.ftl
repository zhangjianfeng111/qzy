<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<div class="section spxq-body">
				<div class="rightpart">
					<div class="tj">
						<p class="tj-header">为您推荐</p>
						<#if lastProducts?has_content>
                          <#list lastProducts as product>
						<div class="tj-item">
							<a href="${request.contextPath}/cus/product/detail?id=${product.productId}" class="tj-item-pic"><img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" width="85"></a>
							<p class="tj-item-title"><a href="#">${product.productName}</a></p>
							<p class="tj-item-price"> ${product.preferentialPrice}/${product.priceUnit}</p>
						</div>
						</#list>
                         </#if>
						
					</div>
					<div class="tj" id="historyDiv">
					
					</div>
				</div>
				<div class="content" id="art-list">
					<ul class="list-ar">
					 <#if infos?has_content>
                          <#list infos as info>
						<li class="clearfix">
							<a href="${request.contextPath}/news/input/${info.id}">
								<img src="${request.contextPath}/resources/admin/store/${(info.imageLogo)!''}" />
								<h3>${(info.title)!'暂无'}</h3>
								<p><#if (info.seoDesc?length > 90)>${info.seoDesc[0..90]}...<#else> ${(info.seoDesc)!'暂无'}</#if></p>
							</a>
						</li>
						</#list>
                            </#if>						
					</ul>

					<ul class="pagination clearfix">
						<#if page?has_content>
						<#assign pageUrl>
							<@yep.searchPageUrl request.requestUri 'pageNo=#' request.queryString/>
						</#assign>
						<#include "../common/pages.ftl">
					</#if>
					</ul>
				</div>
			</div>
			<script>
			newestShow("${request.contextPath}/cus/product/histroyList");
 </script>
<#include "../../customer/common/footer.ftl">
</#escape>