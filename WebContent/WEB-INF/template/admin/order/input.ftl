<#escape x as x!"">
<#include "../common/header.ftl">
<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="${request.contextPath}/admin/order/list/p1.html">订单</a>
        <small>
          <i class="icon-double-angle-right"></i>
           订单详情
        </small>
      </li>
    </ul><!-- .breadcrumb -->
  </div>
  <div class="page-content">
    <div class="row">
      <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <div class="row">
          <div class="col-sm-12">
            <h3 class="row header smaller lighter blue">
              <span class="col-xs-6"> 订单信息 </span><!-- /span -->
            </h3>
            <div id="accordion" class="accordion-style1 panel-group accordion-style2">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                      <i class="icon-angle-down bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>
                      &nbsp;基本信息
                    </a>
                  </h4>
                </div>
                <div class="panel-collapse collapse in" id="collapseOne">
                  <div class="panel-body">
                    <div class="profile-user-info profile-user-info-striped">
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 订单号 </div>
                        <div class="profile-info-value">
                          <span class="editable" >${info.orderCode}</span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 购货人 </div>
                        <div class="profile-info-value">
                          <span>${info.createUser}</span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 订单状态 </div>
                        <div class="profile-info-value">
                          <span class="editable" >
                          
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
                         </span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 下单时间 </div>
                        <div class="profile-info-value">
                          <span class="editable" ><#if info.orderTime?has_content>${info.orderTime?string("yyyy-MM-dd HH:mm:ss")}</#if></span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 付款时间 </div>
                        <div class="profile-info-value">
                          <span class="editable" ><#if info.payTime?has_content>${info.payTime?string("yyyy-MM-dd HH:mm:ss")}</#if></span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 发货时间 </div>
                        <div class="profile-info-value">
                          <span class="editable" id="about"><#if info.shipTime?has_content>${info.shipTime?string("yyyy-MM-dd HH:mm:ss")}<#else>未发货</#if></span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 物流单号 </div>
                        <div class="profile-info-value">
                          <span class="editable" id="about">${info.shipNo}</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                      <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>
                      &nbsp;收货信息
                    </a>
                  </h4>
                </div>
                <div class="panel-collapse collapse" id="collapseTwo">
                  <div class="panel-body">
                    <div class="profile-user-info profile-user-info-striped">
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 姓名 </div>
                        <div class="profile-info-value">
                          <span class="editable" >${info.receiverName}</span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 电话 </div>
                        <div class="profile-info-value">
                          <span>${info.receiverMobile}</span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 地址 </div>
                        <div class="profile-info-value">
                          <span class="editable" >${info.receiverAddress}</span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 发票类型 </div>
                        <div class="profile-info-value">
                          <span class="editable" >${info.invoiceType}</span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 发票抬头 </div>
                        <div class="profile-info-value">
                          <span>${info.invoiceTitle}</span>
                        </div>
                      </div>
                      <div class="profile-info-row">
                        <div class="profile-info-name"> 备注 </div>
                        <div class="profile-info-value">
                          <span class="editable" >${info.sellerRemarkStatus}</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                      <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>
                      &nbsp;商品信息
                    </a>
                  </h4>
                </div>
                <div class="panel-collapse collapse" id="collapseFive">
                  <div class="panel-body">
                    <table id="J_Table" class="table table-striped table-bordered table-hover J_Table">
                      <thead>
                        <tr>
                          <th>名称</th>
                          <th>货号（ID）</th>
                          <th>价格</th>
                          <th>数量</th>
                          <th>小计</th>
                        </tr>
                      </thead>
                      <tbody>
                      <#if productInfos?has_content>
                      <#list productInfos as pinfo>
                        <tr>
                          <td>${pinfo.productName}</td>
                          <td>${pinfo.sukCode}</td>
                          <td>${pinfo.productPrice}</td>
                          <td>${pinfo.productNumber}</td>
                          <td>${pinfo.totalFee}</td>
                        </tr>
                        </#list>
                        </#if>
                      </tbody>
                    </table>
                    <span>总计：￥${info.totalFee}</span>
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                      <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>
                      &nbsp;操作信息
                    </a>
                  </h4>
                </div>
                <div class="panel-collapse collapse" id="collapseSix">
                  <div class="panel-body">
                  	<#if info.orderStatus?has_content && info.orderStatus != 'un_audit' && info.shipStatus?has_content && info.shipStatus == "nosend">
                  	物流单号：<input type="text" id="J_shipNo"/>
                  	</#if>
                    备注： <textarea cols="80" rows="3" id="J_content"></textarea>
                    <#if info.orderStatus?has_content && info.orderStatus == 'un_audit'>
                  <!--  <button onclick="updateStatus('${info.orderId}', 'auditpass');" class="btn btn-sm btn-primary"> 
                      <i class="icon-edit align-top"></i>确认订单
                    </button> -->
                    <button onclick="updateStatus('${info.orderId}', 'ship');" class="btn btn-sm btn-primary"> 
                      <i class="icon-edit align-top"></i>发货
                    </button>
                    <#elseif info.shipStatus?has_content && info.shipStatus == "nosend">
                    <button onclick="updateStatus('${info.orderId}', 'ship');" class="btn btn-sm btn-primary"> 
                      <i class="icon-edit align-top"></i>发货
                    </button>
                    </#if>
                    <#if info.shipStatus?has_content && info.shipStatus == "nosend" && info.orderStatus != "canceled">
                    <button onclick="updateStatus('${info.orderId}', 'auditcancel');" class="btn btn-sm btn-warning"> 
                      <i class="icon-ban-circle align-top"></i>取消订单
                    </button>
                    </#if>
                    (随订单状态修改按钮字的内容：确认订单/发货)
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                      <i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>
                      &nbsp;操作记录
                    </a>
                  </h4>
                </div>
                <div class="panel-collapse collapse" id="collapseFour">
                  <div class="panel-body">
                    <table  class="table table-striped table-bordered table-hover J_Table">
                      <thead>
                        <tr>
                          <th>订单状态</th>
                          <th>状态修改时间</th>
                          <th>备注</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<#if orderLogs?has_content>
                      	<#list orderLogs as log>
                        <tr>
                          <td>${log.tradeStatus}</td>
                          <td><#if log.createTime?has_content>${log.createTime?string("yyyy-MM-dd HH:mm:ss")}</#if></td>
                          <td>${log.content}</td>
                        </tr>
                        </#list>
                        </#if>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- /span -->
        </div><!-- /row -->
        <div class="hr hr32 hr-dotted"></div>
        <!-- PAGE CONTENT ENDS -->
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.page-content -->
</div><!-- /.main-content -->
<script src="${request.contextPath}/resources/admin/js/common/order.js"></script>
<#include "../common/footer.ftl">
</#escape>