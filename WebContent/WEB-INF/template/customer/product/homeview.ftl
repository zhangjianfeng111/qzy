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
        <input type="hidden" id="addCartSkuId"  value="${(sku.skuId)!''}" />
		<input type="hidden" id="addCartProductId"  value="${(info.productId)!''}" />
        <div class="details_wr">
            <div  class="pic">
                <img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!''}" width="365px" height="380px">
            </div>
            <div class="details_buying">
                <h2>${(info.productName)!''} </h2>
                <div class="row">
                    <label>初始价格</label>
                    <span class="discount">￥${(info.homePrice)!'0'}</span>
                </div>
                <div class="row">
                    <label>每平方米单价</label>
                    <span class="discount">￥${(info.areaPrice)!'0'}</span>
                    <a id="J_Product_N_"><span class="mark">-</span></a>
                    <span class="number" id="count">1</span>
                    <a id="J_Product_N_add"><span class="mark">+</span></a>平方米
                </div>
                <div class="row">
                    <label>每天单价</label>
                    <span class="discount">￥${(info.everydayPrice)!'0'}</span>
                    <a id="J_home_N_"><span class="mark">-</span></a>
                    <span class="number" id="daycount">1</span>
                    <a id="J_home_N_add"><span class="mark">+</span></a>天
                </div>
                <#if Session['user']?has_content>
				<a href="#" data-url="${request.contextPath}/cus/cart/addToCart"  class="join_car J_add_cart">确定</a>
				<#else>
					<#if info.stock?has_content && info.sellCount?has_content && ((info.sellCount) >= info.stock)>
					<a class="join_car" style="background:#aaa;">已售罄</a>
					<#else>
					<a href="${request.contextPath}/cus/info/login?backUrl=${request.requestUri}?${request.queryString}" 
					class="join_car">确定</a>
					</#if>
				</#if>
            </div>
            <div class="clear"></div>
        </div>
        
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
<script>
function addToCart(id){
sweetAlert();
			$.ajax({
				type: "GET",
				url: "${request.contextPath}/cus/cart/addToCart/?productid="+id,
				dataType: "json",
				success: function( data ){
				},
			});
		}
</script>
<#include "../common/footer.ftl">
</#escape>