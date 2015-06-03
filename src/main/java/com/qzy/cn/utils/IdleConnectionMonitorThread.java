package com.qzy.cn.utils;

import java.util.concurrent.TimeUnit;

import org.apache.http.conn.HttpClientConnectionManager;

/**
 * @author zgdcool
 * @version 2015年4月2日 上午1:10:11
 *   
 */
public class IdleConnectionMonitorThread extends Thread {

	private final HttpClientConnectionManager connMgr;  
    private volatile boolean shutdown;  
      
    public IdleConnectionMonitorThread(HttpClientConnectionManager connMgr) {  
        super();  
        this.connMgr = connMgr;  
    }  
  
    @Override  
    public void run() {  
        try {  
            while (!shutdown) {  
                synchronized (this) {  
                    wait(5000);  
                    // Close expired connections  
                    connMgr.closeExpiredConnections();  
                    // Optionally, close connections  
                    // that have been idle longer than 30 sec  
                    connMgr.closeIdleConnections(30, TimeUnit.SECONDS);  
                }  
            }  
        } catch (InterruptedException ex) {  
            // terminate  
        }  
    }  
      
    public void shutdown() {  
        shutdown = true;  
        synchronized (this) {  
            notifyAll();  
        }  
    }  
}
