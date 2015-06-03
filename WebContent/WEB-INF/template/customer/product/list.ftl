<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<div class="personal">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 商品分类
        </div>
        <div class="personal_list">
            <ul class="ul_one">
            	<li>
            	<#if catePageLists?has_content>
				<#list catePageLists as cate> 
                	${cate.cateName}
                <#if catePageList?has_content>
               	<#list catePageList as info>
                <#if info.parentCateId==cate.cateId>
                <ul class="ul_two">
               	<li <#if request.queryString?has_content && request.queryString?index_of(info.cateCode) gt -1>class="action"</#if>>
                	<a href="${request.contextPath}/cus/product/list1/p1?cateIds=${(info.cateCode)!''}">${info.cateName}</a>
                </li>
                </ul>
                </#if>
                </#list>
				</#if>
                </#list>
				</#if>
				<li>
            </ul>
        </div>
        <div class="personal_wrap">
            <div class="search_box">
                <div class="sorting">
                     <li class="px"><span>排序：</span>
							<input type="hidden"  id="cateIds"  value="${(searchBean.cateIds)!''}" />
							<select  name="sort"  id="sort">
							<option  value="preferential_price.desc" data-url=""    <#if ((searchBean.sort)!'')=='preferential_price.desc' >  selected </#if> >价格高到低</option>
							<option value="preferential_price.asc"  <#if ((searchBean.sort)!'')=='preferential_price.asc' >  selected </#if> >价格低到高</option>
							</select>
						</li>
                </div>
                
                <div class="screening">
                    价格
                    <input name="startPrice" id="startPrice"  value="${(searchBean.startPrice)!''}"  type="text"> 
						- <input type="text" name="endPrice" id="endPrice" value="${(searchBean.endPrice)!''}" >
                    <input type="button" onclick="go();" value="确定">
                </div>
                <div class="clear"></div>
            </div>
            <div class="list_wr">
            	<#if infos?has_content>
						<#list infos as product>
                <div class="list_box">
                	<a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}" >
                    <img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" width="100px" height="100px">
                    <p>${product.productName}</p>
                    <p class="price">￥<#if product.customerStatus?has_content && product.customerStatus==1>${product.productPrice}<#elseif product.isday?has_content && product.isday==1>${product.dayPrice}<#else>${product.preferentialPrice}</#if></p>
                </div>
                </#list>
				</#if>

                <div class="clear"></div>
            </div>

			
            <div class="pages">
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
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
			
  <#include "../../customer/common/footer.ftl">
</#escape>