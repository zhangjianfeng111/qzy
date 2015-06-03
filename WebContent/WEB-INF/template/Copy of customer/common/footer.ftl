<#escape x as x!"">
<div id="footer">
				<img class="erweima" src="${request.contextPath}/resources/front/img/2weima.jpg" height="136" width="136">
				<img src="${request.contextPath}/resources/front/img/logo.png" height="71" width="147" class="logo">
				<div class="uls">
					<ul>
						<li class="ul-title">购物指南</li>
						<!--
						<li><a href="">积分制度</a></li>
						<li><a href="">会员介绍</a></li>
						-->
						<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-register') != -1 > active</#if>"   href="${request.contextPath}/sample/helpCenter-register.html">账户注册</a></li>
						<li><a href="${request.contextPath}/sample/helpCenter-guowuliucheng.html">购物流程</a></li>
							<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-guanyutuanguo') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-guanyutuanguo.html">关于团购</a></li>
						
					</ul>
					<ul>
						<li class="ul-title">配送服务</li>
						<!--
						<li><a href="">配送政策</a></li>
						<li><a href="">开箱验货</a></li>
						-->
						<li><a href="${request.contextPath}/sample/helpCenter-peisongyunfei.html">配送运费</a></li>
						<li><a href="${request.contextPath}/sample/helpCenter-peisongfanwei.html">配送范围</a></li>
						<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-peisongshijian') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-peisongshijian.html">配送时间</a></li>
					</ul>
					<ul>
						<li class="ul-title">支付方式</li>
						
						<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-payType') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-payType.html">支付方式</a></li>
						<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-dingguofangshi') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-dingguofangshi.html">订购方式</a></li>
							<li><a href="${request.contextPath}/sample/helpCenter-quests.html">常见问题</a></li>
					</ul>
					<ul>
						<li class="ul-title">退款说明</li>
						<li><a href="${request.contextPath}/sample/helpCenter-tuihuoliucheng.html">退换货流程</a></li>
						<li><a href="${request.contextPath}/sample/helpCenter-tuihuozhence.html">退换货政策</a></li>
						<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-toushuyujianyi') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-toushuyujianyi.html">投诉与建议</a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
</#escape>