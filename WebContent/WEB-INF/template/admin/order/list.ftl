<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>


<script language="javascript" type="text/javascript" src="${request.contextPath}/resources/admin/js/datepicker/WdatePicker.js"></script>
<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="#">订单</a>
        <small>
          <i class="icon-double-angle-right"></i>
           订单列表
        </small>
      </li>
    </ul><!-- .breadcrumb -->
  </div>

  <div class="page-content">
    <div class="page-header">
      <form id="searchFrom" class="form-inline">
          <div class="form-group">
            <label for="form-field-select-1">状态：</label>
            <select class="select inline" name="orderStatus">
              <!--'un_audit=未审核 pass=已审核，wait_ship=待发货 ship=已发货 canceled=交易取消 success=成功-->
            <option value="" <#if !(bean.orderStatus)??>selected</#if>>全部</option>
            <option value="un_audit" <#if ((bean.orderStatus)!"")=="un_audit">selected</#if> >未付款</option>
         <!--   <option value="pass" <#if ((bean.orderStatus)!"")=="pass">selected</#if> >待发货</option> -->
            <option value="wait_ship" <#if ((bean.orderStatus)!"")=="wait_ship">selected</#if> >待发货</option>
            <option value="ship" <#if ((bean.orderStatus)!"")=="ship">selected</#if> >已发货</option>
            <!--
            <option value="canceled" <#if ((bean.orderStatus)!"")=="canceled">selected</#if> >交易取消</option>
            -->
            <option value="success" <#if ((bean.orderStatus)!"")=="success">selected</#if> >完结</option>

            </select>
          </div>
          
          <div class="form-group">
            <label>商务编号：</label>
            <input class="input-small" type="text" id="" name="orderCode" value="${(bean.orderCode)!''}">
          </div>
          
          <!--
          <div class="form-group">
            <label>订单ID：</label>
            <input class="input-small" type="text" id="" name="orderId" value="${(bean.orderId)!''}">
          </div>
          -->
          <div class="form-group">
            <label>姓名：</label>
            <input class="input-small" type="text" id="" name="receiverName" value="${(bean.receiverName)!''}">
          </div>
          
            <div class="form-group">
            <label>电话：</label>
            <input class="input-small" type="text" id="" name="receiverMobile" value="${(bean.receiverMobile)!''}">
          </div>
          
          <div class="form-group">
          	<div class="input-group">
											<input type="text"  name="payTimeStart" value="<#if (bean.payTimeStart)??>${bean.payTimeStart?string('yyyy-MM-dd HH:mm')}</#if>" class="Wdate"  onFocus="WdatePicker({startDate:'%y-%M-01 00:00',dateFmt:'yyyy-MM-dd HH:mm',alwaysUseStartDate:true})"/>
						</div>
			</div>
			
			
			<div class="form-group">
          	  <div class="input-group">
											<input type="text"  name="payTimeEnd" value="<#if (bean.payTimeEnd)??>${bean.payTimeEnd?string('yyyy-MM-dd HH:mm')}</#if>" class="Wdate"  onFocus="WdatePicker({startDate:'%y-%M-01 00:00',dateFmt:'yyyy-MM-dd HH:mm',alwaysUseStartDate:true})"/>
					
										</div>
			</div>
          
          <button class="btn btn-sm btn-primary"> 
            <i class="icon-search align-top"></i>搜索 
          </button>
          
          <a href="${request.contextPath}/admin/order/exportExcel2/?payStatus=pay_ok<#if (bean.payTimeStart)??>&payTimeStart=${bean.payTimeStart?string('yyyy-MM-dd HH:mm')}</#if><#if (bean.payTimeEnd)??>&payTimeEnd=${bean.payTimeEnd?string('yyyy-MM-dd HH:mm')}</#if><#if (bean.orderStatus)?has_content>&orderStatus=${bean.orderStatus}</#if>" class="btn btn-sm btn-warning"> 
            订单下载 
          </a>
          <a href="${request.contextPath}/admin/order/exportExcel3/?payStatus=pay_ok<#if (bean.payTimeStart)??>&payTimeStart=${bean.payTimeStart?string('yyyy-MM-dd HH:mm')}</#if><#if (bean.payTimeEnd)??>&payTimeEnd=${bean.payTimeEnd?string('yyyy-MM-dd HH:mm')}</#if><#if (bean.orderStatus)?has_content>&orderStatus=${bean.orderStatus}</#if>" class="btn btn-sm btn-warning"> 
            订单产品下载 
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
                          <th>ID</th>
                          <th>物流编号</th>
                          <th>支付时间</th>
                          <th>收货人</th>
                          <th>地址</th>
                          <th>总金额</th>
                          <th>订单状态</th>
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
                          <td>${info.orderId}</td>
                          <!--
                          <td>${info.orderCode}</td>
                          -->
                          <td>
                          
                          	<#if  ((info.orderStatus)!"un_audit") !="un_audit">
                          	<input id="deliveryNo_${info.orderId}"  	<#if (info.shipNo)??> disabled</#if>  class="shipNo" type="text" name=""    value="${(info.shipNo)!''}"  />
                          	</#if>
                          </td>
                          
                          <td><#if info.payTime?has_content>${info.payTime?string("yyyy-MM-dd HH:mm:ss")}</#if></td>
                          <td>${info.receiverName} ${info.receiverMobile}</td>
                          <td>
               		           <@yep.loadRegionName (info.receiverState)!'' />
							<@yep.loadRegionName (info.receiverCity)!'' />
							<@yep.loadRegionName (info.receiverDistrict)!''/>
                           ${info.receiverAddress}</td>
                          <td>${info.totalFee}</td>
                          <td>
                          
                          <#if ((info.orderStatus)!"un_audit")=="un_audit">未付款 
                          </#if>
                          <#if ((info.orderStatus)!"un_audit")=="pass">待发货
                          </#if>
                          <#if ((info.orderStatus)!"un_audit")=="wait_ship">待发货
                          </#if>
                          <#if ((info.orderStatus)!"un_audit")=="ship">已发货
                          </#if>
                          <#if ((info.orderStatus)!"un_audit")=="canceled">交易取消 
                          </#if>
                          <#if ((info.orderStatus)!"un_audit")=="refund">申请退款 
                          </#if>
                           <#if ((info.orderStatus)!"un_audit")=="success"> 完结
                          </#if>
                          </td>
                          <td>
                            <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                            
                            	<#if ((info.orderStatus)!"un_audit")=="wait_ship" ||  ((info.orderStatus)!"un_audit")=="ship">
                            		<a href="javascript:delivery(${info.orderId});" class="btn btn-xs btn-danger">
                              
                                <i class="icon-bolt bigger-120" id="modify_${info.orderId}" > <#if info.shipStatus=='sended'> 修改  <#else>去发货 </#if></i>
                              </a>
                              </#if>
                              <#if info.shipStatus?has_content && info.shipStatus=='nosend'>
                              </#if>
                              <a href="${request.contextPath}/admin/order/input?orderId=${info.orderId}" class="btn btn-xs btn-info">
                                <i class="icon-bolt bigger-120"> 查看详情 </i>
                              </a>
                            </div>
                            <div class="visible-xs visible-sm hidden-md hidden-lg">
                              <div class="inline position-relative">
                                <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
                                  <i class="icon-cog icon-only bigger-110"></i>
                                </button>
                                <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                  <li>
                                    <a href="${request.contextPath}/admin/order/input.html?orderId=${info.orderId}" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
                                      <span class="blue">
                                        <i class="icon-zoom-in bigger-120"></i>
                                      </span>
                                    </a>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </td>
                        </tr>
                        <tr>
                        	<td colspan="9">
                        	订单编号:${info.orderCode}<br/>
                        	
                        	发票类型:  <#if  ((info.invoiceType)!'') =='no' >无发票
                        					<#elseif  ((info.invoiceType)!'') =='common' >  个人
                        					<#elseif  ((info.invoiceType)!'') =='added' > 公司
                        					<#else> 无发票
                        					</#if>
                        ,	发票抬头：${(info.invoiceTitle)!''},
                        	备注:${(info.orderRemark)!''} ,
                      
                      水果:  	${(info.saleName)!''}
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