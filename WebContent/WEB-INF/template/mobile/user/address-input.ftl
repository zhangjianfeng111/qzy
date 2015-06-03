<#escape x as x!"">
<#import "../../common/common.ftl" as yep>
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
    <title>编辑收货地址</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="format-detection" content="telephone=no"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<meta http-equiv="Cache-Control" content="no-transform "/>
<meta name="keywords" content=" ">
<meta name="description" content="">  
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/mobile/css/style.css">
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
			var YS = YS || {data:{},util:{}};
			YS.config = {path:{rootPath:"${request.contextPath}"}}
		</script>
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/js.js"></script>

<style>
	.error{
		color:red;
	}
</style>

</head>
    <body class="f4b">
<div id="a-wrap">
    <section id="section" class="section">
        <header id="header" class="header gb">
            <h2>编辑收货地址</h2>
            <nav>
                <a class="iback" href="javascript:history.go(-1);"></a>
            </nav>
        </header>
        <div class="addressEdit" >
            <article id="article" class="article" >
                <form name="theForm" id="saveForm" action="${request.contextPath}/mobile/receiver/add" method="POST">
                <input type="hidden" name="receiverId" value="${(cusReceiver.receiverId)!''}"/>
                <div class="form-list-a" style="margin-top: 10px;background: #fff;border-top:1px solid #ccc;border-bottom:1px solid #ccc;">
                    <ul>
                        <li class="fl-item">
                            <b class="name">收货人</b>${defaultReceiver}
                            <span class="detail"><input type="text" id="cu_name" name="name" value="${(cusReceiver.name)}"/></span>
                            <div class="c"></div>
                        </li>
                        <li class="fl-item" id="sfput">
                            <b class="name">省份</b>
                            <span class="detail">
	                            <div class="myarea">
	                            	<font id="selectProvince">
	                            	<!--
	                            	<@yep.loadRegionName (cusReceiver.state)!'' /> 
	                            	-->
	                            	浙江省
	                            	</font>
	                            </div>
                            </span>
                            <!--
                            <select style="display:block;clear:both;" name="state" id="state" onchange="changesf()">
                            <option value=""></option>
                            		<#if stats?has_content>
                            		<#list stats as region>
                               	 <option value="${(region.regionId)!''}"   <#if (cusReceiver.state)??&& region.regionId ==cusReceiver.state?number   > selected="selected" </#if> >${(region.regionName)!''}</option>
                               	 </#list>
                               	 </#if>
                            </select>
                            -->
                            <input type="hidden"  name="state" value="12" />
                            <div class="c"></div>
                        </li>
                        <li class="fl-item" id="csput">
                            <b class="name">城市</b>
                            <span class="detail ">
                                <div class="myarea">
                                    <font id="selectCity">
                                   
                                    <@yep.loadRegionName (cusReceiver.city)!'' />
                                   <!--
                                    杭州市  -->
                                    </font>
                                    <!--
                                    <input type="hidden" value="12"  name=""  /> -->
                                </div>
                            </span>
                            
                            <select style="display:block;clear:both;" name="city" id="city" onchange="changecs()">
                               <option value=""></option>
                            		<#if citys?has_content>
                            		<#list citys as region>
                               	 <option value="${(region.regionId)!''}"   <#if  (cusReceiver.city)?? && region.regionId==cusReceiver.city?number > selected="selected" </#if> >${(region.regionName)!''}
                               	 </option>
                               	 </#list>
                               	 </#if>
                            </select>
                            <!--
                             <input type="hidden"  name="city" value="124" /> -->
                            <div class="c"></div>
                        </li>
                        <li class="fl-item"  id="qyput">
                            <b class="name">区域</b>
                            <span class="detail">
                                <div class="myarea">
                                    <font id="selectArea"><@yep.loadRegionName (cusReceiver.district)!'' /></font>
                                </div>
                            </span>
                            <select style="display:block;clear:both;" id="district" name="district" onchange="changeqy()">
                              <!-- 		<option value="775" <#if ((cusReceiver.district)!'0')?number ==775>  selected="selected" </#if>>上城区</option>
									<option value="776" <#if ((cusReceiver.district)!'0')?number ==776>  selected="selected" </#if>>下城区</option>
									<option value="777" <#if ((cusReceiver.district)!'0')?number ==777>  selected="selected" </#if>>江干区</option>
									<option value="778" <#if ((cusReceiver.district)!'0')?number ==778>  selected="selected" </#if> >拱墅区</option>
									<option value="779" <#if ((cusReceiver.district)!'0')?number ==779>  selected="selected" </#if> >西湖区</option>
									<option value="780" <#if ((cusReceiver.district)!'0')?number ==780>  selected="selected" </#if> >滨江区</option>
									<option value="782" <#if ((cusReceiver.district)!'0')?number ==782>  selected="selected" </#if> >余杭区</option> -->
								
								<option value="" ></option>
                            		<#if districts?has_content>
                            		<#list districts as region>
                               	 <option value="${(region.regionId)!''}"   <#if (cusReceiver.district)?? &&  region.regionId==cusReceiver.district?number > selected="selected" </#if> >${(region.regionName)!''}</option>
                               	 </#list>
                               	 </#if>
                               
                            </select>
                            <div class="c"></div>
                        </li>
                        <li class="fl-item">
                            <b class="name">详细地址</b>
                            <span class="detail">
                                <textarea name="address" id="cu_address">${(cusReceiver.address)!''}</textarea>
                            </span>
                            <div class="c"></div>
                        </li>
                        <li class="fl-item">
                            <b class="name">手机号码</b>
                            <span class="detail"><input type="text" id="cu_telephone" name="mobile" value="${(cusReceiver.mobile)!''}"/></span>
                            <div class="c"></div>
                        </li>
                    </ul>
                </div>
            </form>
        </article>
<!--            <article style="background:#fff;margin-top: 10px">
               <div class="form-list-a" style="border-top: 1px solid #ccc;">
                    <ul>
                        <li class="fl-item">
                            <b class="name">设为默认地址</b>
                            <span class="detail silde-btn unpick_" style="position: absolute"><i></i></span>
                        </li>
                    </ul>
                </div>
             </article>-->
        </div>
        <footer class="footer" >
            <div class="form-sub-a" style="background:#f4f4f4">
                <div class="action">
                    <div class="act-iner ma">
                        <a href="javascript:void(0);" onclick="submitInfo();" class="a-iteam b-orgn ml"><span>保存</span></a>
                    </div>
                </div>
            </div>
        </footer>
    </section>
</div>
</body>

<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.form.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>

 

</html>
<script>
	function submitInfo(){
	
	if(!$("#saveForm").valid())
		return;
	
		$.ajax({
		type: "post",
		url: $("#saveForm").attr("action"),
		data: $("#saveForm").serialize(), 
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				self.location=document.referrer;
			} 
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
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
			district :{required: '地区不能为空'}
		},
		/* 错误信息的显示位置 */	 
		errorPlacement: function(error, element) {
			console.log("id:"+element.attr("id")+"-value:"+element.val());
			var errorPlace = element.parent().nextAll(".c").first();
			errorPlace.html(error.html()).addClass("error");
			var errorPlace = element.nextAll(".c").first();
			errorPlace.html(error.html()).addClass("error");
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			lable.remove();
		},
		onkeyup: false
	});
});
</script>
</#escape>
