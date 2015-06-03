 <#escape x as x!"">
<#include "../common/header.ftl">
 <div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="#">文章</a>
        <small>
          <i class="icon-double-angle-right"></i>
           文章添加
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
			<input type="hidden" name="id"  value="${(info.id)!''}" />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 标题：</label>
                <div class="col-sm-4">
                  <input type="text"  id="form-field-1" class="col-xs-12 col-sm-12" name="title" value="${(info.title)!''}"  >
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 摘要：</label>
                <div class="col-sm-4">
                  <textarea   id="form-field-1" class="col-xs-12 col-sm-12" name="seoDesc"   >${(info.seoDesc)!''}</textarea>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
              <input type="hidden"  name="imageLogo" id="imageLogo" value='${(info.imageLogo)!""}' />
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 图片：</label>
                <div class="col-sm-4">
                  <input type="file" name="file_upload" id="file_upload_1" style="display: block;float: left;margin-top: 20px;"/>
					<img id="first_img" style="width:100px;height:100px;" src="<#if info?has_content && info.imageLogo?has_content>${request.contextPath}/resources/admin/store/${info.imageLogo}</#if>"/>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 文章内容：</label>
                <input type="hidden" name="content" id="content" value='${(content)!""}' />
                <div class="col-sm-8" style="height:380">
                   <script id="editor" type="text/plain" style="width:100%;height:300px;"></script>
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> 排序：</label>
                <div class="col-sm-2">
                  <input type="text" id="form-field-1" class="col-xs-12 col-sm-12" name="rank" value="${(info.rank)!''}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                  值越小，排序越靠前（1-99,默认为0）
                  <span class="red"></span>
                </div>
              </div>
              <div class="clearfix">
                <div class="col-sm-offset-1 col-sm-10">
                  <button class="btn btn-info" type="button" onclick="saveFun('${request.contextPath}/admin/news/save','${request.contextPath}/admin/news/list/p1')">
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
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script  type="text/javascript">
function saveFun(key1,key2){
	if($("#saveForm").valid()){
		getContent();
		save(key1,key2);
	}
}

$(function(){
	$("#saveForm").validate({
		/* 设置验证规则 */	 
		rules: {
			title: {
				required: true
			}
		},
		/* 设置错误信息 */	 
		messages: {
			title: {
				required: '标题不能为空'
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
         var title = event.name;
         var fsize = event.size;
         $("#first_img").attr("src", "${request.contextPath}/resources/admin/store/" + data);
         $("#imageLogo").val(data);
       }
     });
   }, 10);
 });
          

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

     </script>  
        <#include "../common/footer.ftl">
</#escape>