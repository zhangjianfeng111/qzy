<#escape x as x!"">
<#import "../common/common.ftl" as yep>
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
    <title>填写订单</title>
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

<body>
<div id="a-wrap" style="overflow:hidden">
    <section id="section" class="section" >
        <header id="header" class="header gb">
            <h2>订单确认</h2>
            <nav>
                <a class="iback left" href="javascript:history.go(-1);"></a>
            </nav>
        </header>
        <article id="article" class="article">
        		<form  id="saveForm" action="${request.contextPath}/mobile/order/confirm?isBalance=1">
            <div class="orderSub">
                <div class="form-list-a">
                <input type="hidden" id="address" value="${(default)!''}" />
                    <ul>
                    	<li class="tit"><h4>送货地址  ${":"+(default.address)!''} </h4></li>
                    		
                    			<li class="fl-item more foucs"><a href="${request.contextPath}/mobile/cus/address/list">请确认收货地址&nbsp</a>同城件周五因堵车会比平常晚，请填可以收到的地址</li>
                    			<input type="hidden" id=""  value="" />
                    	
                    </ul>
                    <ul>
                        <li class="tit">
                        <h4>
	                        发票信息  :  
	                           <#if ((user.invoiceType)!'') =='common' >
                        		个人
                        <#elseif  ((user.invoiceType)!'') =='added'   >
                        		公司
                        </#if>
                         ${(user.invoiceTitle)!''} 
                        </h4>
                        </li>
                        <li class="fl-item nobd">
                            <input type="checkbox" style="height:auto;width:auto;" id="fapiao"/> <b class="name"> 需要发票</b>
                        </li>
                        <li class="fl-item more od_hide_obj"  name="off" style="display:none" id="fapx">
                        <a href="${request.contextPath}/mobile/cus/intoInvoice.html">发票抬头:
                     
                         </a>
                  <!--        <b class="name">发票抬头</b>
                        <span id="txtDetail" class="detail">
                        </span>
                      </a> -->
                        
                        </li>
                    </ul>
                    
                    <!--
                    <ul>
                        <li>
                            <h4>
                                支付方式
                            </h4>
                        </li>
                        <li class="fl-item nobd">
                            <input type="radio" style="height:auto;width:auto;" id="" name="orderFrom"  value="alipay" /> <b class="name"> 支付宝</b>
                        </li>
                        <li class="fl-item nobd">
                            <input type="radio" style="height:auto;width:auto;"  checked id="" name="orderFrom" value="weixing" /> <b class="name"> 微信支付</b>
                        </li>
                    </ul>
                    -->
                    	<input type="hidden" name="orderFrom"  id="orderFrom" />
                    
                    <ul>
                        <li class="tit"><h4>备注</h4></li>
                        <li class="fl-item"><b class="name textarea"><textarea  name="orderRemark" id="msg" cols="30" rows="3" placeholder="若您对订单有特殊要求,可在此留言"></textarea></b></li>
                    </ul>
                    <ul>
                        <li class="tit"><h4>商品清单</h4></li>
                        <li class="fl-item">
                            <div class="pbox-list-a pic-70">
                            <#if carts?has_content>
								<#list carts as info>
                                <ul>
                                   		<li>
	                                       <a href="${request.contextPath}/mobile/product/view/${info.productId}" class="list-item more">
	                                           <div class="od-header"></div>
	                                               <div class="p-pic"><img src="${request.contextPath}/resources/admin/store/${info.productImage}" alt=""/></div>
	                                               <div class="d-con">
	                                                    <h3 class="d-tit clamp-1">${info.productName}</h3>
	                                                    <p class="d-spe">${info.sukValue}</p>
	                                                    <div class="db-con">
	                                                        <h1 class="d-price ot">￥${info.productPrice}</h1> 
	                                                        
	                                                    </div>
	                                                    <p class="d-num">x ${info.productNumber}</p>
	                                               </div>
	                                           <div class="od-footer"></div>
	                                       </a>
	                                   </li>
                                </ul>
                            	</#list>
							</#if>
                            </div>
                        </li>
                    </ul>
                    <ul>
                        <li class="tit"><h4>价格清单</h4></li>
                        <li class="fl-item"><b class="name">商品总价</b><span class="detail ot s" id="productPrice">￥${((totalPrice)!0) - ((postage)!0)}</span></li>
                        <li class="fl-item"><b class="name">运费</b><span class="detail ot s" id="postFee">
                        ￥${postage!0}
                          
                        
                        </span></li>
                        <li class="fl-item"><b class="name">余额抵扣</b><span class="detail" id="jfDisCount">￥
                        		${toBalance!0}
                        
                        </span></li>
                    </ul>
                </div>
            </div>
            </form>
        </article>
        <footer class="footer">
            <div class="form-sub-a fx">
               <div class="action">
                    <div class="act-iner m">
                        <span class="a-iteam a-msg" ><u>合计:<i class="ot s">￥<em id="totalPrice" data-value="${totalPrice - toBalance}" >
                        <!-- 实际付款额-->
                        ${totalPrice - toBalance }
                       </em></i></u></span>
                        <a id="btnCreateOrder"  href="javascript:void(0)" onclick="payForm();" class="a-iteam b-orgn ae"><span>提交订单</span></a>
                    </div>
                </div>
            </div>
        </footer>
    </section>
</div>
</body>

<script>
function is_weixin(){
var ua = navigator.userAgent.toLowerCase();
if(ua.match(/MicroMessenger/i)=="micromessenger") {
return true;
} else {
return false;
}
}

$(function(){
	
	if(is_weixin() ){
		$("#orderFrom").val("weixing");
	}else {
		$("#orderFrom").val("alipay");
	}
	

})

	 function payForm(){
	 var p = $("#address").val();
	 
	 if(p != ""){
	 var r=confirm("确定付款?")
  if (r==true){
  
  
 if( $("#totalPrice").attr("data-value") ==0) {
 	 r=confirm("余额付款?")
 }
 if(! r) return ;
 
  
  $("#saveForm").submit();
    }else
    {
    return false;
    }
    }else{
    alert("收货地址不能为空！");
    return false;
    }
  
	 	
	 }

</script>

</html>
</#escape>	