<#escape x as x!"">

<p class="tj-header">最近浏览</p>

		<#if list?has_content>
		<#list list as info>
						<div class="tj-item">
							<a href="${request.contextPath}/cus/product/detail?id=${(info.productId)!''}" class="tj-item-pic">
								<img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}" height="84" width="85">
								</a>
							<p class="tj-item-title"><a href="${request.contextPath}/cus/product/detail?id=${(info.productId)!''}"> ${(info.productName)!''}</a></p>
							<p class="tj-item-price">￥${(info.preferentialPrice)!''}/${(info.priceUnit)!''}</p>
						</div>
		</#list>
		</#if>					
					
</#escape>