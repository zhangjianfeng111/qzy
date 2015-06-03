<#escape x as x!"">
<#include "../common/header.ftl">
<div class="content">
    <div class="con_box_01" id="booth">
            <div id="booths">
            <#if pc_hp?has_content>
	        	<#list pc_hp as info>
					<li><a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" alt="${info.advName}" width="1200" height="276" ></a></li>
				</#list>
	        </#if>
            </div>
        </div>
        <ul id="bootha">
        	<#if pc_hp?has_content>
	        <#list pc_hp as info>
            <li <#if info_index==0>class="on"</#if>></li>
            </#list>
	        </#if>
        </ul>
    <div class="con_box_02">
        <div class="left l">
            <div class="top">
                <a href="#">今日推荐</a>
            </div>
            <div class="shan_gou_picture l">
                <#if adv1?has_content>
                          <#list adv1 as info>
                          <#if info_index ==0>
					<a href="${info.advLinkAddress}"><img src="${request.contextPath}/resources/admin/store/${info.advImg}" class="item-pic"></a>
					</#if>
					</#list>
					</#if>
            </div>
            <div class="shan_gou_con r">
                    <ul>
                        <#if cateProducts2?has_content>
						<#list cateProducts2 as products> 
						<#if products?has_content>
						<#list products as product>
                        <li>
                            <a target="_blank" href="#">
                                <div class="pic l">
                                	<a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}">
									<img width="150" height="150" src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" class="item-pic"></a>
                                </div>
                                <div class="tit r">
                                    <h3><a href="${request.contextPath}/cus/product/detail?id=${product.productId}">${product.productName}<br></a></h3>
                                    <div class="price">￥<#if product.customerStatus?has_content && product.customerStatus==1>${product.productPrice}<#elseif product.isday?has_content && product.isday==1>${product.dayPrice}<#else>${product.preferentialPrice}</#if><span>￥${product.marketPrice}</span></div>
                                    <a href="${request.contextPath}/cus/product/detail?id=${product.productId}"><button class="btn">抢！<br></button></a>
                                </div>
                            </a>
                        </li>
                        </#list>
						</#if>
                        </#list>
						</#if>
                    </ul>
                </div>
        </div>
        <div class="right r">
            <div class="top">
                <a href="#">特惠套装</a>
            </div>
            <div class="brand">
                <img src="${request.contextPath}/resources/carbon/image/brand-01.png" width="330" height="175">
            </div>
            <div class="brand" style="margin-top: 3px;">
                <img src="${request.contextPath}/resources/carbon/image/brand-02.png" width="330" height="175">
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="series_list">
        <div class="series_box">
            <div class="series_info">
            <#if catePageLists?has_content>
			<#list catePageLists as cate>
			<#if cate_index==0>
                <div class="series_name name_yiwu_01">
                    <h2>${cate.cateName}</h2>
                </div>
            </#if>    
            </#list>
		    </#if>
		    
                <div class="brand_cata name_yiwu_02">
		    <#if catePageLists?has_content>
			<#list catePageLists as cate>
			<#if cate_index==0>
            <#if catePageList?has_content>
            <#list catePageList as info>
            <#if info.parentCateId==cate.cateId>
                    <a target="_blank" href="${request.contextPath}/cus/product/list1/p1?cateIds=${(info.cateCode)!''}">${info.cateName}</a>
            </#if>
            </#list>
            </#if>
            </#if>
            </#list>
            </#if>
                </div>
            </div>
            <div class="series_pic">
            	<#if adv2?has_content>
                          <#list adv2 as info>
                          <#if info_index ==0>
                			<a target="_blank" href="${info.advLinkAddress}">
								<img src="${request.contextPath}/resources/admin/store/${info.advImg}" width="247" height="373">
							</a>
						</#if>
					</#list>
					</#if>
				<div class="clear"></div>
            </div>
            <div class="pro_list">
                <ul>
                	<#if catePageLists?has_content>
					<#list catePageLists as cate>
					<#if cate_index==0>
					<#if Products0?has_content>
					<#list Products0 as product>
                    <li>
                        <a target="_blank" href="#">
                            <p class="pic">
                                <a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}" >
								<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" alt="${(product.productName)!''}" width="100" height="100"></a>
                            </p>
                            <h3>${product.productName}</h3>
                            <p class="price">￥<#if product.customerStatus?has_content && product.customerStatus==1>${product.productPrice}<#elseif product.isday?has_content && product.isday==1>${product.dayPrice}<#else>${product.preferentialPrice}</#if></p>
                        </a>
                    </li>
					</#list>
					</#if>
					</#if>
					</#list>
					</#if>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="series_box">
            <div class="series_info">
            <#if catePageLists?has_content>
			<#list catePageLists as cate>
			<#if cate_index==1>
                <div class="series_name name_canju_01">
                    <h2>${cate.cateName}</h2>
                </div>
            </#if>    
            </#list>
		    </#if>
		    
                <div class="brand_cata name_canju_02">
           	<#if catePageLists?has_content>
			<#list catePageLists as cate>
			<#if cate_index==1>
            <#if catePageList?has_content>
            <#list catePageList as info>
            <#if info.parentCateId==cate.cateId>
                    <a target="_blank" href="${request.contextPath}/cus/product/list1/p1?cateIds=${(info.cateCode)!''}">${info.cateName}</a>
            </#if>
            </#list>
            </#if>
            </#if>
            </#list>
            </#if>
                </div>
            </div>
                

           <div class="series_pic">
            	<#if adv3?has_content>
                	<#list adv3 as info>
                    	<#if info_index ==0>
                			<a target="_blank" href="${info.advLinkAddress}">
								<img src="${request.contextPath}/resources/admin/store/${info.advImg}" width="247" height="373">
							</a>
						</#if>
					</#list>
				</#if>
            </div>
            <div class="pro_list">
                <ul>
                    <#if catePageLists?has_content>
					<#list catePageLists as cate>
					<#if cate_index==1>
					<#if Products1?has_content>
					<#list Products1 as product>
                    <li>
                        <a target="_blank" href="#">
                            <p class="pic">
                                <a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}" >
								<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" alt="${(product.productName)!''}" width="100" height="100"></a>
                            </p>
                            <h3>${product.productName}</h3>
                            <p class="price">￥<#if product.customerStatus?has_content && product.customerStatus==1>${product.productPrice}<#elseif product.isday?has_content && product.isday==1>${product.dayPrice}<#else>${product.preferentialPrice}</#if></p>
                        </a>
                    </li>
					</#list>
					</#if>
					</#if>
					</#list>
					</#if>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="series_box">
            <div class="series_info">
               <#if catePageLists?has_content>
				<#list catePageLists as cate>
				<#if cate_index==2>
                <div class="series_name name_jiaju_01">
                    <h2>${cate.cateName}</h2>
                </div>
           		</#if>    
            	</#list>
		    	</#if>
                
                <div class="brand_cata name_jiaju_02">
               	<#if catePageLists?has_content>
				<#list catePageLists as cate>
				<#if cate_index==2>
            	<#if catePageList?has_content>
            	<#list catePageList as info>
            	<#if info.parentCateId==cate.cateId>
                    <a target="_blank" href="${request.contextPath}/cus/product/list1/p1?cateIds=${(info.cateCode)!''}">${info.cateName}</a>
            	</#if>
            	</#list>
            	</#if>
            	</#if>
            	</#list>
            	</#if>
                </div>
            </div>
            <div class="series_pic">
            	<#if adv4?has_content>
                	<#list adv4 as info>
                    	<#if info_index ==0>
                			<a target="_blank" href="${info.advLinkAddress}">
								<img src="${request.contextPath}/resources/admin/store/${info.advImg}" width="247" height="373">
							</a>
						</#if>
					</#list>
				</#if>
            </div>
            <div class="pro_list">
                <ul>
                   <#if catePageLists?has_content>
					<#list catePageLists as cate>
					<#if cate_index==2>
					<#if Products2?has_content>
					<#list Products2 as product>
                    <li>
                        <a target="_blank" href="#">
                            <p class="pic">
                                <a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}" >
								<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" alt="${(product.productName)!''}" width="100" height="100"></a>
                            </p>
                            <h3>${product.productName}</h3>
                            <p class="price">￥<#if product.customerStatus?has_content && product.customerStatus==1>${product.productPrice}<#elseif product.isday?has_content && product.isday==1>${product.dayPrice}<#else>${product.preferentialPrice}</#if></p>
                        </a>
                    </li>
					</#list>
					</#if>
					</#if>
					</#list>
					</#if>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="series_box">
            <div class="series_info">
              <#if catePageLists?has_content>
				<#list catePageLists as cate>
				<#if cate_index==3>
                <div class="series_name name_huli_01">
                    <h2>${cate.cateName}</h2>
                </div>
           		</#if>    
            	</#list>
		    	</#if>
                <div class="brand_cata name_huli_02">
                <#if catePageLists?has_content>
				<#list catePageLists as cate>
				<#if cate_index==3>
            	<#if catePageList?has_content>
            	<#list catePageList as info>
            	<#if info.parentCateId==cate.cateId>
                    <a target="_blank" href="${request.contextPath}/cus/product/list1/p1?cateIds=${(info.cateCode)!''}">${info.cateName}</a>
            	</#if>
            	</#list>
            	</#if>
            	</#if>
            	</#list>
            	</#if>
                </div>
            </div>
           <div class="series_pic">
            	<#if adv5?has_content>
                	<#list adv5 as info>
                    	<#if info_index ==0>
                			<a target="_blank" href="${info.advLinkAddress}">
								<img src="${request.contextPath}/resources/admin/store/${info.advImg}" width="247" height="373">
							</a>
						</#if>
					</#list>
				</#if>
            </div>
            <div class="pro_list">
                <ul>
                	<#if catePageLists?has_content>
					<#list catePageLists as cate>
					<#if cate_index==3>
					<#if Products3?has_content>
					<#list Products3 as product>
                    <li>
                        <a target="_blank" href="#">
                            <p class="pic">
                                <a href="${request.contextPath}/cus/product/detail?id=${(product.productId)!''}" >
								<img src="${request.contextPath}/resources/admin/store/${(product.imageNum)!''}" alt="${(product.productName)!''}" width="100" height="100"></a>
                            </p>
                            <h3>${product.productName}</h3>
                            <p class="price">￥<#if product.customerStatus?has_content && product.customerStatus==1>${product.productPrice}<#elseif product.isday?has_content && product.isday==1>${product.dayPrice}<#else>${product.preferentialPrice}</#if></p>
                        </a>
                    </li>
					</#list>
					</#if>
					</#if>
					</#list>
					</#if>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<#include "../common/footer.ftl">
  <script src="${request.contextPath}/resources/front/js/jquery.mThumbnailScroller.js"></script>
		<script src="${request.contextPath}/resources/front/js/rotation.js"></script>
	<script>
		(function($){
			$(window).load(function(){
				
				
				$("#content-4").mThumbnailScroller({
					theme:"hover-precise"
				});
				
			});
		})(jQuery);
	</script>

	<script type="text/javascript">
	$(".yx-rotaion").yx_rotaion({auto:true});
	</script>
</#escape>
