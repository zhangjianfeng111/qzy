package com.qzy.cn.conf;
/**
 * @author zgdcool
 * @version 2015年2月10日 下午12:34:16
 *   
 */
public class MobileAlipayConfig {
	
	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	public static String partner = "2088311116433560";
	
	// 交易安全检验码，由数字和字母组成的32位字符串
	// 如果签名方式设置为“MD5”时，请设置该参数
	public static String key = "un93189ncp4zzboyad7f6nxqyneqhw05";
	
    // 商户的私钥
    // 如果签名方式设置为“0001”时，请设置该参数
	public static String private_key = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAL2b4GTQx26PIKt3"
			+ "TTZzRvntByLkt3mdVuNsEuGkQQxLYBom17hyXBzzEXM4GyHo8i44HWxH6l/Wip7Z"
			+ "vW40asTuvX4xbKybWu7IRvG+gzgfR99gNwJ33T69aK5z42/rtj1E2hemm7x/dXZE"
			+ "6KPlPuA3kd4zyCerfHUUxAbRhFANAgMBAAECgYA4IJRkQ4lFqQi6uS4aGDXCde/O"
			+ "3HWTgofd+nf8Y2r+ALIKC8V/zBqIV0urF8iwWQyXsfTDwOYYSKHwM/RnUwznjBxW"
			+ "esRpRnR4GCeM6HIBDXZbV5N4tfsK8bn9JF0U7qSun25Zb+oZ4zhWYTH4tekl7HQK"
			+ "f/ZDz5ASGasmClHO4QJBAOztnASjVQfnacbMegQOb8I2UKn//HQwAAHdMlDUK3DD"
			+ "Kzye0GsIBoaibXaY/9piP8+3LUa0v4tOeKKRMzCmcksCQQDM3ygSdlAmAg3dfBcH"
			+ "bcukppuDPeGuHjCGEBeNpylM5qZMrc6XsLfNTSeBdCRO0owQGiaUmb5nEcccnrhR"
			+ "55AHAkEAjuwvB6U3sBLq/h9vI29J/5AgTMy9D6G8/2Ld7WBv7A/vzxvGgipPNXxa"
			+ "KAbXoHdQIw9O4q46NeDaaMbKaHifzQJBAK7K+pp93TYAbKn6lH9fGu84wtf/tQvk"
			+ "cAwBsMbHx0H4TAyCAhCD0t3TpRAa8ltZ4exfE2mXns67aUEu3h3rToMCQQCdZerM"
			+ "Ia8wt7fUM4K/mGu5O8+DisbUmrRofbuTs/Qxv/x1AbUSj9znkHhVZkkl0q58vKIn"
			+ "COrD9kJzvJMLl8ME";

    // 支付宝的公钥
    // 如果签名方式设置为“0001”时，请设置该参数
	public static String ali_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBg"
			+ "QCVodLEWheIxKGmprc7lUJozmU4yZRrqRzSZxLv 16b9yfuR0WZqttVPSUz0twBLh"
			+ "sJjusp7K67dg2EX5dGxE3GZ8jt412teB2Wfg+lJ9fMSQsrEXNwd m825iUzL3iq51"
			+ "yCoWglvv2oE/0JEI1bwPsIX9+YK0Vom0WUMcwN+zyey7wIDAQAB";

	//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	

	// 调试用，创建TXT日志文件夹路径
	public static String log_path = "/Users/zgdcool/Desktop/";

	// 字符编码格式 目前支持  utf-8
	public static String input_charset = "utf-8";
	
	// 签名方式，选择项：0001(RSA)、MD5
	public static String sign_type = "0001";
	// 无线的产品中，签名方式为rsa时，sign_type需赋值为0001而不是RSA

}
