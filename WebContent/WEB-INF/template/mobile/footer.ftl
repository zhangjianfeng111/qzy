<#escape x as x!"">
<footer class="footer">
    <div class="form-sub-a fx">
    	 
         <div class="nav">
            <ul class="nav-iner">
                <li><a href="${request.contextPath}/mobile/index.html"    class="a-iteam <#if request.requestUri?has_content && request.requestUri?index_of('mobile/index') gt -1>  cur  </#if>"><div class="ftnav-home"></div><span>首页</span></a></li>
                <li><a href="${request.contextPath}/mobile/product/catelist.html" class="a-iteam <#if request.requestUri?has_content && request.requestUri?index_of('mobile/product/catelist') gt -1>  cur  </#if>"><div class="ftnav-sort"></div><span>品类</span></a></li>
                <li><a href="${request.contextPath}/mobile/order/list/p1.html" class="a-iteam <#if request.requestUri?has_content && request.requestUri?index_of('mobile/order/list/p') gt -1>  cur  </#if>"><div class="ftnav-myfru"></div><span>我的订单</span></a></li>
                <li><a href="${request.contextPath}/mobile/shopcart/list/p1.html" class="a-iteam  <#if request.requestUri?has_content && request.requestUri?index_of('mobile/shopcart/list') gt -1>  cur  </#if>"><div class="ftnav-cart">
                <#if userShopingCart?has_content && userShopingCart &gt; 0><i id="cartCount"> ${userShopingCart} </i><#else></#if></div><span>购物车</span></a></li>
                <li><a href="${request.contextPath}/sample/mobile/more.html" class="a-iteam <#if request.requestUri?has_content && request.requestUri?index_of('sample/mobile/more') gt -1>  cur  </#if> "><div class="ftnav-more"></div><span>更多</span></a></li>
            </ul>
        </div>
    </div>
</footer>
    </section>
</div>
</body>
</html>
</#escape>