<#escape x as x!"">

<#include "../common/header.ftl">

<#import "../../common/common.ftl" as yep>
<div class="personal">
    <div class="wrap">
        <div class="position">
            您当前的位置：首页 > 个人中心 > 我的红包
        </div>
        <div class="personal_list">
            <div class="icon">
                <img src="${request.contextPath}/resources/carbon/image/logo_02.png" width="184" height="58">
            </div>
            <div class="account_manage">
                账号管理
            </div>
            <div class="manage_list">
                <ul>
                    <li>
                        <a href="${request.contextPath}/cus/order/list/p1.html">我的订单</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/userCenter">账户余额</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/addressList">收货地址管理</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/info/modifyPwd/input">账户安全</a>
                    </li>
                    <li>
                        <a href="${request.contextPath}/cus/redpacket/list/p1?cusId=${Session["user"].id}">我的红包</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="personal_wrap">
     		
     		<h1>我的红包</h1>
            <div class="red-wr">
                <ul>
                <#if infos?has_content>
				<#list infos as info>
                    <li>
                        <a href="#"><img src="image/hongbao.png" width="241" height="258"></a>
                        <div>${info.pTitle}</div>
                        <div>金额：${info.pValue}</div>
                        <a class="M_DeleteTr" data-value="${request.contextPath}/cus/redpacket/delete/${info.id}" >删除</a>
                        
                    </li>
                  </#list>
                 </#if>
                  
                </ul>
            </div>
     		
	            <div class="pages">
	                <div class="page-wrap">
	                    <#if page?has_content>
							<#assign pageUrl>
								<@yep.searchPageUrl request.requestUri 'pageNo=#' request.queryString/>
							</#assign>
							<#include "../common/pages.ftl">
						</#if>	
	                </div>
	            </div>
	        </div>
        <div class="clear"></div>
    </div>
</div>
	<script  type="text/javascript">
	
		 $(".M_DeleteTr").click( function(){
		 	 var _this = $(this);
		 	 var url = _this.attr("data-value");
		 	 
		 	  if(confirm("确认删除")){
 				$.ajax({
						type: "GET",
						url: url,
						dataType: "json",
						success: function( data ){
							if(data){
								alert("删除成功！");
								_this.parent().remove();
							}else{
								alert("删除失败！");
							}
						},
				        error: function() {
				            alert("网络错误，请重试！");
				        }
				  });
 			  }
		 	
		 }) ;
   </script>
	 
  <#include "../common/footer.ftl">
</#escape>			