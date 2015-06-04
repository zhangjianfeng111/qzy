 <#escape x as x!"">
<#include "../common/header.ftl">
 <div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">


    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="${request.contextPath}/admin/advertise/list/p1">广告</a>
        <small>
          <i class="icon-double-angle-right"></i>
           广告添加
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
			<input type="hidden" name="areaId"  value="${(info.areaId)!''}" />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 标题：</label>
                <div class="col-sm-4">
                  <input type="text"  id="advName" class="col-xs-12 col-sm-12" name="advName" value="${(info.advName)!''}"  >
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 实体类型：</label>
                <div class="col-sm-4">
                  <select name="advType">
                  	<#list enums['com.qzy.cn.conf.enums.AdvertiseTypeEnum']? values as advertiseTypeEnum>
                  	<option <#if info.advType?has_content && info.advType == advertiseTypeEnum.advertiseCode>selected</#if> value="${advertiseTypeEnum.advertiseCode}">${advertiseTypeEnum.advertiseDesc}</option>
                  	</#list>
                  </select>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 实体ID：</label>
                <div class="col-sm-4">
                  <input type="text"  id="advrefId" class="col-xs-12 col-sm-12" name="advrefId" value="${(info.advrefId)!''}"  >
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
              <input type="hidden"  name="advImg" id="imageLogo" value='${(info.advImg)!""}' />
                <label class="col-sm-2 control-label" for="form-field-1"> <span class="red">*</span> 图片：</label>
                <div class="col-sm-4">
                  <input type="file" name="file_upload" id="file_upload_1" style="display: block;float: left;margin-top: 20px;"/>
					<img id="first_img" style="width:100px;height:100px;" src="<#if info?has_content && info.advImg?has_content>${request.contextPath}/resources/admin/store/${info.advImg}</#if>"/>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                </div>
              </div>
              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="form-field-1"> 排序：</label>
                <div class="col-sm-2">
                  <input type="text" id="form-field-1" class="col-xs-12 col-sm-12" name="orderSort" value="${(info.orderSort)!''}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline">
                  值越小，排序越靠前（1-99,默认为0）
                  <span class="red"></span>
                </div>
              </div>
             
              
              
              <div class="clearfix">
                <div class="col-sm-offset-1 col-sm-10" style="margin-left: 453px;">
                  <button class="btn btn-info" type="button" onclick="saveFun('${request.contextPath}/admin/advertise/save','${request.contextPath}/admin/advertise/list/p1?areaId=${info.areaId}')">
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
var _url = $("#advLinkAddress").val();
var _title = $("#advName").val();
var _img = $("#imageLogo").val();
if(_title == ""){
	alert("名称不能为空！");
	$("#advName").focus();
	return false;
}else if(_url == ""){
	alert("链接不能为空！");
	$("#advLinkAddress").focus();
	return false;
}else if(_img == ""){
alert("图片不能为空！");
return false;}
	getContent();
	save(key1,key2);
}

 function getContent() {
   $("#xinwenForm").submit();
   return false;
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
          

 

     </script>  
        <#include "../common/footer.ftl">
</#escape>