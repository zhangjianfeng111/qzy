<#escape x as x!"">
<#include "../common/header.ftl">

<#import "../../common/common.ftl" as yep>
<div class="personal">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 个人中心 > 订单详情
        </div>
        <div class="personal_list">
            <div class="icon">
                <img src="${request.contextPath}/resources/carbon/image/logo_02.png" width="184" height="58">
            </div>
            <div class="account_manage">
                账号管理
            </div>
            <div class="manage_list">
                <ul>
                    <li>
                        <a href="${request.contextPath}/cus/order/list/p1.html">我的订单</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/userCenter">账户余额</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/addressList">收货地址管理</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/modifyPwd/input">账户安全</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/redpacket/list/p1?cusId=${Session["user"].id}">我的红包</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="personal_wrap">
        
            <h1>订单详情</h1>
            <div class="order-infor">
                <p>订单编号：${order.orderCode}</p>
                <#if order.payTime?? > 
             	   <p>支付宝交易号：${order.sellerRemarkStatus}</p>
                </#if>
                <#if order.orderTime?? > 
                	<p>下单时间：${order.orderTime?string("yyyyMMdd HH:mm:ss")}</p>
                </#if>
                <#if order.payTime?? > 
                	<p>付款时间：${order.payTime?string("yyyyMMdd HH:mm:ss")}</p>
                </#if>
                <p>收货地址： <@yep.loadRegionName (order.receiverState)!'' />
					          <@yep.loadRegionName (order.receiverCity)!'' />
					          <@yep.loadRegionName (order.receiverDistrict)!''  />
					          ${order.receiverAddress} ${order.receiverName}，${order.receiverTel}
		        </p>
		      </div>
		 </div> 
		 <div class="personal_wrap">    
		      <h1>发票信息</h1>
		      <div class="order-infor">
                	<p>发票抬头：${order.invoiceTitle}</p>
		          	<p>备注:${order.orderRemark}</p>
		       </div> 
		 </div>
		 <div class="personal_wrap">        
		       <h1>付款信息</h1>
		       <div class="order-infor">   
		           <p>实际付款：￥  ${order.totalFee} </p>
		           <p>状态
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
		        
		        <table class="order-details" border="0" style="width: 800px;margin-left: 28px;">
	                <thead>
	                <tr>
	                
	                    <th  >宝贝</th>
	                    <th  >名称</th>
	                    <th  >单价（元）</th>
	                    <th  >数量</th>
	                 
	                    <th  >宝贝总价（元）</th>
	                 
	                </tr>
	                </thead>
	                <tbody>
	              	  <#if products?has_content>
         				 <#list products as product>
		                <tr>
		                    <td>
		                        <img src="" width="50px" height="50px">
		                        <span></span>
		                    </td>
		                    <td>${product.productName}</td>
		                    <td>￥${product.productPrice}</td>
		                    <td>${product.productNumber}</td>
		                    
		                    <td >￥${product.productPrice*product.productNumber}</td>
		                </tr>
	                 	</#list>
	                 </#if>
	                </tbody>
           	 	</table>
		          
                <div class="clear"></div>
            </div>
         </div>
         <div class="personal_wrap">     
          	<h1>物流信息</h1>
            <div class="order-infor">
                
                <p>物流单号： <#if order.shipNo?has_content>${order.shipNo}<#else>暂无</#if></p> 
                
                <p>运费：  ${(order.shipFee)!0}</p>
		      </div>
		</div>          
            
           
        </div>
        <div class="clear"></div>
    </div>
</div>


  <#include "../common/footer.ftl">
</#escape>			