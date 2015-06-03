<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
			<div class="section tuangou">
				<div class="tg-item carbonday">
					<a href="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}" class="tg-item-pic"><img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}" height="355" width="408"></a>
					<div class="tg-info">
						<p class="tg-item-title"><a href="#">${(info.productName)!''}</a></p>
						<p class="tg-item-time">剩余：
                       <p class="types"><span class="active" id="productAmount" >
                      	剩余 :
                      	<#if  ((info.dayNum)!0) gt 0 >
                      			${ ((info.dayNum)!0) }
                      	<#else>
                      		0
                      	</#if>	/份         </p>
						<p class="num">${(info.keyword)!''}</p>
						<p class="price">今日特惠价<span class="new">￥${(info.dayPrice)!''}</span><span class="yj">原价</span><span class="old">￥${(info.marketPrice)}</span></p>
						
						<a href="${request.contextPath}/cus/product/detail?id=${(info.productId)}" class="join hoverbt">立即尝鲜</a>
					</div>
					<img src="${request.contextPath}/resources/front/images/sqimg.png" class="sqimg"/>
				</div>
			</div>
			<!--
			<div class="section xq">
				<ul class="header">
					<li>商品详情</li>
				</ul>
				<div class="content">
					<p class="title">商品说明</p>
					<p>${(info.productDesc)!''}</p>
				</div>
			</div>
			-->
			
			<#include "../common/footer.ftl">
</#escape>