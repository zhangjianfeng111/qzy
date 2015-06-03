<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>

			<div class="section lplh-banner hoverimg">
				<!--
				<#if topCategories?has_content>
				<#list  topCategories as category>
				<a href="${request.contextPath}/cus/product/list/p1?cateIds=${category.cateCode}" class="lplh-banner-pic">
					<img src="${request.contextPath}/resources/admin/store/<@yep.findFirstProductImage (category.cateCode)!'' />"  alt="${category.cateName}"  height="190" width="190">
				</a>
				</#list>
				</#if>
				-->
				<!--
					<#if lastProducts?has_content>
				<#list  lastProducts as product>
				<a href="${request.contextPath}/cus/product/detail?id=${product.productId}" class="lplh-banner-pic">
					<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}"  height="188" width="188" />
				</a>
				</#list>
				</#if>
				-->

				<a href="${request.contextPath}/cus/product/list/p1?cateIds=jksg" class="lplh-banner-pic">
					<img src="${request.contextPath}/resources/admin/store/150203121018top1.jpg"  height="188" width="188" />
				</a>
				<a href="${request.contextPath}/cus/product/list/p1?cateIds=twsg" class="lplh-banner-pic">
					<img src="${request.contextPath}/resources/admin/store/150203121405top2.jpg"  height="188" width="188" />
				</a>
				<a href="${request.contextPath}/cus/product/customer/list/p1.html" class="lplh-banner-pic">
					<img src="${request.contextPath}/resources/admin/store/150203121838top3.jpg"  height="188" width="188" />
				</a>
				<a href="${request.contextPath}/cus/product/list/p1?cateIds=lplh" class="lplh-banner-pic">
					<img src="${request.contextPath}/resources/admin/store/150203123427top4.jpg"  height="188" width="188" />
				</a>
				<a href="${request.contextPath}/cus/product/day" class="lplh-banner-pic">
					<img src="${request.contextPath}/resources/admin/store/150203123954top5.jpg"  height="188" width="188" />
				</a>
			</div>
			<div class="section lplh-search">
				<div class="lplh-search-leftpart">
					<p class="header"><span class="down-arrow"></span>水果</p>
					<div class="lplh-search-list">
					<#if info?has_content>
                      <#list info as proProductCategory>
                      	<#if proProductCategory.cateCode !='sjzx'>
						<p <#if searchBean.cateIds?has_content && searchBean.cateIds==proProductCategory.cateCode>class="hot"</#if>><a href="${request.contextPath}/cus/product/list/p1?cateIds=${proProductCategory.cateCode}">${proProductCategory.cateName}</a></p>
						</#if>
						</#list>
						</#if>
					</div>
				</div>
				<div class="lplh-search-wrap">
					<ul class="lplh-search-header">
						<li class="px"><span>排序：</span>
							<input type="hidden"  id="cateIds"  value="${(searchBean.cateIds)!''}" />
							<select  name="sort"  id="sort">
							<option  value="preferential_price.desc" data-url=""    <#if ((searchBean.sort)!'')=='preferential_price.desc' >  selected </#if> >价格高到低</option>
							<option value="preferential_price.asc"  <#if ((searchBean.sort)!'')=='preferential_price.asc' >  selected </#if> >价格低到高</option>
							</select>
						</li>
						<li class="jg"><span>价格：</span><input name="startPrice" id="startPrice"  value="${(searchBean.startPrice)!''}"  type="text"> 
						- <input type="text" name="endPrice" id="endPrice" value="${(searchBean.endPrice)!''}" ></li>
						<li style="text-align:left;">
						<!--
						<input type="checkbox" value="1" id="customerStatus" name="customerStatus" >限时优惠
						
						<input type="checkbox" name="isNew" id="isNew"  value="1" >新品上市
						-->
						<a href="javascript:go();" class="sure">确定</a>
						</li>
						<li class="page">
						
						<#if page?has_content>
						<#assign pageUrl>
							<@yep.searchPageUrl request.requestUri 'pageNo=#' request.queryString/>
						</#assign>
						<span>  ${page.page} /${page.totalPages}</span>
							<#if page.page==1>
						   	 <a href="javascript:void();">上一页</a>
						   	<#else>
						   <a href="${pageUrl?replace("%23", (page.page-1)?string)}">上一页</a>
						   	</#if>
						
							<#if page.page==page.totalPages>
						   	 <a href="javascript:void();">下一页</a>
						   	<#else>
						   <a href="${pageUrl?replace("%23", (page.page+1)?string)}">下一页</a>
						   	</#if>
					   	</#if>
						</li>
					</ul>
					<div class="lplh-search-items hoverimg">
					 <#if infos?has_content>
                      <#list infos as proProduct>
						<div class="lplh-search-item">
							<a href="${request.contextPath}/cus/product/detail?id=${proProduct.productId}" class="item-pic"><img src="${request.contextPath}/resources/admin/store/${proProduct.imageNum}" alt="170x170" width="170px" height="170px"></a>
							<p class="title"><#if proProduct.productName?length gt 13>${proProduct.productName?substring(0,13)}...<#else>${proProduct.productName}</#if></p>
							<p class="price"><span class="old">￥${proProduct.marketPrice}</span><span class="new">￥<#if proProduct.isday?has_content && proProduct.isday==1>${proProduct.dayPrice}<#else>${proProduct.preferentialPrice}</#if></span>/${(proProduct.keyword)!''} </p>
						</div>
						</#list>
						</#if>
					<ul class="pagination clearfix">
					<#if page?has_content>
									<#include "../common/pages.ftl">
						</#if>
					<!--				
						<li class="prev"><a href="">上一页</a></li>
						<li class="active"><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li class="next"><a href="">下一页</a></li>
						-->
					</ul>
				</div>
			</div>
  <#include "../../customer/common/footer.ftl">
</#escape>