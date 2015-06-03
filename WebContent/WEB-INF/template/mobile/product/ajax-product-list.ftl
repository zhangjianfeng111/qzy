<#escape x as x!"">
<#if infos?has_content>
<#list infos as info>
<li>
 <a href="${request.contextPath}/mobile/product/view/${info.productId}">
   <div class="list-item">
       <div class="p-pic"><img src="${request.contextPath}/resources/admin/store/${info.imageNum}" alt="${info.productName}"/></div>
       <div class="d-con">
            <h3 class="d-tit clamp-2">${info.productName}</h3>
            <p class="d-spe">${info.minAmount}${info.productUnit}装</p>
        <div class="db-con">
            <h1 class="d-price ot">￥${info.preferentialPrice!0}</h1>
                <del>${info.marketPrice}</del> 
            <b data-sku-id="5417" class="cart"></b>
        </div>
       </div>
   </div>
</a>
</li>
</#list>
</#if>
</#escape>