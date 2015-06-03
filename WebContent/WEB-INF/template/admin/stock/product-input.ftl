<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
        </div>
        <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="#">入库</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   新增入库
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
						<input type="hidden" name="productId"  value="" />
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="productName"> <span class="red">*</span> 标题：</label>
                        <div class="col-sm-4">
                          <input type="text" id="productName" name="productName" value="" class="col-xs-12 col-sm-12" >
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="form-group ">
                        <label class="col-sm-2 control-label"> <span class="red">*</span> 产地：</label>
                        <div class="col-sm-4">
                          <input type="text" name="country" value="" class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                        <!-- double -->
                      </div>
                         <div class="form-group ">
                        <label class="col-sm-2 control-label" for="preferentialPrice"> <span class="red">*</span> 成本价：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="costPrice" name="costPrice"  class="col-xs-12 col-sm-12" value="">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                        
                        <!-- double -->
                      </div>
                      <!-- Integer -->
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="minAmount"> <span class="red">*</span> 重量：</label>
                        <div class="col-sm-4">
                          <input type="text" name="minAmount" value="" id="minAmount" class="col-xs-12 col-sm-6">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      
                     	<!-- String--> 
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="productUnit"> <span class="red">* </span> 重量单位：</label>
                        <div class="col-sm-4">
                        	<input type="hidden" id="sellStatus" name="sellStatus" value="0">
                          <input type="text" name="productUnit" value="" id="productUnit" class="col-xs-12 col-sm-6">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
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
		                
		                <!-- double -->
		              </div>
		              <div class="form-group ">
                        <label class="col-sm-2 control-label"> <span class="red"></span> 备注：</label>
                        <div class="col-sm-4">
                          <input type="text" name="auditInfo" id="auditInfo" value="" class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                        <!-- double -->
                      </div>
                      <div class="clearfix">
                        <div class="col-sm-offset-1 col-sm-10">
                          <button class="btn btn-info" type="button" onclick="check('${request.contextPath}/admin/console/product/saveOrUpdate','refresh')">
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

function check(key1,key2){
	if($("#saveForm").valid()){
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
			//double  成本价
			costPrice: {
				required: true,
				number:true,
				min:0
			},
			//double
			minAmount: {
				required: true,
				number:true,
				 	digits:true
			},
			productUnit: {
				required: true,
				maxlength:10
			},
			wareId:{
				required: true,
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
			costPrice: {
				required: '会员价格不能为空',
				number: '请填写正确的价格格式'
			},
			minAmount: {
				required: '重量不能为空',
				number: '请填写正确的重量格式'
			},
			productUnit: {
				required: '单位质量不能为空',
				maxlength:'长度不能超过10'
			},
			wareId:{
				required: '规格描述不能为空',
				number: '请填写正确的ID格式'
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


     </script>  
  <#include "../common/footer.ftl">
</#escape>