<#escape x as x!"">
<#include "../common/header.ftl">

<#import "../../common/common.ftl" as yep>
<div class="personal">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 个人中心 > 我的订单
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
            <table class="order" border="0" style="width: 950px;margin: 0 auto;">
                <thead>
                <tr>
                    <th style="width: 130px;"></th>
                    <th style="width: 265px;">名称/规格</th>
                    <th style="width: 190px;">下单时间</th>
                    <th style="width: 130px;">金额</th>
                    <th style="width: 80px;">状态</th>
                    <th style="width: 155px;"></th>
                    <th style="width: 155px;"></th>
                </tr>
                </thead>
                <#if infos?has_content>
				<#list infos as info>
 
                <tbody>
                <tr>
                    <td class="img">
                        <img src="${request.contextPath}/resources/admin/store/${(info.productImage)!''}" width="100" height="100">
                    </td>
                    <td>
                        ${info.productNames}    
                    </td>
                    <td>
                        <#if info.orderTime?has_content>${info.orderTime?string("yyyy-MM-dd HH:mm:ss")}</#if>
                    </td>
                    <td class="price">
                             ￥${info.totalFee}
                    </td>
                    <td>
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
                    </td>
                    <td class="look">
                        <a href="${request.contextPath}/cus/order/detail?orderId=${info.orderId}">查看订单</a>
                    </td>
                    
                    <#if ((info.orderStatus)!'')=='un_audit'||((info.orderStatus)!'')=='pass'||((info.orderStatus)!'')=='wait_ship'>
                    <td class="look">
                        <a href="${request.contextPath}/cus/order/refund?orderId=${info.orderId}">退货</a>
                    </td>
                    <#else>
                    <td class="look">
                    </td>
                    </#if>
                    
                </tr>
                </tbody>
                 </#list>
                 </#if>
                 
               
            </table>
            <div class="pages">
                <div class="page-wrap">
                    <#if page?has_content>
						<#assign pageUrl>
							<@yep.searchPageUrl request.requestUri 'pageNo=#' request.queryString/>
						</#assign>
						<#include "../common/pages.ftl">
					</#if>	
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>


  <#include "../common/footer.ftl">
</#escape>			