<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
</div>
<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="#">库存管理</a>
        <small>
          <i class="icon-double-angle-right"></i>
           新增盘点
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
            <form class="form-horizontal" role="form" id="saveForm" data-url="${request.contextPath}/admin/stock/addNewCheck">
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="wareId"> <span class="red">*</span> 供应商ID：</label>
                <div class="col-sm-4">
                	<input type="hidden" id="campanyId" name="campanyId" value="">
                  <input type="text" id="companyIdSelect" class="col-xs-12 col-sm-12 J_InputSelect">
                  <i class="icon-only icon-align-justify"></i>
              	  <a href="#modal-table" role="button" class="none"  data-toggle="modal" data-src="${request.contextPath}/admin/sup/list/p1?isIframe=true"></a>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="wareId"> <span class="red">*</span> 仓库ID：</label>
                <div class="col-sm-4">
                	<input type="hidden" id="wareId" name="wareId" value="">
                  <input type="text" id="wareIdSelect" class="col-xs-12 col-sm-12 J_InputSelect">
                  <i class="icon-only icon-align-justify"></i>
              	  <a href="#modal-table" role="button" class="none"  data-toggle="modal" data-src="${request.contextPath}/admin/ware/list/p1?isIframe=true"></a>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
                 <div class="form-group ">
                <label class="col-sm-2 control-label" for="stockUserId"> <span class="red">*</span> 审核者：</label>
                <div class="col-sm-4">
                  <input type="text"  id="stockUserId" name="stockUserId"  class="col-xs-12 col-sm-12" >
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
                
                <!-- double -->
              </div>
			   <!--<div class="form-group ">
                <label class="col-sm-2 control-label" for="marketPrice"> <span class="red">*</span> 实际入库：</label>
                <div class="col-sm-4">
                  <input type="text"  id="marketPrice" name="marketPrice" }" class="col-xs-12 col-sm-12">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              
			   <div class="form-group ">
                <label class="col-sm-2 control-label" for="keyword"> <span class="red">*</span> 计划入库：</label>
                <div class="col-sm-4">
                  <input type="text"  id="keyword" name="keyword"  class="col-xs-12 col-sm-12">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>-->
              
              <!-- Integer -->
              <!--<div class="form-group">
                <label class="col-sm-2 control-label" for="minAmount"> <span class="red">*</span> 当前入库：</label>
                <div class="col-sm-4">
                  <input type="text" name="minAmount"  id="form-field-1" class="col-xs-12 col-sm-6">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>-->
              
              <div class="form-group">
	            <label class="col-sm-2 control-label" > <span class="red">*</span> 入库类型：</label>
	            <div class="col-sm-4">
	            <select class="select inline" name="remark" >
	            <option value="in" >入库</option>
	            <option value="out" >出库</option>
	            <option value="stock" >盘点修正</option>
	            </select>
	            </div>
	          </div> 
              <div class="space-4"></div>
              <div class="form-group " style="height:380px">
                <label class="col-sm-2 control-label" for="auditInfo"> 审核信息：</label>
                <input type="hidden" name="auditInfo" id="auditInfo"  />
                <div  class="col-sm-8" style="height:380">
              	  <script id="editor" type="text/plain" style="width:100%;height:300px;"></script>
                </div>
              </div>
              		  <div class="form-group ">
		                <label class="col-sm-2 control-label" for="wareId"> <span class="red">*</span> 选择产品名称：</label>
		                <div class="col-sm-4">
		                  <input type="hidden" id="productId" name="productId" value="">
		                  <input type="text"  class="col-xs-12 col-sm-12 J_InputSelect">
		                  <i class="icon-only icon-align-justify"></i>
		              	  <a href="#modal-table" role="button" class="none"  data-toggle="modal" data-src="${request.contextPath}/admin/console/product/list/p1?isIframe=true"></a>
		                </div>
		                <div class="help-block col-xs-12 col-sm-reset inline">
		                </div>
		              </div>
              <div class="space-4"></div>
              <div class="form-group " id="toappendids">
                <label class="col-sm-2 control-label" for="auditInfo"> </label>
                <!--<div class="col-sm-8" style="width:200px">-->
              	  <!--<input type="hidden" name="ids" id="auditInfo"  />
              	  <input type="text" name="productName" id="productName"  class="col-xs-12 col-sm-12" />-->
                <!--</div>-->
              </div>
              
              <div class="clearfix">
                <div class="col-sm-offset-1 col-sm-10">
                  <button class="btn btn-info" type="button" onclick="check('${request.contextPath}/admin/stock/findMainStockByType/p1?stockType=check')">
                  <i class="icon-ok bigger-110"></i>
                  保存
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div><!-- /.row -->
        <!-- 弹出框 -->
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
		  <!-- 弹出框 -->
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
function selectWare(wareId,wareName){
	$("#wareIdSelect").val(wareName);
	$("#wareId").val(wareId);
	$("#modal-table .table-header").find('button').trigger("click");
}

function selectSup(companyId,companyName){
	$("#companyIdSelect").val(companyName);
	$("#campanyId").val(companyId);
	$("#modal-table .table-header").find('button').trigger("click");
}

function selectProduct(productId,productName){
	var html1="<div class=\"col-sm-8\" style=\"width:200px\"><input type=\"hidden\" name=\"ids\" id=\"ids\" value=\""+ productId +"\" />";
	var html2="<label>产品名称：<label><input type=\"text\" name=\"productName\" id=\"productName\"  class=\"col-xs-12 col-sm-12\" value=\""+ productName +"\"/>";
	var html3="<label>产品数量：<label><input type=\"text\" name=\"nums\" id=\"nums\"  class=\"col-xs-12 col-sm-12\" /></div>";
	$("#toappendids").append(html1+html2+html3);
	$("#modal-table .table-header").find('button').trigger("click");
}

function check(key1,key2){
	if($("#saveForm").valid()){
		getContent();
		addCheck(key1,key2);
	}else {
		alert("信息填写有误请修正");
	}
}

function addCheck(tourl){
	$.ajax({
		   type: "GET",
		   url: $('#saveForm').attr('data-url'),
		   data: $('#saveForm').serialize(),
		   success: function(data){
		     if(data.isSuccess){
		    	alert("保存成功");
		    	location.href=tourl;
		     }else{
		    	alert("保存失败");
		     }
		   },
		   dataType: "json"
		});
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
	
	
	
	$("#saveForm").validate({
		/* 设置验证规则 */	 
		rules: {
			campanyId: {
				required: true
			},
			stockUserId: {
				required: true
			},
			wareId: {
				required: true
			},
			//double  会员价
			/*preferentialPrice: {
				required: true,
				number:true,
				min:0
			},*/
			//double
			productId: {
				required: true,
				number:true
			},
			auditInfo: {
				required: true
			}
		},
		/* 设置错误信息 */	 
		messages: {
			campanyId: {
				required: '不能为空'
			},
			stockUserId: {
				required: '不能为空'
			},
			wareId: {
				required: '不能为空'
			},
			productId: {
				required: '不能为空',
				number: '请填写正确的格式'
			},
			auditInfo: {
				required: '不能为空'
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