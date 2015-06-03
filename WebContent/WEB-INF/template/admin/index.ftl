 <#escape x as x!"">
<#include "common/header.ftl">
 <div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">


    <ul class="breadcrumb">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="${request.contextPath}/admin/advertise/list/p1">广告</a>
        <small>
          <i class="icon-double-angle-right"></i>
           广告添加
        </small>
      </li>
    </ul><!-- .breadcrumb -->
  </div>
  <div class="page-content">
    <div class="page-header">
    </div><!-- /.page-header -->
        <div class="row">
      <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
     	   	欢迎  ${adminuser.userName} 使用该该系统		
        <div class="hr hr32 hr-dotted"></div>
        <!-- PAGE CONTENT ENDS -->
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.page-content -->
</div><!-- /.main-content -->
        <#include "common/footer.ftl">
</#escape>