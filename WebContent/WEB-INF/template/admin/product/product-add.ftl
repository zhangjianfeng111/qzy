<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
        </div>
        <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="#">商品</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   商品添加
                </small>
              </li>
            </ul><!-- .breadcrumb -->
          </div>
          <div class="page-content">
            <div class="page-header">
            </div><!-- /.page-header -->
            <div class="row">
              <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                  <div class="col-xs-12">
                    <form class="form-horizontal" role="form" id="saveForm">
						
                      <div class="form-group ">
		                <label class="col-sm-2 control-label" for="wareId"> <span class="red">*</span> 产品名称：</label>
		                <div class="col-sm-4">
		                	<input type="hidden" id="productId" name="productId" value="">
		                  <input type="text" id="productIdSelect" class="col-xs-12 col-sm-12 J_InputSelect">
		                  <i class="icon-only icon-align-justify"></i>
		              	  <a href="#modal-table" role="button" class="none"  data-toggle="modal" data-src="${request.contextPath}/admin/console/product/list/p1?isIframe=true"></a>
		                </div>
		                <div class="help-block col-xs-12 col-sm-reset inline">
		                </div>
		                
		                <!-- double -->
		              </div>
                      <div class="space-4"></div>
                      <div class="form-group">
                      <input type="hidden"  name="imageNum" id="imageLogo" value='' />
                        <label class="col-sm-2 control-label"> 图片：</label>
                        <div class="col-sm-4">
                         <input type="file" name="file_upload" id="file_upload_1" style="display: block;float: left;margin-top: 20px;"/>
							<img id="first_img" style="width:100px;height:100px;" src="<#if info?has_content && info.imageNum?has_content>${request.contextPath}/resources/admin/store/${info.imageNum}</#if>"/>
                        	<!--
                          <button>上传</button>
                          -->
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="form-group ">
                        <label class="col-sm-2 control-label"> <span class="red">*</span> 产地：</label>
                        <div class="col-sm-4">
                          <input type="text" name="country" id="country" value="" class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                        
                        <!-- double -->
                      </div>
                         <div class="form-group ">
                        <label class="col-sm-2 control-label" for="preferentialPrice"> <span class="red">*</span> 会员价：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="preferentialPrice" name="preferentialPrice"  class="col-xs-12 col-sm-12" value="">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                        
                        <!-- double -->
                      </div>
					   <div class="form-group ">
                        <label class="col-sm-2 control-label" for="marketPrice"> <span class="red">*</span> 市场价：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="marketPrice" name="marketPrice" value="" class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      
					   <div class="form-group ">
                        <label class="col-sm-2 control-label" for="keyword"> <span class="red">*</span> 规格描述：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="keyword" name="keyword" value="" class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      
                      <!-- Integer -->
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="minAmount"> <span class="red">*</span> 重量：</label>
                        <div class="col-sm-4">
                          <input type="text" name="minAmount" id="minAmount" value="" id="form-field-1" class="col-xs-12 col-sm-6">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      
                     	<!-- String--> 
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="productUnit"> 重量单位：</label>
                        <div class="col-sm-4">
                          <input type="text" name="productUnit" id="productUnit" value="" id="form-field-1" class="col-xs-12 col-sm-6">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="stock"> 产品库存：</label>
                        <div class="col-sm-4">
                          <input type="text" name="stock" value="" id="stock" class="col-xs-12 col-sm-6">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      
                      <!--  Double-->
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="temperature"> 冷库温度：</label>
                        <div class="col-sm-4">
                          <input type="text" id="temperature"  name="temperature" value="" class="col-xs-12 col-sm-6">
                          <span class="col-xs-12 col-sm-1">℃</span>
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="space-4"></div>
                      <div class="form-group " style="height:380px">
                        <label class="col-sm-2 control-label" for="productDesc"> 详情：</label>
                        <input type="hidden" name="productDesc" id="productDesc" value='' />
                        <div  class="col-sm-8" style="height:380">
                      	  <script id="editor" type="text/plain" style="width:100%;height:300px;"></script>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" > 类别（多选）：</label>
                        <div class="col-sm-10">
                        <#if productCategories?has_content>
                        <#list productCategories as category>
                        	<div class="col-xs-12 col-sm-2"><input type="checkbox" name="categoriesArray"  value="${category.cateCode}"
                        		<#if cateIds?has_content>
                        		<#list cateIds as proCateCode>
                        			<#if  proCateCode == category.cateCode>
                        				checked
                        			</#if>
                        		</#list>
                        		</#if>
                        	 >
                         ${(category.cateName)!''}</div>
                        	</#list>
                        	</#if>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="customerStatus"> 团购：</label>
                        <div class="col-sm-10">
                           <label class="col-xs-12 col-sm-2">
                           		<input type="hidden" name="customerStatus" id="customerStatus" value="${(info.customerStatus)!0}" />
							  <input name="" class="ace ace-switch ace-switch-7" <#if ((info.customerStatus)!0) ==1>checked</#if> type="checkbox" id="tuangouin" />
							  <span class="lbl"></span>
						    </label>
						    <div class="col-xs-12 col-sm-10 well" id="customerStatus_div" <#if ((info.customerStatus)!0) ==0>style="display:none;"</#if>>
		                        <span class=" col-xs-12 col-sm-2">开始日期</span>
		                        <div class="col-xs-12 col-sm-4">
									<div class="input-group">
										<input class="form-control date-picker" id="sellStartTime" name="sellStartTime"  value="<#if (info.sellStartTime)??>${info.sellStartTime?string('yyyy-MM-dd')}</#if>"  data-date-format="yyyy-mm-dd" type="text">
										<span class="input-group-addon">
											<i class="icon-calendar "></i>
										</span>
									</div>
		                        </div>
		                        <span class=" col-xs-12 col-sm-2">结束日期</span>
		                        <div class="col-xs-12 col-sm-4">
									<div class="input-group">
										<input class="form-control date-picker" name="sellEndTime"  value="<#if (info.sellEndTime)??>${info.sellEndTime?string('yyyy-MM-dd')}</#if>" data-date-format="yyyy-mm-dd" type="text">
										<span class="input-group-addon">
											<i class="icon-calendar"></i>
										</span>
									</div>
		                        </div>
		                        <div class=" col-xs-12 col-sm-12"></div>
		                        <span class=" col-xs-12 col-sm-2">团购价</span>
						    		<div class=" col-xs-12 col-sm-4">
									<input class="" id="bulk" name="productPrice" value="${(info.productPrice)!0}"  placeholder="0.00" type="text" onblur="checkBulk()">
		                        </div>
		                        <div class="help-block col-xs-12 col-sm-reset inline"></div>
						    </div>
                        </div>
                      </div>
                      
                       <div class="form-group">
                        <label class="col-sm-2 control-label" for="depositStatus"> 出租：</label>
                        <div class="col-sm-10">
                           <label class="col-xs-12 col-sm-2">
                           		<input type="hidden" name="depositStatus" id="depositStatus" value="${(info.depositStatus)!0}" />
							  <input name="" class="ace ace-switch ace-switch-7" <#if ((info.depositStatus)!0) ==1>checked</#if> type="checkbox" id="chuzu" />
							  <span class="lbl"></span>
						    </label>
						    <div class="col-xs-12 col-sm-10 well" id="depositStatus_div" <#if ((info.depositStatus)!0) ==0>style="display:none;"</#if>>
		                        <div class=" col-xs-12 col-sm-12"></div>
		                        <span class=" col-xs-12 col-sm-2">押金</span>
						    		<div class=" col-xs-12 col-sm-4">
									<input class="" id="bulk" name="deposit" value="${(info.deposit)!0}"  placeholder="0.00" type="text" onblur="checkBulk()">
		                        </div>
		                        <div class="help-block col-xs-12 col-sm-reset inline"></div>
						    </div>
                        </div>
                      </div>
                      
                       <div class="form-group">
                        <label class="col-sm-2 control-label" for="homeStatus"> 家政：</label>
                        <div class="col-sm-10">
                           <label class="col-xs-12 col-sm-2">
                           		<input type="hidden" name="homeStatus" id="homeStatus" value="${(info.homeStatus)!0}" />
							  <input name="" class="ace ace-switch ace-switch-7" <#if ((info.homeStatus)!0) ==1>checked</#if> type="checkbox" id="jiazheng" />
							  <span class="lbl"></span>
						    </label>
						    <div class="col-xs-12 col-sm-10 well" id="homeStatus_div" <#if ((info.homeStatus)!0) ==0>style="display:none;"</#if>>
		                        <div class=" col-xs-12 col-sm-12"></div>
		                        <span class=" col-xs-12 col-sm-2">初始价格</span>
						    		<div class=" col-xs-12 col-sm-4">
									<input class="" id="bulk" name="homePrice" value="${(info.homePrice)!0}"  placeholder="0.00" type="text" onblur="checkBulk()">
		                        </div>
		                        <div class=" col-xs-12 col-sm-12"></div>
		                        <span class=" col-xs-12 col-sm-2">每平方米单价</span>
						    		<div class=" col-xs-12 col-sm-4">
									<input class="" id="bulk" name="areaPrice" value="${(info.areaPrice)!0}"  placeholder="0.00" type="text" onblur="checkBulk()">
		                        </div>
		                        <div class=" col-xs-12 col-sm-12"></div>
		                        <span class=" col-xs-12 col-sm-2">每天单价</span>
						    		<div class=" col-xs-12 col-sm-4">
									<input class="" id="bulk" name="everydayPrice" value="${(info.everydayPrice)!0}"  placeholder="0.00" type="text" onblur="checkBulk()">
		                        </div>
		                        <div class="help-block col-xs-12 col-sm-reset inline"></div>
						    </div>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="productOrder"> 排序：</label>
                        <div class="col-sm-2">
                          <input type="text" id="productOrder" name="productOrder" value="${(info.productOrder)!99}" class="col-xs-12 col-sm-12" onblur="checkOrder();">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                          值越小，排序越靠前（1-99）
                        </div>
                      </div>
                      <div class="clearfix">
                        <div class="col-sm-offset-1 col-sm-10">
                          <button class="btn btn-info" type="button" onclick="check('${request.contextPath}/admin/console/product/addProduct','refresh')">
                          <i class="icon-ok bigger-110"></i>
                          保存
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div><!-- /.row -->
                <div id="modal-table" class="modal fade none" tabindex="-1" aria-hidden="true" >
		    <div class="modal-dialog">
		      <div class="modal-content" style="width:1000px;">
		        <div class="modal-header no-padding">
		          <div class="table-header">
		            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		              <span class="white">×</span>
		            </button>
		            <i>${title}</i>
		          </div>
		        </div>
		        <div class="modal-body no-padding" style="height:530px;">
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div>
                <div class="hr hr32 hr-dotted"></div>
                <!-- PAGE CONTENT ENDS -->
              </div><!-- /.col -->
            </div><!-- /.row -->
          </div><!-- /.page-content -->
          <script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/admin/ueditor/ueditor.config.js?v=${jslevel}"></script>
<script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/admin/ueditor/ueditor.all.min.js?v=${jslevel}"> </script>
<script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/admin/js/uediter.js?v=${jslevel}"> </script>
<script src="${request.contextPath}/resources/admin/js/jquery.uploadify.min.js?v=${jslevel}" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/message.js"></script>

<!--  日历插件-->
<script type="text/javascript">
      $(function(){
        $("#bootbox-regular").on("click", function() {
            $('#modal-table').removeClass('fade').show();
          });
        $('.close').click(function(){
            $('#modal-table').hide();
        });
        
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
					$(this).prev().focus();
		});
      });
      </script>

<script  type="text/javascript">
function selectProduct(productId,productName,country,amount,unit){
	$("#productIdSelect").val(productName);
	$("#productId").val(productId);
	$("#country").val(country);
	$("#minAmount").val(amount);
	$("#productUnit").val(unit);
	$("#modal-table .table-header").find('button').trigger("click");
}

function check(key1,key2){
	if($("#saveForm").valid()){
		getContent();
		save(key1,key2);
	}else {
		alert("信息填写有误请修正");
	}
}


$(function(){
		

		$("#tuangouin").bind("click",function(){
//		alert($(this).attr("checked"));
		
		if($(this).prop("checked")){
			$("#customerStatus").val(1);
			$("#customerStatus_div").show();
			
		}else {
			$("#customerStatus").val(0);
			$("#customerStatus_div").hide();
		}
	});
		
		if($("#tuangouin").prop("checked")){
			$("#customerStatus").val(1);
			$("#customerStatus_div").show();
		}
	
	$("#jiazheng").bind("click",function(){
//		alert($(this).attr("checked"));
		
		if($(this).prop("checked")){
			$("#homeStatus").val(1);
			$("#homeStatus_div").show();
			
		}else {
			$("#homeStatus").val(0);
			$("#homeStatus_div").hide();
		}
	});
		
		if($("#jiazheng").prop("checked")){
			$("#homeStatus").val(1);
			$("#homeStatus_div").show();
		}
		
		
	$("#chuzu").bind("click",function(){
//		alert($(this).attr("checked"));
		
		if($(this).prop("checked")){
			$("#depositStatus").val(1);
			$("#depositStatus_div").show();
			
		}else {
			$("#depositStatus").val(0);
			$("#depositStatus_div").hide();
		}
	});
		
		if($("#chuzu").prop("checked")){
			$("#depositStatus").val(1);
			$("#depositStatus_div").show();
		}	
	
	
	
	$("#saveForm").validate({
		/* 设置验证规则 */	 
		rules: {
			productName: {
				required: true
			},
			country: {
				required: true
			},
			//double  会员价
			preferentialPrice: {
				required: true,
				number:true,
				min:0
			},
			//double
			marketPrice: {
				required: true,
				number:true,
				min:0
			},
			minAmount: {
				required: true,
				number:true,
				 	digits:true
			},
			//double
			temperature: {
				number:true
			},
			productOrder: { // int 排序
				required: true,
				number:true
			},
			productPrice:{
				number:true
			},
			keyword:{
				required: true
			},
			stock:{
				number:true
			}
		},
		/* 设置错误信息 */	 
		messages: {
			productName: {
				required: '产品名称不能为空'
			},
			country: {
				required: '产地不能为空',
			},
			preferentialPrice: {
				required: '会员价格不能为空',
				number: '请填写正确的价格格式'
			},
			marketPrice: {
				required: '市场价格不能为空',
				number: '请填写正确的价格格式'
			},
			minAmount: {
				required: '重量不能为空',
				number: '请填写正确的价格格式'
			},
			temperature: {
				number: '冷库温度请填写数字'
			},
			productOrder: { // int 排序
				required: '产品排序不能为空',
				number: '排序请填写数字'
			},
			keyword:{
				required: '规格描述不能为空'
			},
			stock: {
				number: '产品库存请填写数字'
			}
		},
		/* 错误信息的显示位置 */	 
		errorPlacement: function(error, element) {
			element.parent().parent().addClass("has-error");
			var errorPlace = element.parent().nextAll("div").first();
			errorPlace.html(error);
		},	 
		/* 验证通过时的处理 */	 
		success: function(lable) {
			lable.parent().parent().removeClass("has-error");
			lable.remove();
		},
		onkeyup: false
	});
});

$(function() {
   setTimeout(function() {
     $('#file_upload_1').uploadify({
       'auto': true,
       buttonText: "上传图片",
       formData: {
         "a": "a",
         "b": "b"
       },
       'fileTypeExts': '*.gif;*.jpg;*.png;*.bmp;*.jpeg',
       'fileSizeLimit':  '2048KB',
       'swf': '${request.contextPath}/resources/admin/flash/uploadify.swf', // 选择文件flash文件
       'uploader': '${request.contextPath}/uploadify/upload', // 处理上传的Servlet
       'onUploadSuccess': function(event, data, fileObj) { // 当文件上传完成时触发
         if (fileObj) {
           // 获取具体的图片位置 fileId
           var param = $(this)[0].button[0].parentNode.id;
           var index = param.substring(param.length - 1);
           
         }
         $("#first_img").attr("src", "${request.contextPath}/resources/admin/store/" + data);
         $("#imageLogo").val(data);
       }
     });
   }, 10);
 });
 function setContent(isAppendTo) {
 	<#if info?has_content && info.productDesc?has_content>
     	UE.getEditor('editor').setContent('${info.productDesc}', isAppendTo);
 	</#if>
 	}
 function getContent() {
   $("#productDesc").attr("value", UE.getEditor('editor').getContent());
   $("#xinwenForm").submit();
   return false;
 }
 UE.getEditor('editor').addListener("ready", function() {
   setContent();
 });
     </script>  
  <#include "../common/footer.ftl">
</#escape>