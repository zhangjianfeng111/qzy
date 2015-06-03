<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
        <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">


            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="${request.contextPath}/admin/sys/list/p1">系统设置</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   系统设置
                </small>
              </li>
            </ul><!-- .breadcrumb -->

          </div>

          <div class="page-content">
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
                                  <th>邮费</th>
                                  <th>满多少包邮</th>
                                  <th>满多少送多少</th>
                                  <th>红包金额（范围）</th>
                                  <th>红包启用价格</th>
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

                                  <td><input type="text" id="id1" value="${info.cfgPostalFees}" /></td>
                                  <td> <input type="text" id="id2" value="${info.cfgFreePrice}" /></td>
                                  <td><input type="text" id="id3" value="${info.cfgFullPrice}" placeholder="满多少送多少"/></td>
                                  <td><input type="text" id="id4" value="${info.cfgSendPrice}" placeholder="红包范围"/></td>
                                  <td><input type="text" id="id5" value="${info.cfgRedPrice}" /></td>
                                  
                                  <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">

                                      <button class="btn btn-xs btn-info" id="savesys" data-value="${request.contextPath}/admin/sys/save"  >
                                        <i class="icon-edit bigger-120"> 保存 </i>
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
        <script type="text/javascript">
	$(function(){
	
	
	$("#savesys").bind("click",function(){
		var url = $(this).attr("data-value");
		var id = "sysconfig";
		var id1 = $("#id1").val();
		var id2 = $("#id2").val();
		var id3 = $("#id3").val();
		var id4 = $("#id4").val();
		var id5 = $("#id5").val();		
		$.ajax({
 		   type: "POST",
 		   url: url,
 		   data:{"cfgCode":id,"cfgPostalFees":id1,"cfgFreePrice":id2,"cfgFullPrice":id3,"cfgSendPrice":id4,"cfgRedPrice":id5},
 		   success: function(data){
 		     if(data.isSuccess){
					alert("操作成功！");
					location.reload(true);
				}else{
					alert("未知错误！");
				}
 		    	 
 		   },
 		   dataType: "json"
 		});
 		
 		
	});
})
	</script>
        <#include "../common/footer.ftl">
</#escape>