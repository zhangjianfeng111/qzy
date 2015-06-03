<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>

<style>
	.error{
		color:red;
	}
</style>

<#if receiver?has_content>
	<#list receiver as info>
<div id="dialog_${info.receiverId}" class="dialog">
    <p class="close"><a href="#" onclick="closeBg1(${info.receiverId});">关闭</a></p>
    <div style="text-align: left;">
		<form id="saveForm_${info.receiverId}" class="address_form">
		<label >收货信息</label>
		<input type="hidden" name="receiverId" value="${info.receiverId}" />
		<div class="form_group">
		
			 <label><span>*</span>所在地区：</label>
                        <select id="state_${info.receiverId}" name="state" data-value="${info.state}"  class="state" data-form="${info.receiverId}">
                            <option value="${info.state}"><@yep.loadRegionName (info.state)!'' /></option>
                        </select>省
                        <select  id="city_${info.receiverId}" name="city"    data-value="${info.city}" class="city"  data-form="${info.receiverId}" >
							<option value="${info.city}"><@yep.loadRegionName (info.city)!'' /></option>
						</select>
                        <select  id="district_${info.receiverId}" name="district"  data-value="${info.district}"  class="district"   data-form="${info.receiverId}">
							<option value="${info.district}"><@yep.loadRegionName (info.district)!''/></option>
						</select>
                    </div>
                    <div class="form_group">
                        <label><span>*</span>街道地址：</label>
                       <input type="text" value="${info.address}" name="address" />  <span></span>
                    </div>
                    <div class="form_group">
                        <label><span>*</span>姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input  name="name" value="${info.name}" type="text"/> <span></span> 
                    </div>
                    <div class="form_group">
                        <label><span>*</span>联系电话：</label>
                       <input type="text" value="${info.mobile}" name="mobile" />  <span></span>
                    </div>
						<div class="form_group" style="margin-top: 20px;">
                        <label>&nbsp;</label>
                        <input onclick="modifyAddress('${info.receiverId}','${request.contextPath}/cus/receiver/add/');" type="button" value="确认提交" class="queren">
                        <input type="reset" value="取消" class="queren">
                    </div>
						<a href="javascript:modifyAddress('${info.receiverId}','${request.contextPath}/cus/receiver/add/');" id="modifyAddress_${info.receiverId}" style="color:#3c3;padding-left:20px;display:none" class="ryrx ">保存</a>
					</div>
	</form>
 </div>
</div>	
	</#list>
</#if>

<#if defaultReceiver?has_content>
	<div id="dialog_${defaultReceiver.receiverId}" class="dialog">
    <p class="close"><a href="#" onclick="closeBg1(${defaultReceiver.receiverId});">关闭</a></p>
    <div style="text-align: left;">
		<form id="saveForm_${defaultReceiver.receiverId}" class="address_form">
		<label >收货信息</label>
		<input type="hidden" name="receiverId" value="${defaultReceiver.receiverId}" />
		<div class="form_group">
		
			 <label><span>*</span>所在地区：</label>
                        <select id="state_${defaultReceiver.receiverId}" name="state" data-value="${defaultReceiver.state}"  class="state" data-form="${defaultReceiver.receiverId}">
                            <option value="${defaultReceiver.state}"><@yep.loadRegionName (defaultReceiver.state)!'' /></option>
                        </select>省
                        <select  id="city_${defaultReceiver.receiverId}" name="city"    data-value="${defaultReceiver.city}" class="city"  data-form="${defaultReceiver.receiverId}" >
							<option value="${defaultReceiver.city}"><@yep.loadRegionName (defaultReceiver.city)!'' /></option>
						</select>
                        <select  id="district_${defaultReceiver.receiverId}" name="district"  data-value="${defaultReceiver.district}"  class="district"   data-form="${defaultReceiver.receiverId}">
							<option value="${defaultReceiver.district}"><@yep.loadRegionName (defaultReceiver.district)!''/></option>
						</select>
                    </div>
                    <div class="form_group">
                        <label><span>*</span>街道地址：</label>
                       <input type="text" value="${defaultReceiver.address}" name="address" />  <span></span>
                    </div>
                    <div class="form_group">
                        <label><span>*</span>姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <input  name="name" value="${defaultReceiver.name}" type="text"/> <span></span> 
                    </div>
                    <div class="form_group">
                        <label><span>*</span>联系电话：</label>
                       <input type="text" value="${defaultReceiver.mobile}" name="mobile" />  <span></span>
                    </div>
						<div class="form_group" style="margin-top: 20px;">
                        <label>&nbsp;</label>
                        <input onclick="modifyAddress('${defaultReceiver.receiverId}','${request.contextPath}/cus/receiver/add/');" type="button" value="确认提交" class="queren">
                        <input type="reset" value="取消" class="queren">
                    </div>
						<a href="javascript:modifyAddress('${defaultReceiver.receiverId}','${request.contextPath}/cus/receiver/add/');" id="modifyAddress_${defaultReceiver.receiverId}" style="color:#3c3;padding-left:20px;display:none" class="ryrx ">保存</a>
					</div>
	</form>
 </div>
</div>	
</#if>


<div class="personal">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 个人中心 > 收货地址
        </div>
        <div class="personal_list">
            <div class="icon">
                <img src="${request.contextPath}/resources/carbon/image/logo_02.png"" width="184" height="58">
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
            <div class="address_wrap">
                <div class="address_title">
                    <div class="l">
                        我的收货地址
                    </div>
                    <div class="clear"></div>
                </div>
                <table class="address" border="1">
                    <thead>
                    <tr>
                        <th style="width: 120px;">默认地址</th>
                        <th style="width: 120px;">收货人</th>
                        <th style="width: 240px;">所在区域</th>
                        <th style="width: 240px;">街道地址</th>
                        <th style="width: 120px;">联系电话</th>
                        <th style="width: 90px;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if defaultReceiver?has_content>
                    <tr>
                        <td>
                            <input type="radio" name="radio" checked="true">
                        </td>
                        <td>${defaultReceiver.name}</td>
                        <td><@yep.loadRegionName (defaultReceiver.city)!'' /> <@yep.loadRegionName (defaultReceiver.district)!''/></td>
                        <td>${defaultReceiver.address}</td>
                        <td>${defaultReceiver.mobile}</td>
                        <td>
							<a href="javascript:showBg1('${defaultReceiver.receiverId}');" id="intoModifyAddress_${defaultReceiver.receiverId}" >修改</a>
							/
                            <a href="javascript:deletereceiver(${defaultReceiver.receiverId});" >删除</a>
                        </td>
                    </tr>
					</#if>	
                    <#if receiver?has_content>
						<#list receiver as info>
                    <tr>
                        <td>
                            <input type="radio" name="radio" onclick="setdefault('${info.receiverId}');">
                        </td>
                        <td>${info.name}</td>
                        <td><@yep.loadRegionName (info.city)!'' /> <@yep.loadRegionName (info.district)!''/></td>
                        <td>${info.address}</td>
                        <td>${info.mobile}</td>
                        <td>
                            <a href="javascript:showBg1('${info.receiverId}');" id="intoModifyAddress_${info.receiverId}" >修改</a>
							/
                            <a href="javascript:deletereceiver(${info.receiverId});" >删除</a>
                        </td>
                    </tr>
                    	</#list>
					</#if>
                    </tbody>
                </table>
                <form class="address_form" action="${request.contextPath}/cus/receiver/add/" id="saveForm">
                    <label>新增收货地址</label>
                    <div class="form_group">
                        <label><span>*</span>所在地区：</label>
                        <select id="state" name="state">
                        	<option value="">请选择省份</option>
                            <option value="${stats.regionId}">${stats.regionName}</option>
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
        <div class="clear"></div>
    </div>
</div>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script>
function setdefault(id){
	$.ajax({
		type: "GET",
		url: "${request.contextPath}/cus/info/bedefault/",
		data: {receiverId : id}, 
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				location.reload(true);
			} 
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}

function deletereceiver(id){
	$.ajax({
		type: "GET",
		url: "${request.contextPath}/cus/receiver/delete/"+id,
		dataType: "json",
		success: function( data ){
			if(data && data.isSuccess) {
				alert("删除成功");
				location.reload(true);
			} else{
				alert("删除失败");
			}
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}

function add() {
	if(!$("#saveForm").valid())
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
	$("#saveForm").ajaxSubmit(opts);
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
	
	$("#saveForm").validate({
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

<#if receiver?has_content>
	<#list receiver as info>
	$("#saveForm_${info.receiverId}").validate({
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
</#list>
</#if>		
<#if defaultReceiver?has_content>
	$("#saveForm_${defaultReceiver.receiverId}").validate({
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