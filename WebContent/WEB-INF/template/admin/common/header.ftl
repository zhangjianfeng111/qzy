<#escape x as x!"">
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>控制台</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="${request.contextPath}/resources/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${request.contextPath}/resources/admin/assets/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <!-- ace styles -->
    <link rel="stylesheet" href="${request.contextPath}/resources/admin/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${request.contextPath}/resources/admin/assets/css/qfc-min.css" />
    <!--[if lte IE 8]>
      <link rel="stylesheet" href="${request.contextPath}/resources/admin/assets/css/ace-ie.min.css" />
    <![endif]-->
    <!-- ace settings handler -->
    <script src="${request.contextPath}/resources/admin/assets/js/ace-extra.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${request.contextPath}/resources/admin/assets/js/html5shiv.js"></script>
    <script src="${request.contextPath}/resources/admin/assets/js/respond.min.js"></script>
    <![endif]-->
    
    <!--[if !IE]> -->
    <script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->
    <!--[if !IE]> -->
    <!-- <![endif]-->
    <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${request.contextPath}/resources/admin/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->
    <script type="text/javascript">
	var SG = SG || {data:{},util:{}};
	SG.config = {path:{rootPath:"${request.contextPath}"}}
	var YS = YS || {data:{},util:{}};
	YS.config = {path:{rootPath:"${request.contextPath}"}}
	</script>
	
  </head>
  <body>
    <div class="navbar navbar-default" id="navbar">
      <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
          <a href="#" class="navbar-brand">
            <small>
              <i class="icon-leaf"></i>
              后台管理系统
            </small>
          </a><!-- /.brand -->
        </div><!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
          <ul class="nav ace-nav">
            <li class="light-blue">
              <a  href="${request.contextPath}/admin/console/loginout" >
                <span class="user-info">
                 退出
                </span>
              </a>
            </li>
          </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
      </div><!-- /.container -->
    </div>
    <div class="main-container" id="main-container">
      <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
          <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
          <ul class="nav nav-list">
            <li class="<#if request.requestUri?index_of('/admin/order/list') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/order/list/p1">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 订单列表 </span>
              </a>
            </li>
            <li class="<#if request.requestUri?index_of('/admin/comporder/list') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/comporder/list/p1" class="dropdown-toggle">
                <i class="icon-desktop"></i>
                <span class="menu-text"> 企业订单 </span>
               
              </a>
            </li>
            <li class="<#if request.requestUri?index_of('/admin/member/list') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/member/list/p1" class="dropdown-toggle">
                <i class="icon-list"></i>
                <span class="menu-text"> 会员列表 </span>
              </a>
            </li>
            <li  <#if (request.requestUri?index_of('admin/console/product/list') gt -1) 
            || (request.requestUri?index_of('admin/console/product/input') gt -1) 
            ||  (request.requestUri?index_of('admin/console/productCategory/list') gt -1)  > 
            class="open" </#if> >
              <a href="#" class="dropdown-toggle">
                <i class="icon-edit"></i>
                <span class="menu-text"> 商品 </span>
                <b class="arrow icon-angle-down"></b>
              </a>
              
              
              <ul class="submenu" <#if (request.requestUri?index_of('admin/console/product/list') gt -1) 
            || (request.requestUri?index_of('admin/console/product/input') gt -1) 
            ||  (request.requestUri?index_of('admin/console/productCategory/list') gt -1) 
             > 
             style="display: block;" </#if> >
                <li class="<#if request.requestUri?index_of('/admin/console/product/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/console/product/list/p1">
                    <i class="icon-double-angle-right"></i>
                    商品列表
                  </a>
                </li>
                <li class="<#if request.requestUri?index_of('/admin/console/product/input') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/console/product/input">
                    <i class="icon-double-angle-right"></i>
                    添加商品
                  </a>
                </li>
           		<li class="<#if request.requestUri?index_of('/admin/console/productCategory/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/console/productCategory/list/p1">
                    <i class="icon-double-angle-right"></i>
                    商品类别列表
                  </a>
                </li>
              </ul>
            </li>
			<li  <#if (request.requestUri?index_of('admin/giftlog/list') gt -1) 
            || (request.requestUri?index_of('admin/giftinfo/add') gt -1) 
            ||  (request.requestUri?index_of('admin/giftinfo/list') gt -1)  > 
            class="open" </#if>  >
              <a  class="dropdown-toggle">
                <i class="icon-tag"></i>
                <span class="menu-text"> 礼券 </span>

                <b class="arrow icon-angle-down"></b>
              </a>
              <ul class="submenu"  <#if (request.requestUri?index_of('admin/giftlog/list') gt -1) 
            || (request.requestUri?index_of('admin/giftinfo/add') gt -1) 
            ||  (request.requestUri?index_of('admin/giftinfo/list') gt -1)  > 
            style="display: block;" </#if>  >
                
                <li class="<#if request.requestUri?index_of('/admin/giftlog/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/giftlog/list/p1">
                    <i class="icon-double-angle-right"></i>
                    礼券兑换
                  </a>
                </li>

                <li class="<#if request.requestUri?index_of('/admin/giftinfo/add') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/giftinfo/add">
                    <i class="icon-double-angle-right"></i>
                    添加礼券
                  </a>
                </li>
                
                <li class="<#if request.requestUri?index_of('/admin/giftinfo/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/giftinfo/list/p1">
                    <i class="icon-double-angle-right"></i>
                    礼券列表
                  </a>
                </li>
              </ul>
            </li>
            
            <li  <#if (request.requestUri?index_of('admin/tie/list') gt -1) 
            || (request.requestUri?index_of('admin/tie/addtieview') gt -1) > 
            
            class="open" </#if>  >
              <a  class="dropdown-toggle">
                <i class="icon-tag"></i>
                <span class="menu-text"> 搭配套餐 </span>

                <b class="arrow icon-angle-down"></b>
              </a>
              <ul class="submenu"  <#if (request.requestUri?index_of('admin/giftlog/list') gt -1) 
            || (request.requestUri?index_of('admin/giftinfo/add') gt -1) 
            ||  (request.requestUri?index_of('admin/giftinfo/list') gt -1)  > 
            style="display: block;" </#if>  >
                
                <li class="<#if request.requestUri?index_of('/admin/tie/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/tie/list/p1">
                    <i class="icon-double-angle-right"></i>
                    搭配套餐列表
                  </a>
                </li>

                <li class="<#if request.requestUri?index_of('/admin/tie/addtieview') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/tie/addtieview">
                    <i class="icon-double-angle-right"></i>
                    添加搭配套餐
                  </a>
                </li>
              
              </ul>
            </li>
            
            
            <li class="<#if request.requestUri?index_of('/admin/comment/list') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/comment/list/p1">
                <i class="icon-shopping-cart"></i>
                <span class="menu-text"> 评论 </span>
              </a>
            </li>
            <li  <#if (request.requestUri?index_of('admin/news/list') gt -1) 
            || (request.requestUri?index_of('admin/news/new') gt -1) 
            ||  (request.requestUri?index_of('admin/advertiseplace/list') gt -1)  > 
            class="open" </#if>  >
              <a href="#" class="dropdown-toggle">
                <i class="icon-list-alt"></i>
                <span class="menu-text"> 文章 </span>
                <b class="arrow icon-angle-down"></b>
              </a>
              <ul class="submenu"  <#if (request.requestUri?index_of('admin/news/list') gt -1) 
            || (request.requestUri?index_of('admin/news/new') gt -1) 
            ||  (request.requestUri?index_of('admin/advertiseplace/list') gt -1)  > 
            style="display: block;"  </#if> >
                <li class="<#if request.requestUri?index_of('/admin/news/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/news/list/p1">
                    <i class="icon-double-angle-right"></i>
                    文章列表
                  </a>
                </li>
                <li class="<#if request.requestUri?index_of('/admin/news/new') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/news/new">
                    <i class="icon-double-angle-right"></i>
                    添加文章
                  </a>
                </li>
              </ul>
              <li class="<#if request.requestUri?index_of('/admin/advertiseplace/list') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/advertiseplace/list/p1">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 广告位 </span>
              </a>
            </li>
             <li class="<#if request.requestUri?index_of('/admin/recplace/list') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/recplace/list/p1">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 推送位 </span>
              </a>
            </li>
            </li>
            
            
            
             <li  <#if (request.requestUri?index_of('admin/stock/findMainStockByInOutFlag/p1') gt -1) 
            || (request.requestUri?index_of('admin/stock/findMainStockByType/p1') gt -1)
            || (request.requestUri?index_of('admin/stock/toAddCheck') gt -1)>
            class="open" </#if> >
              <a href="#" class="dropdown-toggle">
                <i class="icon-edit"></i>
                <span class="menu-text"> 库存管理</span>
                <b class="arrow icon-angle-down"></b>
              </a>
              
              
              <ul class="submenu"  <#if (request.requestUri?index_of('admin/stock/findMainStockByInOutFlag/p1') gt -1)
            || (request.requestUri?index_of('admin/stock/findMainStockByType/p1') gt -1)
            || (request.requestUri?index_of('admin/stock/toAddCheck') gt -1)
            || (request.requestUri?index_of('admin/stock/toAddStock') gt -1)> 
             style="display: block;" </#if> >
             	<li class="<#if request.requestUri?index_of('admin/stock/toAddStock') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/stock/toAddStock">
                    <i class="icon-double-angle-right"></i>
                    新增入库
                  </a>
                </li>
             
                <li class="<#if request.queryString?has_content && request.queryString?index_of('inOutFlag=0') gt -1> active</#if>">
                  <a href="${request.contextPath}/admin/stock/findMainStockByInOutFlag/p1?inOutFlag=0">
                    <i class="icon-double-angle-right"></i>
                    入库单
                  </a>
                </li>
                 
                <li class="<#if request.queryString?has_content && request.queryString?index_of('inOutFlag=1') gt -1> active</#if>">
                  <a href="${request.contextPath}/admin/stock/findMainStockByInOutFlag/p1?inOutFlag=1">
                    <i class="icon-double-angle-right"></i>
                   出库单
                  </a>
                </li>
                 
           		<li class="<#if request.queryString?has_content && request.queryString?index_of('stockType=check') gt -1> active</#if>">
                  <a href="${request.contextPath}/admin/stock/findMainStockByType/p1?stockType=check">
                    <i class="icon-double-angle-right"></i>
                    盘点
                  </a>
                </li>
                 <li class="<#if request.requestUri?index_of('admin/stock/toAddCheck') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/stock/toAddCheck">
                    <i class="icon-double-angle-right"></i>
                    新增盘点
                  </a>
                </li>
              </ul>
            </li>
            
        <li 	<#if (request.requestUri?index_of('admin/manager') gt -1) 
            || (request.requestUri?index_of('admin/role') gt -1) 
            ||  (request.requestUri?index_of('admin/resources') gt -1)  > 
            class="open" </#if> >
             <a  class="dropdown-toggle">
                <i class="icon-tag"></i>
                <span class="menu-text"> 权限管理 </span>

                <b class="arrow icon-angle-down"></b>
              </a>
              
             <ul class="submenu"  <#if (request.requestUri?index_of('admin/manager') gt -1) 
            || (request.requestUri?index_of('admin/role') gt -1) 
            ||  (request.requestUri?index_of('admin/resources') gt -1)  > 
            style="display: block;" </#if>  >
                
                <li class="<#if request.requestUri?index_of('/admin/manager/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/manager/list/p1">
                    <i class="icon-double-angle-right"></i>
                    用户列表
                  </a>
                </li>
                
                <li class="<#if request.requestUri?index_of('/admin/manager/new') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/manager/new">
                    <i class="icon-double-angle-right"></i>
                    用户添加
                  </a>
                </li>
                
                <li class="<#if request.requestUri?index_of('/admin/role/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/role/list/p1">
                    <i class="icon-double-angle-right"></i>
                    职务列表
                  </a>
                </li>

                <li class="<#if request.requestUri?index_of('/admin/role/add') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/role/new">
                    <i class="icon-double-angle-right"></i>
                    职务添加
                  </a>
                </li>
                
                <li class="<#if request.requestUri?index_of('/admin/resources/list') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/resources/list/p1">
                    <i class="icon-double-angle-right"></i>
                     功能列表
                  </a>
                </li>
                
                  <li class="<#if request.requestUri?index_of('/admin/resources/new') != -1 > active</#if>">
                  <a href="${request.contextPath}/admin/resources/new">
                    <i class="icon-double-angle-right"></i>
                     功能新增
                  </a>
                </li>
              </ul>
              
        </li>
        
          <li class="<#if request.requestUri?index_of('/admin/ware/list/p1') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/ware/list/p1" class="dropdown-toggle">
                <i class="icon-list"></i>
                <span class="menu-text"> 仓库管理</span>
              </a>
            </li>  
            <li class="<#if request.requestUri?index_of('/admin/sup/list/p1') != -1 > active</#if>">
              <a href="${request.contextPath}/admin/sup/list/p1" class="dropdown-toggle">
                <i class="icon-list"></i>
                <span class="menu-text"> 供应商管理</span>
              </a>
            </li>  
            
          </ul><!-- /.nav-list -->
          <div class="sidebar-collapse" id="sidebar-collapse">
            <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
          </div>
        </div>
</#escape>