<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
			<div class="section">
				<h1>订单详情</h1>
				<div class="ucenter-block pd20">
					
					<div class="ddxq-b clearfix">
						<label>编号</label>
						<p>：${order.orderCode}</p>
					</div>
					<div class="ddxq-b clearfix">
						<label>收货地址</label>
						<p>
							<@yep.loadRegionName (order.receiverState)!'' />
					<@yep.loadRegionName (order.receiverCity)!'' />
					<@yep.loadRegionName (order.receiverDistrict)!''  />
						${order.receiverAddress} ${order.receiverName}，${order.receiverTel}</p>
					</div>
					<div class="ddxq-b clearfix">
						<label>发票信息</label>
						<p>发票抬头：${order.invoiceTitle}</p>
					</div>
					<div class="ddxq-b clearfix">
						<label>备注</label>
						<p>${order.orderRemark}</p>
					</div>
					<div class="ddxq-b clearfix">
						<label>付款信息</label>
						<p>实际付款：￥
								<!-- ${order.payment} -->
								${order.totalFee}
						
						</p>
					</div>
					<div class="ddxq-b clearfix">
						<label>状态</label>
						<p>
							<#if ((order.orderStatus)!'')=='un_audit'>
								未付款
								<#elseif  ((order.orderStatus)!'')=='pass'>
								已审核
								<#elseif  ((order.orderStatus)!'')=='wait_ship'>
								待发货
								<#elseif  ((order.orderStatus)!'')=='ship'>
								已发货
								<#elseif  ((order.orderStatus)!'')=='refund'>
								退货
								<#elseif  ((order.orderStatus)!'')=='canceled'>
								交易取消
								<#elseif  ((order.orderStatus)!'')=='canceled'>
								完结
								<#else>
									</#if>
						</p>
					</div>
				</div>
			</div>
			<div class="section">
				<h1>申通物流单号</h1>
				<div class="ucenter-block pd20">
					<div class="ddxq-b clearfix">
					
						<p><#if order.shipNo?has_content>${order.shipNo}<#else>暂无</#if></p>
						
						<a href="http://www.sto.cn/" style="color:#c33;">物流查询>></a>
						
					</div>
				</div>
			</div>
			<h2>购买商品</h2>
			<div class="section shopping-cart">
				<#if products?has_content>
					<#list products as product>
						<div class="item">
							<ul class="clearfix">
								<li class="cart-item-pic"><a href="#"><img src="${request.contextPath}/resources/admin/store/${product.productImage}" height="62" width="65"></a></li>
								<li><a href="#">${product.productName}</a></li>
								<li>${product.sukValue}</li>
								<li>￥${product.productPrice}×${product.productNumber}</li>
								<li class="price">￥${((product.productPrice)!0)*((product.productNumber)!0)}</li>
								
								<#if (  ((order.orderStatus)!'')=='ship' ||  ((order.orderStatus)!'')=='canceled' ) &&  ((product.orderStatus)!'' ) !='comment'> 
								<li class="pj">
									<form id="saveForm_${product.orderProductId}">
									<input type="hidden" name="productId"  value="${product.productId}" />
									<input type="hidden" name="orderId"  value="${product.orderId}" />
									<input type="hidden"   class="starValue"  name="lcommentEvel">
									<br/>
									<div class="star-wrapper clearfix">
								        <a href="javascript:;"></a>
								        <a href="javascript:;"></a>
								        <a href="javascript:;"></a>
								        <a href="javascript:;"></a>
								        <a href="javascript:;"></a>
								    </div>
								    <p class="star-wrapper-p"></p>
								    	
									<textarea name="commentDesc"></textarea>
									</form>
								</li>
								<li class="pj-btn"><a href="javascript:comment('${product.orderProductId}')">评价</a></li>
								<#elseif  ((order.orderStatus)!'')=='ship' ||  ((order.orderStatus)!'')=='canceled'>
									<#if (product.productId)?? && (product.orderId)?? >
											
										<li class="pj ed"><span class="stars-bg"> <span
												class="star-<@yep.loadLcommentEvel product.productId product.orderId />"></span>
										</span>
											<p><@yep.loadCommentDesc product.productId product.orderId /></p></li>
										<li class="pj-btn">已评价</li>
									</#if>
								</#if>
							</ul>
						</div>
					</#list>
				</#if>
				
				运费:   ${(order.shipFee)!0}
				<#if ((order.orderStatus)!'')=='un_audit' || ((order.orderStatus)!'')=='pass' >
						<a class="tj-btn"  href="${request.contextPath}/cus/order/confirmOrder?orderId=${(order.orderId)!1}&isBalance=1" >去支付</a>
				</#if>
				<p class="zonge">付款金额：￥  <!-- ${order.payment}  -->  ${order.totalFee}</p>
					
							
				<div class="clr"></div>
					
			</div>
<#include "../common/footer.ftl">
<script src="${request.contextPath}/resources/front/js/js.js"></script>
<script src="${request.contextPath}/resources/front/myJs/comment.js"></script>
<script>
function comment(itemId){
	saveForm("saveForm_"+itemId, "${request.contextPath}/cus/comment/addComment","refresh");
}
</script>
</#escape>		