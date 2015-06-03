<#escape x as x!"">
<#include "../common/header.ftl">
<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="#">礼券</a>
        <small>
          <i class="icon-double-angle-right"></i>
           礼券添加
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
            <form class="form-horizontal" id="saveForm" role="form">
              <div class="form-group has-error">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 标题：</label>
                <div class="col-sm-4">
                  <input type="text" name="giftName" id="giftName" class="col-xs-12 col-sm-12">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                  
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 图片：</label>
                <div class="col-sm-4">
                  <input type="file" name="file_upload" id="file_upload_1" style="display: block;float: left;margin-top: 20px;"/>
	              <img id="first_img" style="width:100px;height:100px;" src="${request.contextPath}/resources/yephouse-admin/demo/assets/images/userlogo.png"/>
	              <input type="hidden" value="" id="giftImage" name="giftImage"/>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> 面额：</label>
                <div class="col-sm-4">
                  <input type="text" name="giftValue" id="giftValue" class="col-xs-12 col-sm-6">
                  <span class="col-xs-12 col-sm-1">元</span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                  
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> 价格：</label>
                <div class="col-sm-4">
                  <input type="text" name="giftPrice" id="giftPrice" class="col-xs-12 col-sm-6">
                  <span class="col-xs-12 col-sm-1">元</span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                  
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group ">
                <label class="col-sm-2 control-label" name="giftDesc" for="giftDesc"> <span class="red">*</span> 详情：</label>
				<input type="hidden" name="giftDesc" id="giftDesc"  />
                        <div class="col-sm-8" style="height:380">
                           <script id="editor" type="text/plain" style="width:100%;height:300px;"></script>
                        </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> 类别：</label>
                <div class="col-sm-10">
                	<div class="col-xs-12 col-sm-2">
                		<label>
							<input name="giftTpye" class="ace" type="radio">
							<span class="lbl"> 电子券</span>
						</label>
                	</div>
                	<div class="col-xs-12 col-sm-2">
                		<label>
							<input name="giftTpye" class="ace" type="radio">
							<span class="lbl"> 实物卡</span>
						</label>
                	</div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> 排序：</label>
                <div class="col-sm-2">
                  <input type="text" name="giftOrder" id="giftOrder" class="col-xs-12 col-sm-12" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                  值越小，排序越靠前（1-99）
                  <span class="red">error</span>
                </div>
              </div>
              <div class="clearfix">
                <div class="col-sm-offset-1 col-sm-10">
                  <button class="btn btn-info" type="button">
                  <i class="icon-ok bigger-110"></i>
                  保存
                  </button>
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
</div><!-- /.main-content -->
        <script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/admin/ueditor/ueditor.config.js?v=${jslevel}"></script>
<script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/admin/ueditor/ueditor.all.min.js?v=${jslevel}"> </script>
<script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/admin/js/uediter.js?v=${jslevel}"> </script>
     <script src="${request.contextPath}/resources/admin/js/jquery.uploadify.min.js?v=${jslevel}" type="text/javascript"></script>
  
  <script src="${request.contextPath}/resources/admin/myJs/product-add.js?v=${jslevel}" type="text/javascript"></script>
<script type="text/javascript">
  $(function() {
   setTimeout(function(){
	$('#file_upload_1').uploadify({
		'auto'     : true,
		'buttonText' : '上传',
		'fileTypeExts' : '*.gif;*.jpg;*.png;*.bmp;*.jpeg',
		'fileSizeLimit': '2048KB',
		'swf'      : '${request.contextPath}/resources/admin/flash/uploadify.swf', // 选择文件flash文件
		'uploader' : '${request.contextPath}/uploadify/upload', // 处理上传的Servlet
		'onUploadSuccess' : function (event, data, fileObj) {   //当文件上传完成时触发  
            	$("#first_img").attr("src","${request.contextPath}/resources/admin/store/"+data);
            	$("#giftImage").val(data);
            } 
	});
	},10);
	
	 function setContent(isAppendTo) {
 	<#if info?has_content && content?has_content>
     	UE.getEditor('editor').setContent('${content}', isAppendTo);
 	</#if>
 	}
 
 function getContent() {
   $("#content").attr("value", UE.getEditor('editor').getContent());
   $("#xinwenForm").submit();
   return false;
 }

 UE.getEditor('editor').addListener("ready", function() {
   setContent();
 });
});
</script>
<script src="${request.contextPath}/resources/admin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<#include "../common/footer.ftl">
</#escape>