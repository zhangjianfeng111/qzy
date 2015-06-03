<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<style>
	.error{
		color:red;
	}
</style>
<#if default?has_content>
<div id="dialog_${default.receiverId}" class="dialog">
    <p class="close"><a href="#" onclick="closeBg1(${default.receiverId});">关闭</a></p>
    <div style="text-align: left;">
		<form id="saveForm_${default.receiverId}" class="address_form">
		<label >收货信息</label>
		<input type="hidden" name="receiverId" value="${default.receiverId}" />
		<div class="form_group">
			 <label><span>*</span>所在地区：</label>
             <select id="state_${default.receiverId}" name="state" data-value="${default.state}"  class="state" data-form="${default.receiverId}">
             	<option value="${default.state}"><@yep.loadRegionName (default.state)!'' /></option>
             </select>省
             <select  id="city_${default.receiverId}" name="city"    data-value="${default.city}" class="city"  data-form="${default.receiverId}" >
				<option value="${default.city}"><@yep.loadRegionName (default.city)!'' /></option>
			 </select>
             <select  id="district_${default.receiverId}" name="district"  data-value="${default.district}"  class="district"   data-form="${default.receiverId}">
				<option value="${default.district}"><@yep.loadRegionName (default.district)!''/></option>
			 </select>
         </div>
         <div class="form_group">
             <label><span>*</span>街道地址：</label>
             <input type="text" value="${default.address}" name="address" />  <span></span>
         </div>
         <div class="form_group">
         	<label><span>*</span>姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
         	<input  name="name" value="${default.name}" type="text"/> <span></span> 
         </div>
         <div class="form_group">
            <label><span>*</span>联系电话：</label>
         	<input type="text" value="${default.mobile}" name="mobile" />  <span></span>
         </div>
		 <div class="form_group" style="margin-top: 20px;">
            <label>&nbsp;</label>
            <input onclick="modifyAddress('${default.receiverId}','${request.contextPath}/cus/receiver/add/');" type="button" value="确认提交" class="queren">
            <input type="reset" value="取消" class="queren">
         </div>
			<a href="javascript:modifyAddress('${default.receiverId}','${request.contextPath}/cus/receiver/add/');" id="modifyAddress_${default.receiverId}" style="color:#3c3;padding-left:20px;display:none" class="ryrx ">保存</a>
		 </form>
 	</div>
</div>	
</#if>
<div id="dialog" class="dialog">
    <p class="close"><a href="#" onclick="closeBg();">关闭</a></p>
    <div style="text-align: left;">
    
        <form class="address_form" action="${request.contextPath}/cus/receiver/add/" id="saveForm1">
                    <label>新增收货地址</label>
                    <div class="form_group">
                        <label><span>*</span>所在地区：</label>
                        <select id="state" name="state">
                        	<option value="">请选择省份</option>
                            <option value="12">杭州</option>
                        </select>省
                        <select id="city" name="city">
                            <option value="">请选择城市</option>
                        </select>市
                        <select id="district" name="district">
                            <option value="">请选择地区</option>
                        </select>
                         <span> </span>
                    </div>
                    <div class="form_group">
                        <label><span>*</span>街道地址：</label>
                        <input type="text" name="address">
                         <span> </span>
                    </div>
                    <div class="form_group">
                        <label><span>*</span>姓名：</label>
                        <input type="text" name="name">
                         <span> </span>
                    </div>
                    <div class="form_group">
                        <label><span>*</span>联系电话：</label>
                        <input type="text" name="mobile">
                         <span> </span>
                    </div>
                    <div class="form_group">
                        <label>&nbsp;</label>
                        <input onclick="add();" type="button" value="确认提交" class="queren">
                        <input type="reset" value="取消" class="queren">
                    </div>
                </form>
    </div>
</div>
<div class="shopping_car">
    <div class="wrap">
        <div class="car_wr">
            <div class="hello">
                Hi,<span>${Session['user'].mobile}</span>,请确认订单信息
            </div>
            <div class="hello_btn">
                <a href="${request.contextPath}/cus/cart/list/p1.html"><button> 返回购物车修改</button></a>
            </div>
            <div class="shouhuoren_xinxi">
                <h3>确认收货人信息</h3>
                <div class="to_address">
                    快递至：		
                    <#if default?has_content>
                    <input type="hidden" id="defaultaddress" value="<#if default?has_content>${(default)!''}</#if>" />
                    ${userInfo.address}
					</#if>	
                    <a  href="javascript:showBg1('${(default.receiverId)!''}');">修改</a>
                </div>
                <a class="new_address" href="#" onclick="showBg();">使用新地址</a>
            </div>
            <div class="shouhuoren_xinxi">
                <h3>商品列表</h3>
                <table>
                    <thead>
                    <tr>
                        <th width="675px">商品</th>
                        <th width="130px">单价</th>
                        <th width="130px">数量</th>
                        <th width="130px">小计</th>
                    </tr>
                    </thead>
                    <tbody>
					<#if carts?has_content>
			  		<#list carts as info>
                    <tr>
                        <td>
                            <img src="${request.contextPath}/resources/admin/store/${(info.productImage)!''}" width="50px" height="50px">
                            ${info.productName}
                        </td>
                        <td>￥${info.productPrice}</td>
                        <td>${info.productNumber}</td>
                        <td>${((info.productPrice)!0)   *  ((info.productNumber)!0) }</td>
                    </tr>
                    </#list>
					</#if>
                    </tbody>
                </table>
                <div class="count">
                    <div class="count_l">
                    </div>
                    <div class="count_r">
                        共
                        <span>${totalProduct}</span>
                        件商品，总价
                        <span>${totalPrice1}</span>
                    </div>
                    <div class="clear"></div>
                </div>
                <form id="saveForm"  action="${request.contextPath}/cus/order/confirm">
                <div class="fapiao">
                    <input type="checkbox" name="invoiceType">开具发票&nbsp;&nbsp;&nbsp;&nbsp;
                    	抬头			
                    <input type="text"  name="invoiceTitle" />
                </div>
                <div class="tijiao">
                   		 备注：
                    <textarea style="width: 342px;height: 66px;vertical-align: top;" name="orderRemark"></textarea>
                </div>
                <a class="send_btn" href="javascript:void(0);" onclick="payForm()">提交订单</a>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script>
function payForm(){
	 var p = $("#defaultaddress").val();
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
function add() {
	if(!$("#saveForm1").valid())
		return;
	var opts = {
		type: "POST",
		url: "${request.contextPath}/cus/receiver/add/",
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				location.reload(true);
			} 
		}
	};
	$("#saveForm1").ajaxSubmit(opts);
}
$(function(){
	// 手机号码验证
	$.validator.addMethod(
		"isMobileRule",
		function(value, element) {
			var length = value.length;
			return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));
		},
		"请正确填写正确的手机号码"
	);	 
	
	$("#saveForm1").validate({
		/* 设置验证规则 */	 
		rules: {
			name: {
				required: true
			},
			mobile: {
				required: true,
				isMobileRule: true
			},
			address: {
				required: true
			},
			district:{
				required: true
			}
		},
		/* 设置错误信息 */	 
		messages: {
			name: {
				required: '收货人姓名不能为空'
			},
			mobile: {
				required: '请输入手机号码',
				isMobileRule: '请输入正确的手机号码'
			},
			address:{
				required: '街道地址不能为空'
			},
			district:{
				required: '地区不能为空'
			}
		},
		/* 错误信息的显示位置 */	 
		errorPlacement: function(error, element) {
			//console.log("name:"+element.attr("name")+"-value:"+element.val()+"--");
			var errorPlace = element.nextAll("span").first();
			errorPlace.html(error.html()).addClass("error");
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			lable.remove();
		},
		onkeyup: false
	});
});
<#if default?has_content>
	$("#saveForm_${default.receiverId}").validate({
		/* 设置验证规则 */	 
		rules: {
			name: {
				required: true
			},
			mobile: {
				required: true,
				isMobileRule: true
			},
			address: {
				required: true
			}
		},
		/* 设置错误信息 */	 
		messages: {
			name: {
				required: '收货人姓名不能为空'
			},
			mobile: {
				required: '请输入手机号码',
				isMobileRule: '请输入正确的手机号码'
			},
			address:{
				required: '地址不能为空'
			}
		},
		/* 错误信息的显示位置 */	 
		errorPlacement: function(error, element) {
			//console.log("name:"+element.attr("name")+"-value:"+element.val()+"--");
			var errorPlace = element.nextAll("span").first();
			errorPlace.html(error.html()).addClass("error");
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			lable.remove();
		},
		onkeyup: false
	});
</#if>	


 </script>
<#include "../common/footer.ftl">
</#escape>		