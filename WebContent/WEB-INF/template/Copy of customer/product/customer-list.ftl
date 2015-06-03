<#escape x as x!"">
<#include "../common/header.ftl">

<#import "../../common/common.ftl" as yep>
			<div class="section tuangou">
			
			<#if infos?has_content>
			<#list  infos  as  product>
				<div class="tg-item">
					<a href="${request.contextPath}/cus/product/detail?id=${product.productId}" class="tg-item-pic">
					<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" height="355" width="408"></a>
					<div class="tg-info">
						<p class="tg-item-title"><a href="${request.contextPath}/cus/product/detail?id=${product.productId}">  ${(product.productName)!''}</a></p>
						<p class="tg-item-time  last_mins"   data-time="${(product.mins)!0}"  >
						<#if (product.mins)??>
						剩余： ${  (product.mins/(24*60))?int  }  天   ${  (product.mins/60)%24  } 时  ${  (product.mins)%60  } 分
						<#else>
							剩余：--
						</#if>
						</p>
						<p class="price">团购价<span class="new">￥${(product.productPrice)!0} /${(product.keyword)!''}</span><span class="yj">原价</span><span class="old">￥${(product.marketPrice)!0}</span></p>
						<p class="num">团购人数： ${(product.amount)!0}人</p>
						<a href="${request.contextPath}/cus/product/detail?id=${product.productId}" class="join hoverbt">立刻参团</a>
					</div>
				</div>
				</#list>
				</#if>
				
				
				<ul class="pagination clearfix">
					<#if page?has_content>
						<#assign pageUrl>
							<@yep.searchPageUrl request.requestUri 'pageNo=#' request.queryString/>
						</#assign>
						<#include "../common/pages.ftl">
					</#if>	
					<!--
						<li class="prev"><a href="">上一页</a></li>
						<li class="active"><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li class="next"><a href="">下一页</a></li>
						-->
					</ul>
			</div>
			
		  <#include "../../customer/common/footer.ftl">
</#escape>