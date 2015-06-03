<#escape x as x!"">

<style>
.user-box-left li .active{
background-color: #aae28b;
}
</style>

						<ul>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-register') != -1 > active</#if>"   href="${request.contextPath}/sample/helpCenter-register.html">账户注册</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-guowuliucheng') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-guowuliucheng.html">购物流程</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-dingguofangshi') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-dingguofangshi.html">订购方式</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-lianxikefu') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-lianxikefu.html">联系客服</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-guanyutuanguo') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-guanyutuanguo.html">关于团购</a></li>
							</ul>
							<ul>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-payType') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-payType.html">支付方式</a></li>
							</ul>
							<ul>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-peisongyunfei') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-peisongyunfei.html">配送运费</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-peisongfanwei') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-peisongfanwei.html">配送范围</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-peisongshijian') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-peisongshijian.html">配送时间</a></li>
							</ul>
							<ul>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-tuihuozhence.html') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-tuihuozhence.html">退换货政策</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-tuihuoliucheng') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-tuihuoliucheng.html">退换货流程</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-quests') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-quests.html">常见问题</a></li>
								<li><a  class="<#if request.requestUri?index_of('/sample/helpCenter-toushuyujianyi') != -1 > active</#if>" href="${request.contextPath}/sample/helpCenter-toushuyujianyi.html">投诉与建议</a></li>
							</ul>
</#escape>