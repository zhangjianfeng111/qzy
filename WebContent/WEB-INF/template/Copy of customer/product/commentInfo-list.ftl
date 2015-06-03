<#escape x as x!"">

<script src="${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js"></script>
<#import "../../common/common.ftl" as yep>

<script src="${request.contextPath}/resources/front/myJs/js.js"></script>
		<script src="${request.contextPath}/resources/front/myJs/common.js"></script>
		<script src="${request.contextPath}/resources/front/myJs/jqueryCookie.js"></script>
		<script type="text/javascript">
			var YS = YS || {data:{},util:{}};
			YS.config = {path:{rootPath:"${request.contextPath}"}}
		</script>
			<#if infos?has_content>
							<#list infos as info>
							<div class="comment" id="comment" >
								<img src="${request.contextPath}/resorces/admin/stroe/${(info.more1)!'default_user.png'}" height="52" width="53" class="comment-ava-pic">
								<div class="comment-wrap">
									<p class="comment-title"><span class="time">
										<#if (info.createTime)??>
											${info.createTime?string("yyyy年MM月dd日HH:mm:ss")}
										</#if>
									</span>
									<span class="stars-bg">
										<span class="star-${(info.lcommentEvel)!5}"></span>
									</span></p>
									<p class="comment-text"> ${info.commentDesc} </p>
								</div>
							</div>
							</#list>
							</#if>
						
							<ul class="pagination clearfix">
							
							<#if page?has_content>
								<#assign pageUrl>
									<@yep.searchPageUrl '${request.contextPath}/cus/comment/listAjax/list/p1' 'pageNo=#' 'productId=${(bean.productId)!0}' />
								</#assign>
								<#assign ajaxPageShowId="commentsShows" >
								<#include "../common/pagesAjax.ftl">
							</#if>
						</ul>
  
</#escape>