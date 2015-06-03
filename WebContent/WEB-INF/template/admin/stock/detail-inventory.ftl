<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>


<script language="javascript" type="text/javascript" src="${request.contextPath}/resources/admin/js/datepicker/WdatePicker.js"></script>
<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="#">库存管理</a>
        <small>
          <i class="icon-double-angle-right"></i>
          盘点
        </small>
      </li>
    </ul><!-- .breadcrumb -->
  </div>

  <div class="page-content">
    <div class="page-header">
      <form id="searchFrom" class="form-inline">
          <div class="form-group">
            <label>产品编号：</label>
            <input type="hidden" name="stockId" value="${stockId}">
            <input type="hidden" name="type" value="check">
            <input class="input-small" type="text"  name="productId" value="${(searchBean.productId)!''}">
          </div>
          <div class="form-group">
            <label>产品名称：</label>
            <input class="input-small" type="text"  name="productName" value="${(searchBean.productName)!''}">
          </div>
          <div class="form-group">
            <label>规格：</label>
            <input class="input-small" type="text"  name="skuValue" value="${(searchBean.skuValue)!''}">
          </div>
			<div class="form-group">
            	<label>供货来源：</label>
            	<input class="input-small" type="text"  name="supSkuCode" value="${(searchBean.supSkuCode)!''}">
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
                          <th>产品编号</th>
                          <th>产品名称</th>
                          <th>规格</th>
                          <th>供货来源</th>
                          <th>应有库存</th>
                          <th>实际库存</th>
                        </tr>
                      </thead>
                      <tbody>
                      <#if stocks?has_content>
                      <#list stocks as stock>
                        <tr>
                          <td class="center">
                            <label>
                              <input type="checkbox" class="ace J_SelectSub">
                              <span class="lbl"></span>
                            </label>
                          </td>
                          <td>${stock.productId}</td>
                          <td>${stock.productName}</td>
                          <td>${stock.skuValue}</td>
                          <td>${stock.supSkuCode}</td>
                          <td>${stock.planAmount}</td>
                          <td>${stock.actualAmount}</td>
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
  
  
<!--  日历插件-->
<script type="text/javascript">
      $(function(){
        $("#bootbox-regular").on("click", function() {
            $('#modal-table').removeClass('fade').show();
          });
        $('.close').click(function(){
            $('#modal-table').hide();
        });
        
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
					$(this).prev().focus();
		});
		
		
		
//	console.log("aaa");
		$(".shipNo").bind("change",function(){
			var  idStr = $(this).attr("id");
			var id =idStr.substr('deliveryNo_'.length);
			var shipNo = $(this).val();
			var  o = this;
			$.ajax({
 		   type: "POST",
 		   url:  '${request.contextPath}/admin/order/ship',
 		   data:  {"tradeId":id, "shipNo":shipNo  },
 		   success: function(data){
 		     if(data){
 		    	 bootbox.alert("保存成功");
 		    	 $(o).attr("disabled",true);
 		    	 $("#modify_"+id).html("修改");
 		    	setTimeout(function(){
 		    	 if ($("#save").attr("urlkey")) {
 		    		doBack($("#save").attr("urlkey"));
 		    		
 		    	 } else {
 		    		location.href = $('#saveForm').attr('action').replace("save/","list/p1/");
 		    	 }
 		    	 },3);
 		     }else{
 		    	bootbox.alert("保存失败");
 		     }
 		   },
 		   dataType: "json"
 		});
		})
		
      });
      
      
      function delivery(id){
      	$("#deliveryNo_"+id).attr("disabled",false).focus();
      }
      
      
      </script>
  
  
</#escape>