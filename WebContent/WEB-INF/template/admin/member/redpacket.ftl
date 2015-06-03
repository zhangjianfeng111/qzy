<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
        </div>
        <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="#">红包</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   红包发放
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
                        <label class="col-sm-2 control-label" for="productName"> <span class="red">*</span> 标题：</label>
                        <div class="col-sm-4">
                          <input type="text" id="pTitle" name="pTitle"  class="col-xs-12 col-sm-12" >
                          <input type="hidden" id="ids" name="ids" value="${ids}"   >
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="space-4"></div>
                      
                         
					   <div class="form-group ">
                        <label class="col-sm-2 control-label" for="marketPrice"> <span class="red">*</span> 面值：</label>
                        <div class="col-sm-4">
                          <input type="text"  id="pValue" name="pValue"  class="col-xs-12 col-sm-12">
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>                                                                  
                      <div class="space-4"></div>
                       <div class="form-group ">
                        <label class="col-sm-2 control-label" for="marketPrice"> <span class="red"></span> 描述：</label>
                        <div class="col-sm-4">
                          <textarea type="text"  id="pdesc" name="pdesc"  class="col-xs-12 col-sm-12"></textarea>
                        </div>
                        <div class="help-block col-xs-12 col-sm-reset inline">
                        </div>
                      </div>
                      <div class="clearfix">
                        <div class="col-sm-offset-1 col-sm-10">
                          <button class="btn btn-info" type="button" onclick="save('${request.contextPath}/admin/member/sendall','${request.contextPath}/admin/member/list/p1')">
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

<script src="${request.contextPath}/resources/admin/js/jquery.uploadify.min.js?v=${jslevel}" type="text/javascript"></script> 
  <#include "../common/footer.ftl">
</#escape>