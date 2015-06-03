<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
			<div class="section">
				<h1>确认订单</h1>
				<div class="ucenter-block clearfix">
					<div class="ucenter-leftblock ">
						<div class="tit">确认收货地址</div>
						<div class="modify-block">
								<input type="hidden" id="address" value="<#if default?has_content>${(default)!''}</#if>" />
							<p >
								<@yep.loadRegionName (default.state)!'' />
					<@yep.loadRegionName (default.city)!'' />
					<@yep.loadRegionName (default.district)!''  />
							</p>
						</div>
						
						<div class="modify-block">
							<p><#if default?has_content>${(default.address)!''}</#if></p>
						</div>
						<div class="modify-block">
							<p><#if default?has_content>${(default.name)!''} ${(default.mobile)!''}</#if></p>
						</div>
						<a href="${request.contextPath}/cus/info/userCenter" style="color:#c33;padding-left:20px;">选择其他地址</a>
					</div>
				</div>
			</div>

			<div class="section shopping-cart">
			<#if carts?has_content>
				<#list carts as cart>
					<div class="item">
						<ul class="clearfix">
							<li class="cart-item-pic"><a href="#"><img src="${request.contextPath}/resources/admin/store/${cart.productImage}" height="62" width="65"></a></li>
							<li><a href="#">${cart.productName}</a></li>
							<li>${cart.sukValue}</li>
							<li>￥${cart.productPrice}</li>
							<li class="num"><div class="counter">${cart.productNumber}</div></li>
							<li class="price">￥${cart.productPrice*cart.productNumber}</li>
						</ul>
					</div>
				</#list>
			</#if>
				<form id="saveForm"  action="${request.contextPath}/cus/order/confirm">
				<div class="fapiao-qrdd clearfix">
					<label>是否需要发票</label>

					<input type="radio"  checked  value="no" name="invoiceType"/>
					<span>不需要发票</span>

					<input type="radio" value="common" name="invoiceType"/>
					<span>个人</span>
					<!--
					<input type="text" placeholder="姓名"/>
					-->
					<input type="radio"  value="added" name="invoiceType"/>
					<span>公司</span>
					
					<input type="text"  name="invoiceTitle" placeholder="抬头"/>

					<div class="clr"></div>

					<label>备注</label>
					<textarea name="orderRemark"></textarea>
				</div>
				<div class="fukuan">
					<!--
					<input type="checkbox"  name="isBalance" value="1" />
					<span>使用余额</span>
					-->
					<span class="zhye">运费：￥ ${(postage)!'0' }</span>
					
					<span class="zhye">账户余额：￥ ${(userInfo.balance)!'0' }</span>
					<span id="totalPrice"  data-value="${((totalPrice)!0)-((userInfo.balance)!0) }">总计：￥ ${(totalPrice)!'0'}，实付款：￥
					<#if (((totalPrice)!0)-((userInfo.balance)!0)) gt 0>
						${((totalPrice)!0)-((userInfo.balance)!0) }
					<#else>
						${0 }
					</#if>	
					</span>
				</div>
				<a class="tj-btn"  href="javascript:void(0);" onclick="payForm()" > 提交订单</a>
				<div class="clr"></div>
				<form>
			</div>
			
	
<#include "../common/footer.ftl">
	 <script>
	 function payForm(){
	 var p = $("#address").val();
	 
	 if(p != ""){
	 var r=confirm("确定付款?")
  if (r==true){
  
  
 if( $("#totalPrice").attr("data-value") <= 0) {
 	 r=confirm("余额付款?")
 }
 if(! r) return ;
  
  $("#saveForm").submit();
    }else
    {
    return false;
    }
    }else{
    alert("收货地址不能为空！");
    return false;
    }
  
	 	
	 }
 </script>
</#escape>		