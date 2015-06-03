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
              <div class="form-group">
                <label>用户：</label>
                <input name="cusMobile" value="${(bean.cusMobile)}" />
                <label>编码：</label>
                 <input name="exchangeNo" value="${(bean.exchangeNo)}" />
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
                              <th>编号</th>
                              <th>类别</th>
                              <th>金额</th>
                              <th>兑换用户</th>
                              <th>兑换时间</th>
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
                              <td>${info.exchangeNo}</td>
                              <td>${info.giftType}</td>
                              <td>${info.giftValue}</td>
                             
                              <td>${info.cusMobile}</td>
                              <td>
                              <#if info.createTime?has_content>${info.createTime?string("yyyy-MM-dd")}</#if></td>
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
  </div><!-- /.main-container-inner -->
  <a href="javascript:;" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="icon-double-angle-up icon-only bigger-110"></i>
  </a>
</div><!-- /.main-container -->
<#include "../common/footer.ftl">
</#escape>
