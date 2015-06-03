package com.qzy.cn.utils.weixin;
//package com.carbon.cn.utils.weixin;
//
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.Hashtable;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.commons.lang3.StringUtils;
//
///** 
//'============================================================================
//'api说明：
//'getKey()/setKey(),获取/设置密钥
//'getParameter()/setParameter(),获取/设置参数值
//'getAllParameters(),获取所有参数
//'isTenpaySign(),是否正确的签名,true:是 false:否
//'isWXsign(),是否正确的签名,true:是 false:否
//' * isWXsignfeedback判断微信维权签名
//' *getDebugInfo(),获取debug信息
//'============================================================================
//*/
//public class ResponseHandler {
//
//    // 密钥 
//    private String key;
//
//    // appkey
//    private String appkey;
//
//    //xmlMap
//    private Hashtable<String, String> xmlMap;
//
//    // 应答的参数
//    protected Hashtable<String,String> parameters;
//    
//     //debug信息
//    private String debugInfo;
//    //原始内容
//    protected String content;
//
//    private String charset = "gb2312";
//
//    //参与签名的参数列表
//    private static String SignField = "appid,appkey,timestamp,openid,noncestr,issubscribe";
//
//    private HttpServletRequest request;
//
//	private HttpServletResponse response;
//
//    //初始化函数
//    public  void init(){
//    }
//
//    //获取页面提交的get和post参数
//    public ResponseHandler(HttpServletRequest request,  HttpServletResponse  response)
//    {
//        parameters = new Hashtable<String,String>();
//        xmlMap = new Hashtable<String,String>();
//
//        this.request = request;
//        this.response = response;
//        
//        Map<String,String> collection = new Hashtable<String,String>();
//        
////        if (this.httpContext.Request.HttpMethod == "POST")
////        {
//////            collection = this.httpContext.Request.Form;
////            foreach (String k in collection)
////            {
////                String v = (String)collection[k];
////                this.setParameter(k, v);
////            }
////        }
////        //query String
////        collection = this.httpContext.Request.QueryString;
////        foreach (String k in collection)
////        {
////            String v = (String)collection[k];
////            this.setParameter(k, v);
////        }
////        if (this.httpContext.Request.InputStream.Length > 0)
////        {
////            XmlDocument xmlDoc = new XmlDocument();
////            xmlDoc.Load(this.httpContext.Request.InputStream);
////            XmlNode root = xmlDoc.SelectSingleNode("xml");
////            XmlNodeList xnl = root.ChildNodes;
////
////            foreach (XmlNode xnf in xnl)
////            {
////                xmlMap.Add(xnf.Name, xnf.InnerText);
////            }
////        }
//    }
//
//
//    /** 获取密钥 */
//    public String getKey() 
//    { return key;}
//
//    /** 设置密钥 */
//    public void setKey(String key, String appkey) 
//    {
//        this.key = key;
//        this.appkey = appkey;
//    }
//
//    /** 获取参数值 */
//    public String getParameter(String parameter) 
//    {
//        String s = (String)parameters.get(parameter);
//        return (null == s) ? "" : s;
//    }
//
//    /** 设置参数值 */
//    public void setParameter(String parameter,String parameterValue) 
//    {
//        if(parameter != null && parameter != "")
//        {
//            if(parameters.containsKey(parameter))
//            {
//                parameters.remove(parameter);
//            }
//
//            parameters.put(parameter,parameterValue);        
//        }
//    }
//
//    /** 是否财付通签名,规则是:按参数名称a-z排序,遇到空值的参数不参加签名。 
//     * @return boolean */
//    public  Boolean isTenpaySign() 
//    {
//        StringBuilder sb = new StringBuilder();
//
//        ArrayList<String> akeys=new ArrayList<String>(parameters.keySet()); 
//        Collections.sort(akeys);
//
//        for (String	 k : akeys) {
//			String value = parameters.get(k);
//			if(StringUtils.isNotBlank(value)  && 
//					!"sign".equals(k)   && !"key".equals(k) ){
//				 sb.append(k + "=" + value + "&");
//			}
//		}
//
////        sb.append("key=" + this.getKey());
////        MD5Util.MD5Encode
////        String sign = MD5Util.GetMD5(sb.ToString(), getCharset()).ToLower();
////        this.setDebugInfo(sb.ToString() + " => sign:" + sign);
////        //debug信息
////        return getParameter("sign").ToLower().Equals(sign); 
//        return null;
//        
//    }
//
//    //判断微信签名
//    public virtual Boolean isWXsign()
//    {
//        StringBuilder sb = new StringBuilder();
//        Hashtable signMap = new Hashtable();
//
//        foreach (String k in xmlMap.Keys)
//        {
//            if (k != "SignMethod" && k != "AppSignature")
//            {
//                signMap.Add(k.ToLower(), xmlMap[k]);
//            }
//        }
//        signMap.Add("appkey", this.appkey);
//
//
//        ArrayList akeys = new ArrayList(signMap.Keys);
//        akeys.Sort();
//
//        foreach (String k in akeys)
//        {
//            String v = (String)signMap[k];
//            if (sb.Length == 0)
//            {
//                sb.Append(k + "=" + v);
//            }
//            else
//            {
//                sb.Append("&" + k + "=" + v);
//            }
//        }
//
//        String sign = SHA1Util.getSha1(sb.ToString()).ToString().ToLower();
//
//        this.setDebugInfo(sb.ToString() + " => SHA1 sign:" + sign);
//
//        return sign.Equals(xmlMap["AppSignature"]);
//
//    }
//
//    //判断微信维权签名
//    public virtual Boolean isWXsignfeedback()
//    {
//        StringBuilder sb = new StringBuilder();
//        Hashtable signMap = new Hashtable();
//   
//        foreach (String k in xmlMap.Keys)
//        {
//            if (SignField.IndexOf(k.ToLower()) != -1)
//            {
//                signMap.Add(k.ToLower(), xmlMap[k]);
//            }
//        }
//        signMap.Add("appkey", this.appkey);
//      
//
//        ArrayList akeys = new ArrayList(signMap.Keys);
//        akeys.Sort();
//
//        foreach (String k in akeys)
//        {
//            String v = (String)signMap[k];
//            if ( sb.Length == 0 )
//            {
//                sb.Append(k + "=" + v);
//            }
//            else
//            {
//                sb.Append("&" + k + "=" + v);
//            }
//        }
//        
//        String sign = SHA1Util.getSha1(sb.ToString()).ToString().ToLower();
//        
//        this.setDebugInfo(sb.ToString() + " => SHA1 sign:" + sign);
//
//        return sign.Equals( xmlMap["AppSignature"] );
//
//    }
//
//    /** 获取debug信息 */
//    public String getDebugInfo() 
//    { return debugInfo;}
//            
//    /** 设置debug信息 */
//    protected void setDebugInfo(String debugInfo)
//    { this.debugInfo = debugInfo;}
//
//    protected virtual String getCharset()
//    {
//        return this.httpContext.Request.ContentEncoding.BodyName;
//        
//    }
//
//    
//}
//}
