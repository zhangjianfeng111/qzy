<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="#">企业订单</a>
        <small>
          <i class="icon-double-angle-right"></i>
           企业订单列表
        </small>
      </li>
    </ul><!-- .breadcrumb -->
  </div>
  <div class="page-content">
    <div class="page-header">
      <form class="form-inline">
          <div class="form-group">
            <label>公司名称：</label>
            <input class="input-small" value="" type="text" id="">
          </div>
          <button class="btn btn-sm btn-primary"> 
            <i class="icon-search align-top"></i>搜索 
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
                          <th>姓名</th>
                          <th>联系电话</th>
                          <th>提交时间</th>
                          <th>公司名称</th>
                          <th>需求内容</th>
                          <th>状态</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="center">
                            <label>
                              <input type="checkbox" class="ace J_SelectSub">
                              <span class="lbl"></span>
                            </label>
                          </td>
                          <td>张珊珊</td>
                          <td>15900998899</td>
                          <td>2015-2-1 11:00:00</td>
                          <td>杭州联华科技</td>
                          <td>杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技杭州联华科技</td>
                          <td>已回复</td>
                          <td>
                            <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                              <button class="btn btn-xs btn-danger J_DeleteTr">
                                <i class="icon-trash bigger-120"> 删除 </i>
                              </button>
                              <button class="btn btn-xs btn-info J_DeleteTr">
                                <i class="icon-check bigger-120"> 已回复 </i>
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