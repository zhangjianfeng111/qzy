package com.qzy.cn.utils;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
* 在执行期间，每一个方法都使用一个HttpConnection实例。
* 由于在同一时间多个连接只能安全地用于单一线程和方法和有限的资源，
* 我们就必须确保连接分配给正确的方法。
* 而MultiThreadedHttpConnectionManager完全可以代替我们完成这一项工作，这样我们就不必去考虑多线程带来安全的问题。
*/
public class HttpClentManager {
	protected final transient static Logger  log =LoggerFactory.getLogger(HttpClentManager.class);
    private static final String URL_PARAM_CONNECT_FLAG = "&";        
    private static final String EMPTY = "";    
    private static int connectionTimeOut = 25000;    
    private static int socketTimeOut = 25000;    
    private static int maxConnectionPerHost = 10;    //最大连接数，默认是2。 
    private static int maxTotalConnections = 20;    //最大活动连接数，默认是20。
    private static MultiThreadedHttpConnectionManager connectionManager = new MultiThreadedHttpConnectionManager();
    private static HttpClient client= new HttpClient(connectionManager); // 线程安全
    
    static{  
        connectionManager.getParams().setConnectionTimeout(connectionTimeOut);  
        connectionManager.getParams().setSoTimeout(socketTimeOut);  
        connectionManager.getParams().setDefaultMaxConnectionsPerHost(maxConnectionPerHost);  
        connectionManager.getParams().setMaxTotalConnections(maxTotalConnections);  
        connectionManager.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());
    }  
    
    /**
     * get or post 释放资源
     * @return
     */
    static HttpClient  getHttpClient(){
//    	client.getHttpConnectionManager().releaseConnection( client.getcon()) ;
//   GetMethod getMethod=null;
//   getMethod.releaseConnection();
//   PostMethod post = new PostMethod();
//   post.releaseConnection();
    		return new HttpClient(connectionManager); 
    }
    
    
    
}
