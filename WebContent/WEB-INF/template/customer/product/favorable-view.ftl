<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>

<div class="group_buy">

    <div class="wrap">
        <div class="group_buy_wr" >
            <div  class="pic">
                <img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}" width="384" height="354">
            </div>
            <div class="group_buying">
               <a href="${request.contextPath}/cus/info/detail?id=${(info.productId)!''}"> <h2>${(info.productName)!''}</h2></a>
                <div class="time">
                    剩余 :
                      	<#if  ((info.dayNum)!0) gt 0 >
                      			${ ((info.dayNum)!0) }
                      	<#else>
                      		0
                      	</#if>	份         </p>
                </div>
                <div class="price">
                    <span>今日特惠价 ￥${(info.infoPrice)!0} /${(info.keyword)!''}</span>
                    <span>原价 ￥${(info.marketPrice)!0}</span>
                </div>
                <div class="peo_num">
                    
                </div>
                <a class="join" href="${request.contextPath}/cus/product/detail?id=${(info.productId)!''}">
                    立即抢购
                </a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    				
				
</div>

<#include "../../customer/common/footer.ftl">
</#escape>