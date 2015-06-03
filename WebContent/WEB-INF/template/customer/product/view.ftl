<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<script src="${request.contextPath}/resources/front/js/sweet-alert.js"></script>
<link rel="stylesheet" href="${request.contextPath}/resources/front/css/sweet-alert.css">
<script type="text/javascript" src="${request.contextPath}/resources/front/js/js.js"></script>
<script>
    $(document).ready(function(){
        $("#details_wrap_menu li").click(function(){
            $(this).addClass("on");
            $(this).siblings().removeClass("on");
            var $index = $(this).index();
            $("#details_wrap_box > div").eq($index).show().siblings().hide();
        });
    });
</script>
<div class="details">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 >  ${(info.productName)!''}
        </div>
        <div class="details_wr">
            <div  class="pic">
                <img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}" width="365px" height="380px">
            </div>
            <div class="details_buying">
                <h2>${(info.productName)!''} </h2>
                <div class="row">
                    <label>市场价</label>
                    <span class="market_price">￥${(info.marketPrice)!'0'}</span>
                </div>
                <div class="row">
                    <label>优惠价</label>
                    <span class="discount">￥
                    <#if info.price?has_content> ${info.price}</span><span>节省${info.marketPrice-info.price}元</span>
                    <#else>${(info.preferentialPrice)!'0'}</span><span>节省${info.marketPrice-info.preferentialPrice}元</span></#if>
                </div>
                <div class="row">
                    <label>评价</label>
                    <span>
                        <img src="${request.contextPath}/resources/carbon/image/xingxing.fw.png">
                    </span>
                </div>
                <div class="row">
                    <label>规格</label>
                    <span>1箱</span>
                </div>
                <div class="row">
                    <label>数量</label>
                    <a id="J_Product_N_"><span class="mark">-</span></a>
                    <span class="number" id="count">1</span>
                    <a id="J_Product_N_add"><span class="mark">+</span></a>
                </div>
                
                <input type="hidden" id="addCartSkuId"  value="${(sku.skuId)!''}" />
				<input type="hidden" id="addCartProductId"  value="${(info.productId)!''}" />
                
                <#if Session['user']?has_content>
				<a href="#" 
					data-url="${request.contextPath}/cus/cart/addCart" data-value="${user.mobile}"
				class="join_car J_add_cart">加入购物车</a>
				<#else>
					<#if info.stock?has_content && info.sellCount?has_content && ((info.sellCount) >= info.stock)>
					<a class="join_car" style="background:#aaa;">已售罄</a>
					<#else>
					<a href="${request.contextPath}/cus/info/login?backUrl=${request.requestUri}?${request.queryString}" 
					class="join_car">加入购物车</a>
					</#if>
				</#if>
            </div>
            <div class="clear"></div>
        </div>
        <!-- 显示商品的搭配 -->
        <div class="details_wrap">
            <#if tieproducts??>
            	<input type="hidden" id="addCartTieId"  value="${(tieId)!''}" />
				 <#if Session['user']?has_content>
					<a href="#" 
						data-url="${request.contextPath}/cus/cart/addTieCart" data-value="${user.mobile}"
					class="join_car J_add_tie_cart">加入购物车</a>
					<#else>
						<#if info.stock?has_content && info.sellCount?has_content && ((info.sellCount) >= info.stock)>
						<a class="join_car" style="background:#aaa;">已售罄</a>
						<#else>
						<a href="${request.contextPath}/cus/info/login?backUrl=${request.requestUri}?${request.queryString}" 
						class="join_car">加入购物车</a>
						</#if>
				</#if>
			
			  <div class="row">
                    <label>数量</label>
                    <a id="J_Product_N_"><span class="mark">-</span></a>
                    <span class="number" id="tiecount">1</span>
                    <a id="J_Product_N_add"><span class="mark">+</span></a>
               </div>
			
            </#if>
            
        	<#if tieproducts?has_content>
				<#list tieproducts as item>
					 <div style="float:left;">
					 	${item.productName}
					   <img src="${request.contextPath}/resources/admin/store/${(item.imageNum)!''}" width="100px" height="100px">
					 </div>
			    </#list>
			</#if>
			
			
        </div>
     
         
			
		 
         <!-- 显示商品的搭配 结束 -->
         
        <div class="details_wrap">
            <ul class="details_wrap_menu" id="details_wrap_menu">
                <li class="on">商品详情</li>
                <li>评价详情</li>
            </ul>
            <div class="details_wrap_box" id="details_wrap_box">
                <div class="goods">
                    ${info.productDesc}
                </div>
                <div class="evaluation" style="display: none;">
                    评价
                </div>
            </div>
        </div>
        <div class="recommend">
        	<h3>商品推荐</h3>
        	<div class="recommend_img">
        		
        	</div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<#include "../common/footer.ftl">
</#escape>