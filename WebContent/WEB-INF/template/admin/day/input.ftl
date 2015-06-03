<#escape x as x!"">
<#include "../common/header.ftl">
<div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">


            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="#">商品</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   每日优惠
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

                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="form-field-1"> 商品：</label>
                        <div class="col-sm-4">
                        <input type="hidden" name="productId" class="col-xs-12 col-sm-12"  value="${(info.productId)!''}">
                          <input type="text" name="productName" class="col-xs-12 col-sm-12" disabled="" value="${(info.productName)!''}">
                        </div>
       
                      </div>

                      <div class="space-4"></div>

                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="form-field-1"> 限购份数：</label>
                        <div class="col-sm-4">
                          <input type="text" name="dayNum" value="${(info.dayNum)!'999'}" class="col-xs-12 col-sm-6" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                          <span class="col-xs-12 col-sm-1">份</span>
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                          error
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="form-field-1"> 特惠价格：</label>
                        <div class="col-sm-4">
                          <input type="text" name="dayPrice"  value="${(info.dayPrice)!''}"  class="col-xs-12 col-sm-6">
                          <span class="col-xs-12 col-sm-1">元</span>
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                          error
                        </div>
                      </div>
                      
                      <div class="clearfix">
                        <div class="col-sm-offset-1 col-sm-10">
                          <button class="btn btn-info" type="button" onclick="saveFun('${request.contextPath}/admin/day/daysave','${request.contextPath}/admin/console/product/list/p1')">
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
        <script src="${request.contextPath}/resources/admin/js/jquery.uploadify.min.js?v=${jslevel}" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/admin/js/jquery/plugins/form/jquery.validate.js"></script>
<script  type="text/javascript">
function saveFun(key1,key2){
	if($("#saveForm").valid()){
		getContent();
		save(key1,key2);
	}
}


 
 function getContent() {
   $("#xinwenForm").submit();
   return false;
 }


     </script> 
        <#include "../common/footer.ftl">
</#escape>