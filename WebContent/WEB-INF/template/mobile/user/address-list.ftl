<#escape x as x!"">
<#import "../../common/common.ftl" as yep>

<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
    <title>地址管理</title>
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
            <h2>地址管理</h2>
            <nav>
            	<!--
                <a class="iback" href="${request.contextPath}/mobile/shopcart/list/p1.html"></a>
                -->
                <a class="iback" href="javascript:history.go(-1);"></a>
              
	                <a class="right text" href="${request.contextPath}/mobile/cus/address/input"><h2>+</h2></a>
                
            </nav>
        </header>
        <article id="article" class="article">
            <div class="addressWeb">
                <div class="form-list-a">
                    <ul>                       
                         
                        	
                        	
                        			<#if defaultReceiver??>
		                        	<li class="fl-item pickit">
			                           <div class="add-edit"><a href="${request.contextPath}/mobile/cus/address/input?receiverId=${defaultReceiver.receiverId}" class="edit-btn"></a></div>
			                           		<div class="add-box active" id="2161152">
			                                <b class="name">${defaultReceiver.name}</b>
			                                <p><@yep.loadRegionName (defaultReceiver.state)!'' />
					<@yep.loadRegionName (defaultReceiver.city)!'' />
					<@yep.loadRegionName (defaultReceiver.district)!''  /></p>
			                                <p>${defaultReceiver.address}</p>
			                                <p>${defaultReceiver.mobile}</p>
			                            </div>
			                        </li>
			                        </#if>
		                        
                        			
							<#if receivers?has_content>
							<#list receivers as info>
								<#if ((defaultReceiver.receiverId)!0) != ((info.receiverId)!0) >
							   	<li class="fl-item pickit">
			                           <div class="add-edit"><a href="${request.contextPath}/mobile/cus/address/input?receiverId=${info.receiverId}" class="edit-btn"></a>
			                           
			                           </div onclick="setdefault('${info.receiverId}')">
			                           		<div class="add-box" id="2161152">
			                                
			                                 <b class="name">${info.name}  <a href="javascript:setdefault('${info.receiverId}');" style="color:#c33;padding-left:20px;">使用</a></b>
			                                <p><@yep.loadRegionName (info.state)!'' />
					<@yep.loadRegionName (info.city)!'' />
					<@yep.loadRegionName (info.district)!''  /></p>
			                                <p>${info.address}</p>
			                                <p>${info.mobile}</p>
			                            </div>
			                          
			                        </li>
							</#if>
							</#list>
							</#if>

                                           
                    </ul>
                </div>
            </div>
        </article>
    </section>
</div>
</body>
<script>
function setdefault(id){
	$.ajax({
		type: "GET",
		url: "${request.contextPath}/mobile/cus/bedefault/",
		data: {receiverId : id}, 
		dataType: "json",
		success: function( data ){
			alert(data.message);
			if(data && data.isSuccess) {
				//location.reload(true);
				location.href="${request.contextPath}/mobile/shopcart/backShopAccount";
			} 
		},
        error: function() {
            alert("网络错误，请重试！");
        }
	});
}

</script>

</html>
</#escape>	