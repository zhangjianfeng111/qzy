<#escape x as x!"">
<#if infos?has_content>
<#list infos as info>

 					<li class="comm-iteam">
                            <div class="us-hd">    
                              <div class="us-score start-${(info.lcommentEvel)!5}"></div>    
                              <div class="us-name">${info.userName}</div>
                            </div>
                            <div class="us-comm">${info.commentDesc}</div><div class="us-time">${info.createTime?string("yyyy-MM-d d HH:mm:ss")}</div>
                          </li>

</#list>
</#if>
</#escape>