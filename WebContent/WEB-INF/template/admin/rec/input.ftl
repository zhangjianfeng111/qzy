 <#escape x as x!"">
<#include "../common/header.ftl">
 <div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">


    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="${request.contextPath}/admin/rec/list/p1">推送</a>
        <small>
          <i class="icon-double-angle-right"></i>
           推送添加
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
			<input type="hidden" name="recId"  value="${(info.recId)!''}" />
			<input type="hidden" name="placeId"  value="${(info.placeId)!''}" />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 名称：</label>
                <div class="col-sm-4">
                  <input type="text"  id="recTitle" class="col-xs-12 col-sm-12" name="recTitle" value="${(info.recTitle)!''}"  >
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1">  关键字：</label>
                <div class="col-sm-4">
                  <input type="text"  id="form-field-1" class="col-xs-12 col-sm-12" name="recKeyword" value="${(info.recKeyword)!''}"  >
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 链接：</label>
                <div class="col-sm-4">
                  <input type="text"  id="recUrl" class="col-xs-12 col-sm-12" name="recUrl" value="${(info.recUrl)!''}"  >
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1">  推送实体ID：</label>
                <div class="col-sm-4">
                  <input type="text"  id="form-field-1" class="col-xs-12 col-sm-12" name="recRefinfoId" value="${(info.recRefinfoId)!''}"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
              <input type="hidden"  name="recImg" id="imageLogo" value='${(info.recImg)!""}' />
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 图片：</label>
                <div class="col-sm-4">
                  <input type="file" name="file_upload" id="file_upload_1" style="display: block;float: left;margin-top: 20px;"/>
					<img id="first_img" style="width:100px;height:100px;" src="<#if info?has_content && info.recImg?has_content>${request.contextPath}/resources/admin/store/${info.recImg}</#if>"/>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="form-field-1">  文章内容：</label>
                <input type="hidden" name="recComment" id="content" value="${(info.recComment)!''}" />
                <div class="col-sm-8" style="height:380">
                   <script id="editor" type="text/plain" style="width:100%;height:300px;"></script>
                </div>
              </div>
             
               <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> 排序：</label>
                <div class="col-sm-2">
                  <input type="text" id="form-field-1" class="col-xs-12 col-sm-12" name="recOrder" value="${(info.recOrder)!''}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                  值越小，排序越靠前（1-99,默认为0）
                  <span class="red"></span>
                </div>
              </div>
              
              <div class="clearfix">
                <div class="col-sm-offset-1 col-sm-10" style="margin-left: 453px;">
                  <button class="btn btn-info" type="button" onclick="saveFun('${request.contextPath}/admin/rec/save','${request.contextPath}/admin/rec/list/p1?placeId=${info.placeId}')">
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
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script  type="text/javascript">
function saveFun(key1,key2){
var _url = $("#recUrl").val();
var _title = $("#recTitle").val();
var _img = $("#imageLogo").val();
if(_title == ""){
	alert("名称不能为空！");
	$("#recTitle").focus();
	return false;
}else if(_url == ""){
	alert("链接不能为空！");
	$("#recUrl").focus();
	return false;
}else if(_img == ""){
alert("图片不能为空！");
return false;}
	getContent();
	save(key1,key2);
}

 



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
 	<#if info?has_content && info.recComment?has_content>
     	UE.getEditor('editor').setContent('${info.recComment}', isAppendTo);
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