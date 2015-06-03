<#escape x as x!"">
<#include "../common/header.ftl">
<#import "../../common/common.ftl" as yep>
        </div>
        <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
              <li>
                <i class="icon-home home-icon"></i>
                <a href="#">商品</a>
                <small>
                  <i class="icon-double-angle-right"></i>
                   商品列表
                </small>
              </li>
            </ul><!-- .breadcrumb -->
          </div>
          <div class="page-content">
            <div class="page-header">
              <form class="form-inline"  action="${request.contextPath}/admin/console/product/list/p1">
                  <div class="form-group">
                    <label for="form-field-select-1">是否上架：</label>
                    <select class="select inline" name="sellStatus">
                    <option value="" <#if !(search.sellStatus)??>selected</#if> >全部</option>
                      <option value="1" <#if ((search.sellStatus)!-1)==1>selected</#if> >上架</option>
                      <option value="0" <#if ((search.sellStatus)!-1)==0>selected</#if> >下架</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="form-field-select-1">是否为团购：</label>
                    <select class="select inline" name="customerStatus">
                      <option value="1" <#if ((search.customerStatus)!-1)==1>selected</#if> >是团购</option>
                      <option value="0" <#if ((search.customerStatus)!-1)==0>selected</#if>>非团购</option>
                      <option value="" <#if !(search.customerStatus)??>selected</#if>>全部</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="form-field-select-1">是否为出租：</label>
                    <select class="select inline" name="depositStatus">
                      <option value="1" <#if ((search.depositStatus)!-1)==1>selected</#if> >是出租</option>
                      <option value="0" <#if ((search.depositStatus)!-1)==0>selected</#if>>非出租</option>
                      <option value="" <#if !(search.depositStatus)??>selected</#if>>全部</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="form-field-select-1">是否为家政：</label>
                    <select class="select inline" name="homeStatus">
                      <option value="1" <#if ((search.homeStatus)!-1)==1>selected</#if> >是家政</option>
                      <option value="0" <#if ((search.homeStatus)!-1)==0>selected</#if>>非家政</option>
                      <option value="" <#if !(search.homeStatus)??>selected</#if>>全部</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="form-field-select-1">类别：</label>
                    <!-- 全部的 产品类型-->
                    <select class="select inline" name="cateIds">
                     <option value="" <#if !(search.cateIds)??>selected</#if> >全部</option>
                     
                     <#if productCategories?has_content>
                     <#list productCategories as productCategory>
                     	<option <#if ((search.cateIds)!'')==(productCategory.cateCode)!''>selected</#if> value="${productCategory.cateCode}" > ${productCategory.cateName}</option>
                     </#list>
                     </#if>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>商品名称：</label>
                    <input class="input-small" name="productName" value="${(search.productName)!''}" type="text" id="">
                  </div>
                  <button class="btn btn-sm btn-primary"> 
                    <i class="icon-search align-top"></i>搜索 
                  </button>
					<a href="${request.contextPath}/admin/console/product/input">
                  <button  type="button" class="btn btn-warning" >
                    <i class="icon-plus align-top bigger-125"></i>添加商品
                  </button>
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
                                  <th>产品编号</th>
                                  <th>排序值</th>
                                  <th>展示</th>
                                  <th>团购</th>
                                  <th>出租</th>
                                  <th>家政</th>
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
                                    <input type="hidden" name="productId" value="${info.productId}" />
                                  </td>
                                  <td>${info.productId} </td>
                                  <td><img src="${request.contextPath}/resources/admin/store/${(info.imageNum)!'default_product.jpg'}" width="60" height="60"></td>
                                  <td>${info.productName}</td>
                                  <td>
                                  ${info.productNumber}
                                  </td>
                                  <td>${info.productOrder}</td>
                                  <td  id="upDown_${info.productId}"  data-type="sellStatus" class="changeStatus">
                                  	<#if ((info.sellStatus)!1)==0>下架 
                                  	<#else > 上架
                                  	</#if>
                                  </td>
                                  	<!--
                                  √ <a href="">下架</a></td>
                                  -->
                                  <td data-type="customerStatus" class="changeStatus">
                                  <!--
                                  × <a href="">作为团购</a>  -->
                                  <#if ((info.customerStatus)!1)==1>团购 
                                  	<#else> 非团购
                                  	</#if>
                                  </td>
                                   <td data-type="depositStatus" class="changeStatus">
                                  <#if ((info.depositStatus)!1)==1>出租 
                                  	<#else> 非出租
                                  	</#if>
                                  </td>
                                   <td data-type="homeStatus" class="homeStatus">
                                  <#if ((info.homeStatus)!1)==1>家政 
                                  	<#else> 非家政
                                  	</#if>
                                  </td>
                                  <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                    	
                                    		<button  id="do_upDown_${info.productId}" class="btn btn-xs btn-inverse upDown" data-id="${info.productId}"  data-status="${info.sellStatus}"  data-url="${request.contextPath}/admin/console/product/saveOrUpdate?productId=${info.productId}"> 
										<#if info.sellStatus?has_content && info.sellStatus ==1>
											下架
										<#else>
											上架
										</#if>	
										</button>	
                                    	
                                      <button class="btn btn-xs btn-danger J_DeleteTr" data-value="${request.contextPath}/admin/console/product/del?id=${info.productId}">
                                        <i class="icon-trash bigger-120"> 删除 </i>
                                      </button>
                                      <!-- <button class="btn btn-xs btn-primary look" data-value="${request.contextPath}/admin/console/product/detail?id=${info.productId}">
                                        <i class="icon-eye-open bigger-120"> 查看</i>
                                      </button>
                                     <button class="btn btn-xs btn-info" data-value="${request.contextPath}/admin/console/product/detail?id=${info.productId}">
                                        <i class="icon-edit bigger-120">查看 </i>
                                      </button>-->
                                      <button class="btn btn-xs btn-info look" data-value="${request.contextPath}/admin/console/product/input?id=${info.productId}">
                                        <i class="icon-edit bigger-120">编辑 </i>
                                      </button>
                                      
                                      <button class="btn btn-xs btn-warning toUrl" data-toUrl="${request.contextPath}/admin/day/input/${info.productId}">
                                        <i class="icon-edit bigger-120"><#if ((info.isday)!0)==1>优惠中..<#else>每日优惠</#if></i>
                                      </button>
                                    </div>
                                  </td>
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
     <script type="text/javascript">
         $(function(){
			$(".look").bind("click",function(){
			var url = $(this).attr("data-value");
			window.location.href = url;	
	});
})
	</script>
        <#include "../common/footer.ftl">
</#escape>
