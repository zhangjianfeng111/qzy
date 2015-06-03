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
          出库单
        </small>
      </li>
    </ul><!-- .breadcrumb -->
  </div>

  <div class="page-content">
    <div class="page-header">
      <form id="searchFrom" class="form-inline">
          <div class="form-group">
            <label>订单号：</label>
            <input type="hidden" name="inOutFlag" value="1">
            <input class="input-small" type="text"  name="stockNo" value="${(searchBean.stockNo)!''}">
          </div>
          <div class="form-group">
          	<div class="input-group">
				出库时间：<input type="text"  name="stockTime" value="<#if (searchBean.stockTime)??>${searchBean.stockTime?string('yyyy-MM-dd')}</#if>" class="Wdate"  onFocus="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})"/>
			</div>
			</div>
			<div class="form-group">
            	<label>客户：</label>
            	<input class="input-small" type="text"  name="customerName" value="${(searchBean.customerName)!''}">
          	</div> 
          <div class="form-group">
            	<label>快递单号：</label>
            	<input class="input-small" type="text"  name="transportNum" value="${(searchBean.transportNum)!''}">
          </div>    
          <div class="form-group">
            	<label>联系方式：</label>
            	<input class="input-small" type="text"  name="customerPhone" value="${(searchBean.customerPhone)!''}">
          </div> 
          <div class="form-group">
            	<label>推荐人：</label>
            	<input class="input-small" type="text"  name="referrer" value="${(searchBean.referrer)!''}">
          </div>   
          <div class="form-group">
            <label for="form-field-select-1">出库类型：</label>
            <select class="select inline" name="stockType">
            <option value="" <#if !(searchBean.stockType)??>selected</#if>>全部</option>
            <option value="buy" <#if ((searchBean.stockType)!"")=="buy">selected</#if> >采购进货</option>
            <option value="sale_refund" <#if ((searchBean.stockType)!"")=="sale_refund">selected</#if> >销售退库</option>
            <option value="sale" <#if ((searchBean.stockType)!"")=="sale">selected</#if> >销售订单</option>
            <option value="buy_refund" <#if ((searchBean.stockType)!"")=="buy_refund">selected</#if> >采购退货</option>
            <option value="check" <#if ((searchBean.stockType)!"")=="check">selected</#if> >盘点</option>
            </select>
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
                          <th>客户</th>
                          <th>订单号</th>
                          <th>出库时间</th>
                          <th>出库类型</th>
                          <th>快递单号</th>
                          <th>快递</th>
                          <th>联系方式</th>
                          <th>负责人</th>
                          <th>推荐人</th>
                          <th>地址</th>
                          <th>运费</th>
                          <th>备注</th>
                          <th>操作</th>
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
                          <td>${stock.customerName}</td>
                          <td>${stock.stockNo}</td>
                          <td><#if stock.stockTime??>${stock.stockTime?string('yyyy-MM-dd')}</#if></td>
                          <td>
                          <#if stock.stockType?? && stock.stockType=="buy">采购进货</#if>
                          <#if stock.stockType?? && stock.stockType=="sale">销售订单</#if>
                          <#if stock.stockType?? && stock.stockType=="buy_refund">采购退货</#if>
                          <#if stock.stockType?? && stock.stockType=="sale_refund">销售退货</#if>
                          <#if stock.stockType?? && stock.stockType=="check">盘点</#if>
                          </td>
                          <td>${stock.transportNum}</td>
                          <td>${stock.transportName}</td>
                          <td>${stock.customerPhone}</td>
                          <td>${stock.stockUserName}</td>
                          <td>${stock.referrer}</td>
                          <td>${stock.address}</td>
                          <td>${stock.transportPrice}</td>
                          <td>
                          <#if stock.status?? && stock.status=="un">未确认</#if>
                          <#if stock.status?? && stock.status=="ok">已确认</#if>
                          <#if stock.status?? && stock.status=="no">已取消</#if>
                          </td>
                         
                          <td>
                              <a href="${request.contextPath}/admin/stock/findDetailStockByStockId/p1?stockId=${stock.stockId}&type=out" class="btn btn-xs btn-info">
                                <i class="icon-bolt bigger-120"> 查看详情 </i>
                              </a>
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