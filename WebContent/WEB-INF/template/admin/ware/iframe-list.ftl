<#escape x as x!"">
<#include "../common/iframe-header.ftl">
<#import "../../common/common.ftl" as yep>
<div class="page-header">
  <form class="form-inline" id="saveForm"  action="${request.contextPath}/admin/ware/list/p1">
  		<input name="isIframe" value="true" type="hidden">
      <div class="form-group">
        <label>仓库名称：</label>
        <input class="input-small" type="text" id="" name="wareName">
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
                      <th>仓库名称</th>
                       <th>仓库编码</th>
                       <th>仓库类型</th>
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
                      <td><input type="text" id="${info.id}_name" value="${info.wareName}" readonly/></td>
                      <td><input type="text" id="${info.id}_code" value="${info.wareCode}" readonly/></td>
                      <td><input type="text" id="${info.id}_type" value="${info.wareType}" readonly/></td>
                      <td>
                        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                        	<button class="btn btn-xs btn-info" onclick="parent.selectWare('${info.id}', '${info.wareName}');">
                            	<i class="icon-edit bigger-120"> 选择 </i>
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
<script type="text/javascript">
	$(function(){
	$("#add").bind("click",function(){
		var url = $(this).attr("data-value");
		var name = $("#wareName").val();
		var code = $("#wareCode").val();
		var type = $("#wareType").val();
		$.ajax({
			type: "POST",
			url: url,
			data:{"wareName":name,"wareCode":code,"wareType":type}, 
			dataType: "json",
			async : false,
			success: function( data ){
				if(data.isSuccess){
					alert("操作成功！");
					location.reload(true);
				}else{
					alert("未知错误！");
				}
			}
		});	
	});
	//修改保存
	$(".save").bind("click",function(){
		var url = $(this).attr("data-value");
		var id = $(this).attr("data-id");
		var name = $('#'+id+'_name').val();
		var code = $('#'+id+'_code').val();
		var type = $('#'+id+'_type').val();
		$.ajax({
			type: "POST",
			url: url,
			data:{"id":id,"wareName":name,"wareCode":code,"wareType":type}, 
			dataType: "json",
			async : false,
			success: function( data ){
				if(data.isSuccess){
					alert("操作成功！");
					location.reload(true);
				}else{
					alert("未知错误！");
				}
			}
		});	
	});
})
</script>
</div><!-- /.page-content -->
  <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
<i class="icon-double-angle-up icon-only bigger-110"></i>
  </a>
</div><!-- /.main-container -->
</body>
</html>
</#escape>