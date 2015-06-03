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
                   商品查看
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
						<input type="hidden" name="productId"  value="${(info.productId)!''}" />
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="productName"> <span class="red">*</span> 标题：</label>
                        <div class="col-sm-4">
                          <input type="text" id="productName" name="productName" value="${(info.productName)!''}" class="col-xs-12 col-sm-12" >
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="space-4"></div>
                      <div class="form-group">
                      <input type="hidden"  name="imageNum" id="imageLogo" value='${(info.imageNum)!""}' />
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
                          <input type="text" name="country" value="${(info.country)!''}" class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                         <div class="form-group ">
                        <label class="col-sm-2 control-label" for="preferentialPrice"> <span class="red">*</span> 会员价：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="preferentialPrice" name="preferentialPrice"  class="col-xs-12 col-sm-12" value="${(info.preferentialPrice)!''}">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
					   <div class="form-group ">
                        <label class="col-sm-2 control-label" for="marketPrice"> <span class="red">*</span> 市场价：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="marketPrice" name="marketPrice" value="${(info.marketPrice)!''}" class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="form-group ">
                        <label class="col-sm-2 control-label" for="preferentialPrice"> 特惠价：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="preferentialPrice" name="preferentialPrice"  class="col-xs-12 col-sm-12" value="${(info.dayPrice)!''}">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="form-group ">
                        <label class="col-sm-2 control-label" for="preferentialPrice">  限购数量：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="preferentialPrice" name="preferentialPrice"  class="col-xs-12 col-sm-12" value="${(info.dayNum)!''}">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="minAmount"> <span class="red">*</span> 重量：</label>
                        <div class="col-sm-4">
                          <input type="text" name="minAmount" value="${(info.minAmount)!''}" id="form-field-1" class="col-xs-12 col-sm-6">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="productUnit"> 重量单位：</label>
                        <div class="col-sm-4">
                          <input type="text" name="productUnit" value="${(info.productUnit)!''}" id="form-field-1" class="col-xs-12 col-sm-6">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="temperature"> 冷库温度：</label>
                        <div class="col-sm-4">
                          <input type="text" id="temperature"  name="temperature" value="${(info.temperature)!''}" class="col-xs-12 col-sm-6">
                          <span class="col-xs-12 col-sm-1">℃</span>
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="space-4"></div>
                      <div class="form-group " style="height:380px">
                        <label class="col-sm-2 control-label" for="productDesc"> 详情：</label>
                        <input type="hidden" name="productDesc" id="productDesc" value="${(info.productDesc)!''}" />
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
							  <input name="" class="ace ace-switch ace-switch-7" 
							  <#if ((info.customerStatus)!0) ==1>
								 checked 
							  </#if>
							  type="checkbox" id="tuangouin" />
							  <span class="lbl"></span>
						    </label>
						    <div class="col-xs-12 col-sm-10 well" id="customerStatus_div"
						    <#if ((info.customerStatus)!0) ==0>
								style="display:none;"
							  </#if>
						     >
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
									<input class="" id="bulk" placeholder="0.00" type="text" onblur="checkBulk()">
		                        </div>
						    </div>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="customerStatus"> 出租：</label>
                        <div class="col-sm-10">
                           <label class="col-xs-12 col-sm-2">
                           		<input type="hidden" name="customerStatus" id="customerStatus" value="1">
							  <input type="checkbox" name="" class="ace ace-switch ace-switch-7" id="tuangouin">
							  <span class="lbl"></span>
						    </label>
						    <div class="col-xs-12 col-sm-10 well" id="customerStatus_div" style="display: none;">
		                        <span class=" col-xs-12 col-sm-2">押金</span>
		                        <div class="col-xs-12 col-sm-4">
									<div class="input-group">
										<input type="text" class="form-control date-picker" id="sellStartTime" name="sellStartTime" value="" data-date-format="yyyy-mm-dd">
										
									</div>
		                        </div>
		                        <span class=" col-xs-12 col-sm-2">天数</span>
		                        <div class="col-xs-12 col-sm-4">
									<div class="input-group">
										<input type="text" class="form-control date-picker" name="sellEndTime" value="" data-date-format="yyyy-mm-dd">
										
									</div>
		                        </div>
		                        <div class=" col-xs-12 col-sm-12"></div>
		                        
						    		
		                        <div class="help-block col-xs-12 col-sm-reset inline"></div>
						    </div>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="customerStatus">家政：</label>
                        <div class="col-sm-10">
                           <label class="col-xs-12 col-sm-2">
                           		<input type="hidden" name="customerStatus" id="customerStatus" value="1">
							  <input type="checkbox" name="" class="ace ace-switch ace-switch-7" id="tuangouin">
							  <span class="lbl"></span>
						    </label>
						    <div class="col-xs-12 col-sm-10 well" id="customerStatus_div" style="display: none;">
		                        <span class=" col-xs-12 col-sm-2">初始价格</span>
		                        <div class="col-xs-12 col-sm-4">
									<div class="input-group">
										<input type="text" class="form-control date-picker" id="sellStartTime" name="sellStartTime" value="" data-date-format="yyyy-mm-dd">
										
									</div>
		                        </div>
		                        <span class=" col-xs-12 col-sm-2">每十平方</span>
		                        <div class="col-xs-12 col-sm-4">
									<div class="input-group">
										<input type="text" class="form-control date-picker" name="sellEndTime" value="" data-date-format="yyyy-mm-dd">
										
									</div>
		                        </div>
		                        <div class=" col-xs-12 col-sm-12"></div>
		                        <span class=" col-xs-12 col-sm-2">每天</span>
						    		<div class=" col-xs-12 col-sm-4">
									<input type="text" class="" id="bulk" name="productPrice" value="0" placeholder="0.00" onblur="checkBulk()">
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
                          <a href="${request.contextPath}/admin/console/product/list/p1/" class="btn btn-info" type="button">
                          <i class="icon-ok bigger-110"></i>
                          返回
                          </a>
                        </div>
                      </div>
                    </form>
                  </div>
                </div><!-- /.row -->
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
<script  type="text/javascript">
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