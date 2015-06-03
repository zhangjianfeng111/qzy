<#escape x as x!"">
<#import "../../common/common.ftl" as yep>
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
<title>订单详情</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="format-detection" content="telephone=no"/>
<meta content="telephone=no" name="format-detection"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<meta http-equiv="Cache-Control" content="no-transform "/>
<meta name="keywords" content="">
<meta name="description" content="">  
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/mobile/css/style.css">
<script type="text/javascript" src="${request.contextPath}/resources/mobile/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div id="a-wrap">
    <section id="section" class="section">
        <header id="header" class="header gb">
            <h2>订单详情</h2>
            <nav>
                <a class="iback left" href="javascript:history.go(-1);"></a>
            </nav>
        </header>
        <article id="article" class="article">
            <div class="orderDetailed">
                <div class="form-list-a">
                    <ul>
                    	<li class="tit"><h4>订单编号:${info.orderCode}</h4><span class="ot">
                    	<#if ((info.orderStatus)!'')=='un_audit'>未审核<#elseif  ((info.orderStatus)!'')=='pass'>已审核
						<#elseif  ((info.orderStatus)!'')=='wait_ship'>待发货<#elseif  ((info.orderStatus)!'')=='ship'>已发货
						<#elseif  ((info.orderStatus)!'')=='refund'>退货<#elseif  ((info.orderStatus)!'')=='canceled'>交易取消
						<#elseif  ((info.orderStatus)!'')=='canceled'>完结
						<#else></#if>
                    	</span></li>
                        <li class="fl-item"><b class="name">订单总额</b><span class="detail ot">￥${info.totalFee}</span></li>
                        <li class="fl-item"><b class="name">下单时间</b><span class="detail"><#if info.orderTime?has_content>${info.orderTime?string("yyyy-MM-dd HH:mm:ss")}</#if></span></li>
                    	</li>
                    </ul>
                    <ul>
                        <li class="tit"><h4>配送信息</h4></li>
                        <li class="fl-item"><b class="name">收货地址</b><span class=""><p>
                        <@yep.loadRegionName (info.receiverState)!'' />
					<@yep.loadRegionName (info.receiverCity)!'' />
					<@yep.loadRegionName (info.receiverDistrict)!''  />
                        ，${info.receiverAddress}</p></span></li>
                        <li class="fl-item"><b class="name">收货人</b><span class="detail">${info.receiverName}</span></li>
                        
                        <#--<li class="fl-item"><b class="name">配送时间</b><span style="max-width: 210px;" class="detail ellipsis">下单后1天内送达</span></li>-->
                    </ul>
                    <ul>
                        <li class="tit"><h4>发票信息</h4></li>
                        		<#if (info.invoiceType)?? && (info.invoiceType) != 'no'>
                        			<#if (info.invoiceType) =='common'>
                         		 <li class="fl-item"><b class="name">发票类型</b><span class="detail">个人</span></li>
                         		 <#else >
                         		 <li class="fl-item"><b class="name">发票类型</b><span class="detail">公司</span></li>
                         		 </#if>
                       		 <li class="fl-item"><b class="name">发票抬头</b><span class="detail">${info.invoiceTitle}</span></li>
                       		 <#else>
                       		 	 <li class="fl-item"><b class="name">发票类型</b><span class="detail">无</span></li>
                       		 </#if>
                    </ul>
                    <ul>
                        <li class="tit"><h4>商品清单</h4></li>
	                      <li class="fl-item">
	                          <div class="pbox-list-a pic-70">
	                              <ul>
	                            <#if products?has_content>
								<#list products as product>
                                <li>
                                    <a href="${request.contextPath}/mobile/product/view/${product.productId}" class="list-item more">
                                        <div class="od-header"></div>
                                        <div class="p-pic"><img src="${request.contextPath}/resources/admin/store/${product.productImage}" alt=""/></div>
                                        <div class="d-con">
                                            <h3 class="d-tit clamp-1" style="margin:0;">${product.productName}</h3>
                                            <p class="d-spe">9个装/盒</p>
                                            <div class="db-con">
                                                <h1 class="d-price ot">${((product.productPrice)!0)}</h1> <del></del>
                                            </div>
                                            <p class="d-num">${((product.productNumber)!0)}</p>
                                        </div>
                                        <div class="od-footer"></div>
                                    </a>
                                </li>
                                </#list>
								</#if>
		                    </ul>
		                    </div>
                    <ul>
                        <li class="tit"><h4>价格清单</h4></li>
                        <li class="fl-item"><b class="name">商品总价</b><span class="detail ot s">￥${(info.totalFee)!'0'}</span></li>
                        <li class="fl-item"><b class="name">运费</b><span class="detail ot s"> ￥${(info.shipFee)!'0'} </span></li>
                        <li class="fl-item"><b class="name">余额抵扣</b><span class="detail">-￥${(info.payment)!'0'}</span></li>
                    </ul>
                    <ul>
                        <li class="tit"><h4>物流单号</h4></li>
                        <li class="fl-item"><b class="name"><#if (info.shipNo)??>${info.shipNo}<#else>暂无</#if></b><span class="detail ot s"><a href="http://www.sto.cn/">物流查询>></a></span></li>
                    </ul>
               </div>
            </div>
        </article>
        <footer class="footer">
            <div class="form-sub-a fx">
                <div class="action">
                    <div class="act-iner m">
                        <span class="a-iteam">
                        	<#if ((order.orderStatus)!'')=='un_audit' || ((order.orderStatus)!'')=='pass' >
                            <a id="btnCancel" _rha_event="cancelOrder"      href="${request.contextPath}/mobile/order/confirmOrder?orderId=${(order.orderId)!1}&isBalance=1" data-oid="150118185675" class="link-txt gt ae">立即支付</a>
							</#if>
                        </span>
                        <!-- <a href="" class="a-iteam b-green"><span>重新购买</span></a> -->
                    </div>
                </div>  
            </div>
        </footer>
    </section>
</div>
</body>
</html>

<script>
function is_weixin(){
var ua = navigator.userAgent.toLowerCase();
if(ua.match(/MicroMessenger/i)=="micromessenger") {
return true;
} else {
return false;
}
}

function testJs(){
console.log("aa");
	if(confirm("测试  微信的js")  ){
			alert($("#btnCancel").attr("href"));
			return false;
		}else {
			return  true;
		}
}

$(function(){
	if(is_weixin() ){
		$("#btnCancel").attr("href",$("#btnCancel").attr("href")+"&orderFrom=weixing"  );
	}else {
		$("#btnCancel").attr("href",$("#btnCancel").attr("href")+"&orderFrom=alipay"  );
	}
})
</script>

</#escape>	