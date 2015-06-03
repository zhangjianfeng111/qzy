<#escape x as x!"">
<#include "../common/header.ftl">
<form id="saveForm">			
<div class="section qiye">
	<img src="${request.contextPath}/resources/admin/store/150203151249qute.jpg" height="275" width="951" class="qiye-banner"> 
	<div class="contact">
		<p class="title">请填写企业需求单</p>
		<div class="row"><label>联系人：</label><input type="text" id="cusName" name="cusName" ></div>
		<div class="row"><label>联系电话：</label><input type="text" id="mobile" name="mobile"></div>
		<div class="row"><label></label><span>为了保障您的利益，请填写有效联系电话</span></div>
		<div class="row"><label>公司名称：</label><input type="text" id="compName" name="compName"></div>
		<div class="row"><label>您的需求：</label><textarea id="content" name="content"></textarea></div>
		<div class="row"><label>验证码：</label><input  id="yzm" name="yzm" type="text" class="" placeholder="" />
		<img id="yzmImg" src="${request.contextPath}/code?1" width="97px" height="27px" class="au" onclick="changeImg(this)"></div>
		<div class="row"><label></label><a href="javascript:yzmSave('${request.contextPath}/yanzheng','${request.contextPath}/admin/comporder/save');" class="submit">提交</a></div>
	</div>
	<p class="js-title">服务介绍</p>
	<div class="js-text"><img src="/resources/admin/store/150203150329qydz.jpg" style="width:100%;"/></div>
</div>
<form>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<style>
.error{
	color: red;
}
</style>
<script  type="text/javascript">

function changeImg(t){
	$(t).attr("src",$(t).attr("src")+new Date());
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
			cusName: {
				required: true
			},
			mobile: {
				required: true,
				isMobileRule:true,
			},
			compName: {
				required: true
			}
		},
		/* 设置错误信息 */	 
		messages: {
			cusName: {
				required: '联系人不能为空'
			},
			mobile: {
				required: '手机号码不能为空',
				isMobileRule: '请填写正确的手机号码'
			},
			compName: {
				required: '公司名称不能为空'
			}
		},
		/* 错误信息的显示位置 */	 
		errorPlacement: function(error, element) {
			element.after(error);
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			lable.remove();
		},
		onkeyup: false
	});
});
 
function yzmSave(checkUrl, url){
	if(!$("#saveForm").valid()){
		return;
	}
	var yzm = $("#yzm").val();
	$.ajax({
		type: "POST",
		url: checkUrl,
		data: {"yzm":yzm}, 
		dataType: "json",
		success: function( data ){
			if(data){
				saveForm(url);
			}else{
				alert("验证码错误");
			}
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}

function saveForm(url){
	var queryString = $("#saveForm").serialize();
	$.ajax({
		type: "POST",
		'url': url,
		data: queryString, 
		dataType: "json",
		success: function( data ){
			if(data.isSuccess == true){
				alert("操作成功！");
				location.href=location.href;
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