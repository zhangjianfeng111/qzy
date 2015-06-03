
<#escape x as x!"">
<#include "../common/header.ftl">
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
				<div class="content" id="art">
					<h3>${(info.title)!'暂无'}</h3>
					<div class="subtit">
						<span> <#if info.updateTime?has_content>${info.updateTime?string("yyyy-MM-dd HH:mm:ss")}</#if></span>
						<span> 作者：杭州味道网</span>
					</div>
					<div class="article">
						
					<p>${(info.content)!'暂无'}</p>

					</div>
				</div>
			</div>
			<script>
			newestShow("${request.contextPath}/cus/product/histroyList");
 </script>
<#include "../common/footer.ftl">
</#escape>