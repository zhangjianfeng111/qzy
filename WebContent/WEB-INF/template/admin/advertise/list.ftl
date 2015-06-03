 <#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
        <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">


            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="${request.contextPath}/admin/advertise/list/p1">广告</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   广告列表
                </small>
              </li>
            </ul><!-- .breadcrumb -->

          </div>

          <div class="page-content">
            <div class="page-header">

              <form class="form-inline" id="saveForm"  action="${request.contextPath}/admin/advertise/list/p1">

                  <div class="form-group">
                    <label>标题：</label>
                    <input class="input-small" type="text" id="" name="advName">
                  </div>

                  <button class="btn btn-sm btn-primary"> 
                    <i class="icon-search align-top"></i>搜索 
                  </button>
                  
                   <button  type="button" class="btn btn-warning toUrl" data-toUrl="${request.contextPath}/admin/advertise/new?areaId=${bean.areaId}">                  	
                    <i class="icon-plus align-top bigger-125"></i>添加广告
                  </button>

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
                                  <th>图片</th>
                           
                                  <th>标题</th>
                                  <th>链接</th>
                                  <th>操作</th>
                                </tr>
                              </thead>

                              <tbody>
                      <#if infos?has_content>
                          <#list infos as info>
                                <tr>
                                  <td class="center">
                                    <label>
                                      <input type="checkbox" class="ace J_SelectSub">
                                      <span class="lbl"></span>
                                    </label>
                                  </td>
								  <td><img src="${request.contextPath}/resources/admin/store/${info.advImg}" width="80"/></td>
                                  
                                  <td>${info.advName}</td>
                                  <td>${info.advLinkAddress}</td>
                                  
                                  <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">

                                      <button class="btn btn-xs btn-danger J_DeleteTr" data-value="${request.contextPath}/admin/advertise/delete/${info.id}">
                                        <i class="icon-trash bigger-120"> 删除 </i>
                                      </button>
                                      
                                       <button class="btn btn-xs btn-primary toUrl" data-toUrl="${request.contextPath}/admin/advertise/input/${info.id}">
                                        <i class="icon-eye-open bigger-120">编辑 </i>
                                      </button>
                                      


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
        </div><!-- /.main-content -->
        <#include "../common/footer.ftl">
</#escape>