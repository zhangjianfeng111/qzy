<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
        <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">


            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="#">会员</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   会员列表
                </small>
              </li>
            </ul><!-- .breadcrumb -->

          </div>

          <div class="page-content">
            <div class="page-header">

              <form class="form-inline" id="saveForm"  action="${request.contextPath}/admin/member/list/p1">

                  <div class="form-group">
                    <label>手机：</label>
                    <input class="input-small" type="text" id="" name="mobile">
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
                                  <th>ID</th>
                                  <th>姓名</th>
                                  <th>余额</th>
                                  <th>注册时间</th>
                                  <th>手机</th>
                                  <th>默认收货地址</th>
                                  <th>操作</th>
                                </tr>
                              </thead>

                              <tbody>
                      <#if infos?has_content>
                          <#list infos as info>
                                <tr>
                                  <td class="center">
                                    <label>
                                      <input name="ids" type="checkbox" value="${info.cusId}" class="ace J_SelectSub">
                                      <span class="lbl"></span>
                                    </label>
                                  </td>

                                  <td>${info.cusId}</td>
                                  <td>${info.name}</td>
                                  <td>${info.balance}</td>
                                  <td><#if info.createTime?has_content>${info.createTime?string("yyyy-MM-dd HH:mm:ss")}</#if></td>
                                  <td>${info.mobile} </td>
                                  <td>${info.address} </td>
                                  <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">

                                      <a class="btn btn-xs btn-danger " onclick="freeze('${request.contextPath}/admin/member/freeze',${info.isFreeze},${info.cusId});">
                                        <i class="icon-trash bigger-120"> <#if info.isFreeze == 0 >冻结</#if><#if info.isFreeze == 1 >解冻</#if> </i>
                                      </a>
                                      
                                      <button class="btn btn-xs btn-info look" data-value ="${request.contextPath}/admin/member/sendinput?ids=${info.cusId}">
                                        <i class="icon-edit bigger-120"> 发红包 </i>
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
                        <form class="form-inline ">
                            <button class="btn btn-warning removeall" type="button" data-url="${request.contextPath}/admin/member/sendinputall" data-tourl="${request.contextPath}/admin/member/list/p1">
                                                群发红包
                            </button>
                            </form>
                           

                      </div>


                          
                    </div>
                    
                </div><!-- /row -->

                <div class="hr hr32 hr-dotted"></div>


                <!-- PAGE CONTENT ENDS -->
              </div><!-- /.col -->
            </div><!-- /.row -->


          </div><!-- /.page-content -->
        </div><!-- /.main-content -->
              <script type="text/javascript">
         $(function(){
			$(".look").bind("click",function(){
			var url = $(this).attr("data-value");
			window.location.href = url;	
	});
})

function freeze(furl,id,cusId){
	$.ajax({
		   type: "GET",
		   url: furl,
		   data: {
		   "id":id,
		   "cusId" : cusId 
		   },
		   success: function(data){
		     if(data.isSuccess){
		    	 location.href=location.href;
		    	alert("操作成功");
		     }else{
		    	alert("保存失败");
		     }
		   },
		   dataType: "json"
		});
}
	</script>
        <#include "../common/footer.ftl">
</#escape>