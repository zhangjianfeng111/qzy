<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>

<div class="group_buy">

    <div class="wrap">
    <#if infos?has_content>
			<#list  infos  as  product>
        <div class="group_buy_wr" style="height: 359px; padding-bottom: 0px; margin-bottom: 2px;">
            <div  class="pic">
                <img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" width="384" height="354">
            </div>
            <div class="group_buying">
               <a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}"> <h2>${(product.productName)!''}</h2></a>
                <div class="time">
                    <#if (product.mins)??>
						剩余： ${  (product.mins/(24*60))?int  }  天   ${  (product.mins/60)%24  } 时  ${  (product.mins)%60  } 分
						<#else>
						剩余：--
						</#if>
                </div>
                <div class="price">
                    <span>团购价 ￥${(product.productPrice)!0} /${(product.keyword)!''}</span>
                    <span>原价 ￥${(product.marketPrice)!0}</span>
                </div>
                <div class="peo_num">
                    团购人数： ${(product.amount)!0}人
                </div>
                <a class="join" href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}">
                    立即参团
                </a>
            </div>
            <div class="clear"></div>
        </div>
        </#list>
				</#if>
    </div>
    				
				
				
					<ul class="pagination clearfix">
					<#if page?has_content>
						<#assign pageUrl>
							<@yep.searchPageUrl request.requestUri 'pageNo=#' request.queryString/>
						</#assign>
						<#include "../common/pages.ftl">
					</#if>	
					
					</ul>
</div>

<#include "../../customer/common/footer.ftl">
</#escape>