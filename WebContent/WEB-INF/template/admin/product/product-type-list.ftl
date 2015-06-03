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
                   类别列表
                </small>
              </li>
            </ul><!-- .breadcrumb -->
          </div>
          <div class="page-content">
            <div class="page-header">
              <form class="form-inline">
              </form>
            </div><!-- /.page-header -->
            <div class="row">
              <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                  <div class="tabbable ">
                      <div class="tab-content">
                        <div class="table-responsive">
                          <div class="dataTables_wrapper">
                            <table id="J_Table" class="table table-striped table-bordered table-hover J_Table">
                              <thead>
                                <tr>
                                  <th class="center">
                                    <label>
                                      <input type="checkbox" class="ace J_SelectAll">
                                      <span class="lbl"></span>
                                    </label>
                                  </th>
                                  <th>ID</th>
                                  <th>名称</th>
                                  <th>等级</th>
                                  <th>父分类</th>
                                  <th>操作</th>
                                </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                  <form id="saveForm">
                                  <td class="center">
                                    <label>
                                      <input type="checkbox" class="ace J_SelectSub">
                                      <span class="lbl"></span>
                                    </label>
                                  </td>
                                  <td></td>
                                  <td> <input type="text"  id="cateName" name="cateName" placeholder="新增类别名称"/></td>
                                  <td> <input type="text" id="cateLevel_" name="cateLevel" placeholder=""/></td>
                                  <td> 
	                                  <select name="parentCateId">
	                                  	<option value="0">一级分类</option>
	                                  	<#if firstCateGorys?has_content>
	                                  	<#list firstCateGorys as info>
	                                  		<option value="${info.cateId}">${info.cateName}</option>
	                                  	</#list>
	                                  	</#if>
	                                  </select>
                                  </td>
                                  <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                      <button class="btn btn-xs btn-warning" type="button" onclick="check('','saveForm','${request.contextPath}/admin/console/productCategory/saveUpdate','refresh')">
                                        <i class="icon-ok bigger-120"> 添加 </i>
                                      </button>
                                    </div>
                                  </td>
                                </tr>
                                </form>
                              <#if infos?has_content>
                              <#list infos as info>
                                <tr>
                                 <form id="saveForm_${info.id}">
                                  <td class="center">
                                    <label>
                                      <input type="checkbox"  class="ace J_SelectSub">
                                      <span class="lbl"></span>
                                    </label>
                                    <input type="hidden" name="cateId"  value="${info.cateId}" />
                                  </td>
                                  <td>${info.cateId}</td>
                                  <td> <input type="text" name="cateName"  value="${info.cateName}"/></td>
                                  <td> <#if info.cateLevel?has_content && info.cateLevel==1>一级分类<#else>二级分类</#if></td>
                                  <td> <#if info.parentCateId?has_content><@yep.findProductCateNameById info.parentCateId/></#if></td>
                                  <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
									<#if  ((info.cateId)!0) gt 10>
                                      <button class="btn btn-xs btn-danger J_DeleteTr" type="button" data-value="${request.contextPath}/admin/console/productCategory/del?id=${info.cateId}" >
                                        <i class="icon-trash bigger-120"> 删除 </i>
                                      </button>
                                      <button class="btn btn-xs btn-info "  type="button" onclick="saveFormFun(${info.cateId},'saveForm_${info.cateId}','${request.contextPath}/admin/console/productCategory/saveUpdate','ajax')" >
                                        <i class="icon-edit bigger-120"> 保存 </i>
                                      </button>
								</#if>
                                    </div>
                                    <div class="visible-xs visible-sm hidden-md hidden-lg">
                                      <div class="inline position-relative">
                                        <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
                                          <i class="icon-cog icon-only bigger-110"></i>
                                        </button>
                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                          <li>
                                            <a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
                                              <span class="blue">
                                                <i class="icon-zoom-in bigger-120"></i>
                                              </span>
                                            </a>
                                          </li>
                                          <li>
                                            <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
                                              <span class="green">
                                                <i class="icon-edit bigger-120"></i>
                                              </span>
                                            </a>
                                          </li>
                                          <li>
                                            <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                              <span class="red">
                                                <i class="icon-trash bigger-120"></i>
                                              </span>
                                            </a>
                                          </li>
                                        </ul>
                                      </div>
                                    </div>
                                  </td>
                                  </form>
                                </tr>
                             </#list>
                             </#if>
                              </tbody>
                            </table>
                            <div class="row">
                              <div class="col-xs-6"></div>
                              <div class="col-xs-6">
                                <div class="dataTables_paginate paging_bootstrap">
                                 <ul class="pagination">
                                  	<#if page?has_content>
									<#assign pageUrl>
										<@yep.searchPageUrl request.requestUri 'pageNo=#' request.queryString/>
									</#assign>
									<#include "../common/pages.ftl">
									</#if>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div><!-- /.table-responsive -->
                      </div>
                    </div>
                </div><!-- /row -->
                <div class="hr hr32 hr-dotted"></div>
                <!-- PAGE CONTENT ENDS -->
              </div><!-- /.col -->
            </div><!-- /.row -->
          </div><!-- /.page-content -->
        <#include "../common/footer.ftl">
            <script type="text/javascript">
            function check(infoId,key, fromUrl, toUrl){
            	var a=$("#cateLevel_").val();
            	var b=$("#cateName").val();
            	if(a!=""&&b!=""){
            		saveFormFun(infoId,key, fromUrl, toUrl);
            	}else{
            		alert("请填写完整");
            	}
            	return;
            }
  function saveFormFun(infoId,key, fromUrl, toUrl){
 	var sort = $("#cateLevel_"+infoId).val();
 	if(checkNum(sort)){
 		saveForm(key,fromUrl,toUrl );
 	}else {
 		alert("排序为正数");
 	}
 }
 </script>
</#escape>