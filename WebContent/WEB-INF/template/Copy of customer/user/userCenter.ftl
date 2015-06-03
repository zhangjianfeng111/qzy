<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>

<style>
	.error{
		color:red;
	}
</style>

<div class="section">
<h1>个人中心</h1>
<div class="ucenter-block clearfix">
	<div class="ucenter-leftblock">
		<div class="tit">账户余额</div>
		<div class="yu-e">￥${cusInfo.balance}</div>
		<a href="${request.contextPath}/cus/giftlog/load" class="green-btn">卡券兑换入口</a>
	</div>
</div>

<div class="ucenter-block clearfix">
					<div class="ucenter-leftblock">
						<div class="tit">密码</div>
						<a class="" href="${request.contextPath}/cus/info/modifyPwd/input" style="padding-left:20px;line-height:40px;color:#00c;">修改密码</a>
					</div>
				</div>

<#if defaultReceiver?has_content>
<div class="ucenter-block clearfix">
	<div class="ucenter-leftblock">
		<div class="tit">默认收货信息</div>
		<div class="modify-block">
			<p>
			<@yep.loadRegionName (defaultReceiver.city)!'' />
			<@yep.loadRegionName (defaultReceiver.district)!''  />
			</p>
		</div>
		<div class="modify-block">
			<p>${defaultReceiver.address}</p>
		</div>
		<div class="modify-block">
			<p>${defaultReceiver.name} ${defaultReceiver.mobile}</p>
		</div>
	</div>
</div>
</#if>
<div class="clearfix ucenter-block addr">
	<h3 style="line-height:40px;padding-left:20px;font-size:14px;">所有地址</h3>
	<#if receiver?has_content>
	<#list receiver as info>
	<form id="saveForm_${info.receiverId}" action="" action-back="">
	<input type="hidden" name="receiverId" value="${info.receiverId}" />
	<div class="ucenter-leftblock in3">
						<div class="tit">收货信息</div>
						<div class="modify-block">
							<p class="reala">
							<@yep.loadRegionName (info.city)!'' />
							<@yep.loadRegionName (info.district)!''/></p>
							<p class="realb">
								<select style="width:30%" id="state_${info.receiverId}" name="state" data-value="${info.state}"  class="state" data-form="${info.receiverId}">
                               	 <option value="${(region.regionId)!''}"   <#if (info.state)??&& stats.regionId ==(info.state)?number   > selected="selected" </#if> >${(stats.regionName)!''}</option>
								</select>
								<select style="width:30%" id="city_${info.receiverId}" name="city"    data-value="${info.city}" class="city"  data-form="${info.receiverId}" >
									<option value="${info.city}"><@yep.loadRegionName (info.city)!'' /></option>
								</select>
								<select style="width:30%" id="district_${info.receiverId}" name="district"  data-value="${info.district}"  class="district"   data-form="${info.receiverId}">
									<option value="${info.district}"><@yep.loadRegionName (info.district)!''/></option>
								</select>
							</p>
						</div>
						<div class="modify-block">
							<p class="reala">${info.address}</p>
							<p class="realb">详细地址：<input type="text" value="${info.address}" name="address" />  <span></span> </p>
						</div>
						<div class="modify-block  addadd">
							<p class="reala">${info.name} ${info.mobile}</p>
							<p class="realb">姓名：<input  name="name" value="${info.name}" type="text"/> <span></span> 
							手机：<input type="text" value="${info.mobile}" name="mobile" />  <span></span>  </p>
						</div>
						<a href="javascript:setdefault('${info.receiverId}');" style="color:#c33;padding-left:20px;"  class="ryrx">设为默认地址</a>
						<a href="javascript:deletereceiver(${info.receiverId});" style="color:#33c;padding-left:20px;" class="ryrx">删除</a>
						<a href="javascript:intoModifyAddress('${info.receiverId}');" id="intoModifyAddress_${info.receiverId}" style="color:#3c3;padding-left:20px;"   class="ryrx xgdz">修改</a>
						<a href="javascript:modifyAddress('${info.receiverId}','${request.contextPath}/cus/receiver/add/');" id="modifyAddress_${info.receiverId}" style="color:#3c3;padding-left:20px;display:none" class="ryrx ">保存</a>
					</div>
	
	<!--
	<div class="ucenter-leftblock in3">
		<div class="tit">收货信息</div>
		<div class="modify-block">
			<p>
			<@yep.loadRegionName (info.state)!'' />
			<@yep.loadRegionName (info.city)!'' />
			<@yep.loadRegionName (info.district)!''/>
			</p>
		</div>
		<div class="modify-block">
			<p>${info.address}</p>
		</div>
		<div class="modify-block">
			<p>${info.name} ${info.mobile}</p>
		</div>
		<a href="javascript:setdefault('${info.receiverId}');" style="color:#c33;padding-left:20px;"  class="ryrx">设为默认地址</a>
		<a href="javascript:deletereceiver(${info.receiverId});" style="color:#33c;padding-left:20px;" class="ryrx">删除</a>
	</div>
	-->
	</form>
	</#list>
	</#if>
	
	<div class="ucenter-leftblock in3 str  ">
		<form action="${request.contextPath}/cus/receiver/add/" id="saveForm">
		<div class="tit">添加收货信息</div>
		<div class="modify-block">
			<p>
				<select id="state" name="state">
					<option value="">请选择省份</option>
					<option value="${stats.regionId}">${stats.regionName}</option>
				</select>
				<select id="city" name="city">
					<option value="">请选择城市</option>
				</select>
				<select id="district" name="district">
					<option value="">请选择地区</option>
				</select>
				<span> </span>
			</p>
		</div>
		<div class="modify-block ">
			<p>详细地址：<input name="address" type="text"/>  <span> </span>   </p>
		</div>
		<div class="modify-block addadd">
			<p>姓名：<input type="text" name="name"/>   <span> </span>  手机：<input name="mobile" type="text"/>  <span> </span>   </p>
		</div>
		<a href="javascript:add();" style="color:#c33;padding-left:20px;" class="ryrx">添加</a>
		<button type="submit" value="" style="display:none" id="saveSubmit"/>
		</form>
	</div>
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
				required: '地址不能为空'
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
	

</script>
  <#include "../common/footer.ftl">
</#escape>