<#escape x as x!"">
<#include "../common/header.ftl">
			<div class="section">
				<h1>选择收货地址</h1>
				<div class="ucenter-block clearfix">
					<div class="ucenter-leftblock">
						<div class="tit">默认收货信息</div>
						<div class="modify-block">
							<p>${default.state}${default.city}${default.district}</p>
						</div>
						<div class="modify-block">
							<p>${default.address}</p>
						</div>
						<div class="modify-block">
							<p>${default.name} ${default.mobile}</p>
						</div>
					</div>
					<div class="ucenter-rightblock">
						<div class="tit">添加收货信息</div>
						<div class="modify-block clearfix">
							<label>姓名</label>
							<input type="text" />
						</div>
						<div class="modify-block">
							<label>手机</label>
							<input type="text" />
						</div>
						<div class="modify-block clearfix">
							<label>省份</label>
							<select>
								<option>浙江省</option>
							</select>
						</div>
						<div class="modify-block clearfix">
							<label>城市</label>
							<select>
								<option>杭州市</option>
							</select>
						</div>
						<div class="modify-block clearfix">
							<label>地区</label>
							<select>
								<option>西湖区</option>
							</select>
						</div>
						<div class="modify-block clearfix">
							<label>详细地址</label>
							<textarea ></textarea>
						</div>
						<div class="modify-block">
							<a href="" class="btn">提交</a>
						</div>
					</div>
				</div>
				<#if infos?has_content>
					  <#list infos as info>
						<div class="ucenter-block clearfix">
							<div class="ucenter-leftblock">
								<div class="tit">收货信息</div>
								<div class="modify-block">
									<p>${info.state}${info.city}${info.district}</p>
								</div>
								<div class="modify-block">
									<p>${info.address}</p>
								</div>
								<div class="modify-block">
									<p>${info.name} ${info.mobile}</p>
								</div>
								<a href="" style="color:#c33;padding-left:20px;">设为收货地址</a>
							</div>
						</div>
					</#list>
				</#if>
			</div>
	<#include "../common/footer.ftl">
</#escape>