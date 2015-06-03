<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<form id="saveForm" action="${request.contextPath}/cus/cart/account">
<div class="shopping_car">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 购物车
        </div>
        <div class="car_wr">
            <div class="hello">
                Hi,<span>${Session['user'].mobile}</span>,欢迎来到您的购物车
            </div>
            <table class="car_table">
                <thead>
                <tr>
                    <th width="50px">
                        <input type="hidden" type="checkbox">
                    </th>
                    <th width="370px">商品</th>
                    <th width="220px">单价</th>
                    <th width="110px">数量</th>
                    <th width="180px">小计</th>
                    <th width="160px"></th>
                </tr>
                </thead>
                <tbody>
                <#if infos?has_content>
			  	<#list infos as info>
                <tr>
                	<input type="hidden" name="shopCartIds" value="${info.shopCart.cartId}"/>
                    <td>
                        <input type="checkbox" name="shopCartIds" value="${info.shopCart.cartId}">
                    </td>
                    <td class="pic">
                        <img src="${request.contextPath}/resources/admin/store/${(info.product.imageNum)!''}" width="62" height="62">
                        <span>${(info.shopCart.productName)!''}</span>
                    </td>
                    <td id="price_${info.shopCart.cartId}" data-price="${(info.shopCart.productPrice)!''}">${(info.shopCart.productPrice)!''}</td>
                    
                    <input type="hidden" data-url="${request.contextPath}/cus/cart/addUp" data-id="${info.shopCart.cartId}" name="shopCartNums" id="amount_${info.shopCart.cartId}" value="${(info.shopCart.productNumber)!0}"/>
                    <td class="J_product_num">${(info.shopCart.productNumber)!0}</td>
                    <td >￥<span id="wholePrice_${info.shopCart.cartId}" class="shopItemPrice">
								 ${((info.shopCart.productPrice)!0)   *  ((info.shopCart.productNumber)!0) }
								</span></td>
                    <td>
                        <input type="button" value="删除" class="del_item" data-value='${request.contextPath}/cus/cart/del?cartId=${info.shopCart.cartId}'>
                    </td>
                </tr>
                </#list>
				</#if>
                </tbody>
            </table>
            <div class="car_ft">
                <div class="car_ft_l">
                    <ul>
                        <li>
                            <input type="checkbox"  onclick="selectAll()" id="selectall" style="vertical-align: middle;">全选
                        </li>
                        <li>
                            <a href="#" onclick="del()">删除勾选商品</a>
                        </li>
                        <li>
                            <a href="#" onclick="delAll()">清空购物车</a>
                        </li>
                    </ul>
                    <input type="button" onclick="location.href='${request.contextPath}/cus/product/list1/p1'" value="继续购物">
                </div>
                <div class="car_ft_r">
                    <div class="car_money">
                        共
                        <span class="number">${totalProduct}</span>
                        件商品,总价：
                        <span class="price" id="shopTotalPrice">￥${totalPrice}</span>
                    </div>
                    <div class="car_btn">
                        <a href="javascript:void(0);" onclick=" $('#saveForm').submit(); ">去下单</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
</form>
<script src="${request.contextPath}/resources/admin/js/common/shopcart.js"></script>
<script>
		function delAll(){
			$.ajax({
				type: "GET",
				url: "${request.contextPath}/cus/cart/delAll/",
				dataType: "json",
				success: function( data ){
					alert(data.message);
					if(data && data.isSuccess) {
						//location.reload(true);
						location.href= "${request.contextPath}/cus/cart/list/p1";
					} 
				},
		        error: function() {
		            alert("网络错误，请重试！");
		        }
			});
		}
		function del(){
			$.ajax({
				type: "GET",
				url: "${request.contextPath}/cus/cart/delete/",
				data:$('#saveForm').serialize(),
				dataType: "json",
				success: function( data ){
					alert("删除成功");
					if(data && data.isSuccess) {
						//location.reload(true);
						location.reload(true);
					} 
				},
		        error: function() {
		            alert("网络错误，请重试！");
		        }
			});
		}
		
</script>
  <#include "../common/footer.ftl">
</#escape>