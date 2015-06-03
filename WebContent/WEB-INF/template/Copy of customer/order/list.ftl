<#escape x as x!"">
<#include "../common/header.ftl">

<#import "../../common/common.ftl" as yep>
<div class="section shopping-cart dd">
	<ul class="header clearfix">
		<li>&nbsp;</li>
		<li>名称/规格</li>
		<li>时间</li>
		<li>金额</li>
		<li>状态</li>
	</ul>
	<#if infos?has_content>
		<#list infos as info>
		<div class="item">
			<ul class="clearfix">
				<li class="cart-item-pic"><a href="#"><img src="${request.contextPath}/resources/admin/store/${(info.productImage)!''}" height="62" width="65"></a></li>
				<li class="lh20"><a href="#">${info.productNames}</a></li>
				<li><#if info.orderTime?has_content>${info.orderTime?string("yyyy-MM-dd HH:mm:ss")}</#if></li>
				<li class="price">￥${info.totalFee}</li>
				<li>
				
					<#if ((info.orderStatus)!'')=='un_audit'>
					未付款
					<#elseif  ((info.orderStatus)!'')=='pass'>
					已审核
					<#elseif  ((info.orderStatus)!'')=='wait_ship'>
					待发货
					<#elseif  ((info.orderStatus)!'')=='ship'>
					已发货
					<#elseif  ((info.orderStatus)!'')=='refund'>
					退货
					<#elseif  ((info.orderStatus)!'')=='canceled'>
					交易取消
					<#elseif  ((info.orderStatus)!'')=='canceled'>
					完结
					<#else>
					
					</#if>
				</li>
				<li class="pj-btn"><a href="${request.contextPath}/cus/order/detail?orderId=${info.orderId}">查看订单</a></li>
			</ul>
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
	</ul>
</div>
  <#include "../common/footer.ftl">
</#escape>			