<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<div class="main-content">
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li>
            <i class="icon-home home-icon"></i>
            <a href="#">礼券</a>
            <small>
              <i class="icon-double-angle-right"></i>
               礼券列表
            </small>
          </li>
        </ul><!-- .breadcrumb -->
      </div>
      <div class="page-content">
        <div class="page-header">
          <form class="form-inline">
          	<!--
              <div class="form-group">
                    <label for="form-field-select-1">是否上架：</label>
                    <select class="select inline" name="status">
                    <option value="" <#if !(search.status)??>selected</#if> >全部</option>
                      <option value="show" <#if ((search.status)!'')=='show'>selected</#if> >上架</option>
                      <option value="down" <#if ((search.status)!'')=='down'>selected</#if> >下架</option>
                    </select>
              </div>
              -->
              <div class="form-group">
                <label for="form-field-select-1">类别：</label>
                <select class="select inline" name="giftType">
                <option value="" <#if !(bean.giftType)??>selected</#if> >全部</option>
                <option value="pap" <#if ((bean.giftType)!"")=="pap">selected</#if> >实体卡</option>
                <option value="ele" <#if ((bean.giftType)!"")=="ele">selected</#if> >电子券</option>
                </select>
              </div>
              <div class="form-group">
                <label>礼券名称：</label>
                <input class="input-small" type="text" name="giftName" id=""  value="${(bean.giftName)!''}" >
              </div>
              <button class="btn btn-sm btn-primary"> 
                <i class="icon-search align-top"></i>搜索 
              </button>
              <a href="${request.contextPath}/admin/giftinfo/add" class="btn btn-warning">
                <i class="icon-plus align-top bigger-125"></i>添加礼券
              </a>
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
                              <th >ID</th>
                              <th>图片</th>
                              <th>名称</th>
                              <th>类别</th>
                              <th>排序值</th>
                              <!--
                              <th>展示</th>
                              -->
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
                              <td>${info.id}</td>
                              <td><img src="<#if info.giftImage?has_content>${request.contextPath}/resources/admin/store/${info.giftImage}<#else>${request.contextPath}/resources/admin/images/shuiguo.jpg</#if>" width="60" height="60"></td>
                              <td>${info.giftName}</td>
                              <td><#if ((info.giftType)!'')=='ele'>电子券<#else>实体卡</#if></td>
                              <td>${info.giftOrder}</td>
                              <!--
                              <td><#if ((info.status)!'')=='show'>√ <a href="">上架<#else>× <a href="">下架</#if></td>
                              -->
                              <td>
                                <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                  <button class="btn btn-xs btn-danger J_DeleteTr" data-value="${request.contextPath}/admin/giftinfo/delete/${info.id}/">
                                    <i class="icon-trash bigger-120"> 删除 </i>
                                  </button>
                                  <a class="btn btn-xs btn-primary" href="${request.contextPath}/admin/giftinfo/detail/${info.id}/">
                                    <i class="icon-eye-open bigger-120"> 查看</i>
                                  </a>
                                  <a class="btn btn-xs btn-info" href="${request.contextPath}/admin/giftinfo/input/${info.id}/">
                                    <i class="icon-edit bigger-120">编辑 </i>
                                  </a>
                                </div>
                                <div class="visible-xs visible-sm hidden-md hidden-lg">
                                  <div class="inline position-relative">
                                    <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
                                      <i class="icon-cog icon-only bigger-110"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                      <li>
                                        <a href="${request.contextPath}/admin/giftinfo/view/${info.id}/" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
                                          <span class="blue">
                                            <i class="icon-zoom-in bigger-120"></i>
                                          </span>
                                        </a>
                                      </li>
                                      <li>
                                        <a href="${request.contextPath}/admin/giftinfo/input/${info.id}/" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
                                          <span class="green">
                                            <i class="icon-edit bigger-120"></i>
                                          </span>
                                        </a>
                                      </li>
                                      <li>
                                        <a href="#" class="tooltip-error J_DeleteTr" data-value="${request.contextPath}/admin/giftinfo/delete/${info.id}/" data-rel="tooltip" title="" data-original-title="Delete">
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
