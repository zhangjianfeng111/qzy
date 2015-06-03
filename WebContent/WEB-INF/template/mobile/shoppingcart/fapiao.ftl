
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
    <title>发票抬头</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="format-detection" content="telephone=no"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<meta http-equiv="Cache-Control" content="no-transform "/>
<meta name="keywords" content=" ">
<meta name="description" content="">  
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/mobile/css/style.css">
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/js.js"></script>
</head>
<body class="f4b">
<div id="a-wrap">
    <section id="section" class="section">
        <header id="header" class="header gb">
            <h2>发票抬头  </h2>
            <nav>
                <a class="iback left backsection" href="javascript:history.go(-1)"></a>
            </nav>
        </header>
        <article>
            <div class="addressEdit">
                <div class="form-list-a" style="background: #fff;">
                    <ul>
                        <li class="fl-item" data-val="个人">
                             <b class="name ipt-pick cpick" id="uNameCheck" name="<#if ((user.invoiceType)!'') =='common' >on<#else>off</#if>">
                            <div id="icoComp" class="c-pick <#if ((user.invoiceType)!'') =='common' >on</#if> "></div>个人</b>
                            <span class="detail"><input id="uName" type="text" placeholder="请输入单位名称" value="${(user.invoiceTitle)!''}"   <#if ((user.invoiceType)!'') !='common' >  style="display:none" </#if>   /></span>
                            <div class="c"></div>
                        </li>
                        <li class="fl-item" >
                            <b class="name ipt-pick cpick" id="compNameCheck" name="<#if ((user.invoiceType)!'') =='added' >on<#else>off</#if>">
                            <div id="icoComp" class="c-pick <#if ((user.invoiceType)!'') =='added' >on</#if> "></div>单位</b>
                            <span class="detail"><input id="compName" type="text" placeholder="请输入单位名称" value="${(user.invoiceTitle)!''}"   <#if ((user.invoiceType)!'') !='added' >  style="display:none" </#if>   /></span>
                            <div class="c"></div>
                        </li>
                    </ul>
                </div>
            </div>
        </article>
        <footer class="footer">
            <div class="form-sub-a">
               <div class="action">
                    <div class="act-iner ma">
                        <a id="btnOK" href="javascript:invoice();" class="a-iteam b-orgn"><span>确认</span></a>
                    </div>
                </div>
            </div>
        </footer>
    </section>
</div>
</body>

<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/common.js"></script>

<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/order_invoice_tit.js"></script>
<script>
	function invoice(){
		var  type = "";
		var  title = "";
		if( $("#uNameCheck").attr("name") =="on" ){
			type="common";
			title = $("#uName").val();
		}else if($("#compNameCheck").attr("name" == "on")){
			type="added";
			title = $("#compName").val();
		}
		$.ajax({
 		   type: "POST",
 		   url:  "${request.contextPath}/mobile/cus/invoice",
 		   data: {"invoiceType":type,"invoiceTitle":title},
 		   success: function(data){
 		     if(data.isSuccess){
 		//     self.location=document.referrer;
 		     location.href="${request.contextPath}/mobile/shopcart/backShopAccount";
 		     //window.location.go(-1);
 		     //window.history.go(0);
 		    	 bootbox.alert("保存成功");
 		     }
 		   },
 		   dataType: "json"
 		});
	}
</script>

</html>