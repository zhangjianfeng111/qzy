package com.qzy.cn.utils;

import java.io.IOException;
import java.util.Random;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import com.qzy.cn.conf.AppConfig;


/**
 * 
 * 使用:
 * 1: app.properties:
 * ys.sms.uid=zhangguodong
*ys.sms.Key=ff28cb6e1bd0c4d3ae8f
*ys.sms.message=您好，您的验证码为
*ys.sms.findPwdMessage=您好,你的临时密码为
*ys.sms.url=http://gbk.sms.webchinese.cn
 * 
 * 
 * 2: applicationContext-service.xml
 *   <!-- 应用常量配置 -->
*	<bean id="appConfig" class="java.util.HashMap">
*	    <constructor-arg>
*		<map>
*			<entry key="imagepath" value="${yephouse.image.path}" />
*			
*			<entry key="uid" value="${ys.sms.uid}"/>
*			<entry key="key" value="${ys.sms.Key}"/>
*			<entry key="message" value="${ys.sms.message}"/>
*			<entry key="smsUrl" value="${ys.sms.url}"/>
*			<entry key="findPwdMessage" value="${ys.sms.findPwdMessage}"/>
*		</map>
*		</constructor-arg>
*	</bean>
 * 手机短信验证吗??
 * @author jiangjianlong
 *
 */
public class SMSUtils {
	
	public static  Boolean  sendSms(String mobile){
		
		return sendSms(mobile,createSmsCode());
	}
	
	public  static String  createSmsCode(){
		Random random = new Random();
		int x = random.nextInt(899999);
		x = x + 100000;
		return x+"";
	}
	
	public static Boolean  sendSms(String mobile, String code){
		PostMethod post =null;
		try {
			HttpClient client = HttpClentManager.getHttpClient();
			post = new PostMethod(AppConfig.appMap.get("smsUrl"));
			post.addRequestHeader("Content-Type",
					"application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
			
			NameValuePair[] data = {
					new NameValuePair("Uid", AppConfig.appMap.get("uid")),
					new NameValuePair("Key", AppConfig.appMap.get("key")),
					new NameValuePair("smsMob", mobile),
					new NameValuePair("smsText", AppConfig.appMap.get("message")
							+ code) };
			post.setRequestBody(data);
			client.executeMethod(post);
			String result = new String(post.getResponseBodyAsString().getBytes(
					"gbk"));
			Integer status = Integer.parseInt(result);
			return  status > 0;
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(post != null) post.releaseConnection();
		}
		return  Boolean.FALSE;
	}
	
	public static Boolean  sendSmsMsg(String mobile, String msg){
		PostMethod post =null;
		try {
			HttpClient client = HttpClentManager.getHttpClient();
			post = new PostMethod(AppConfig.appMap.get("smsUrl"));
			post.addRequestHeader("Content-Type",
					"application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
			
			NameValuePair[] data = {
					new NameValuePair("Uid", AppConfig.appMap.get("uid")),
					new NameValuePair("Key", AppConfig.appMap.get("key")),
					new NameValuePair("smsMob", mobile),
					new NameValuePair("smsText", msg) };
			post.setRequestBody(data);
			client.executeMethod(post);
			String result = new String(post.getResponseBodyAsString().getBytes(
					"gbk"));
			Integer status = Integer.parseInt(result);
			return  status > 0;
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(post != null) post.releaseConnection();
		}
		return  Boolean.FALSE;
	}
	
	
}
