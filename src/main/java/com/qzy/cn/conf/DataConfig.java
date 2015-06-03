package com.qzy.cn.conf;

public interface DataConfig {
	
	/** 短信验证有效时间**/
	String  SMS_TIME = "smsTime";
    
	/**
	 * 入出库单类型
	 */
	String RELATE_TYPE_ORDER = "order";
	String RELATE_TYPE_REFUND = "refund";
 
 /**
  * 操作名称
  */
 String OP_NAME = "op";


 /**
  * 消息key
  */
 String MESSAGE = "message";

 /**
  * 错误key
  */
 String ERROR = "error";

 /**
  * 上个页面地址
  */
 String BACK_URL = "BackURL";

 String IGNORE_BACK_URL = "ignoreBackURL";

 /**
  * 当前请求的地址 带参数
  */
 String CURRENT_URL = "orrentURL";

 /**
  * 当前请求的地址 不带参数
  */
 String NO_QUERYSTRING_CURRENT_URL = "noQueryStringCurrentURL";

 String CONTEXT_PATH = "ctx";

 
 
 /**
  * 当前登录的用户
  */
 String CURRENT_USER = "user";
 String CURRENT_USERNAME = "username";
 String CURRENT_USER_SHOPINGCART_COUNT = "userShopingCart";
 
 /**
  * 当前登录的后台用户
  */
 String CURRENT_ADMIN_USER = "adminuser";
 String CURRENT_ADMIN_USERNAME = "adminusername";
 
 String COMP_USERCACHE = "comp_userCache";
 
 Integer DEFAULT_PRICE = 0;
 Integer AMOUNT_PRICE = 1; 
 Integer SKU_PRICE = 2;
 
 Integer MAX_COMMENT_DAYS = 3;
 
}
