package com.qzy.cn.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriUtils;

/**
 *
 * @author long.jiang
 * @version  创建时间：2015-2-4 上午10:04:23
 */
public class URLUtils {
	private static Logger logger = LoggerFactory.getLogger(URLUtils.class);
	
	public static int getDays(Date from){
		Calendar nowCalendar =Calendar.getInstance();
		Calendar fromCalendar =Calendar.getInstance();
		nowCalendar.setTimeInMillis(System.currentTimeMillis());
		fromCalendar.setTime(from);
		return (nowCalendar.get(Calendar.YEAR) - fromCalendar.get(Calendar.YEAR))*365
		+nowCalendar.get(Calendar.DAY_OF_YEAR) -fromCalendar.get(Calendar.DAY_OF_YEAR) ;
				
		
	}
	
	public static String getDateString(){
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sf.format(new Date());
	}
	
	/**
	 * 把 queryUrl参数 变为 url 地址
	 * xxxx/c-yy?...&cateId=zz --> xxxx/c-zz?...
	 * @param url
	 * @param changeValues
	 * @param encodeFlag
	 * @return
	 */
	public static String searchUrl(String url, String changeValues, Boolean encodeFlag) {
		// path路径替换
		if (changeValues.indexOf("cateId=") > -1) {
			String cateId = getQuestParam(changeValues, "cateId");
			url = url.replaceFirst("c-(\\d+)", "c-" + cateId);
			changeValues = changeValues.replaceFirst("cateId=(\\d+)", "");
		}
		// 关键词替�?
		if (changeValues.indexOf("keyWord=") > -1) {
			String keyWord = getQuestParam(changeValues, "keyWord");
			url = url.replaceFirst("k-([^-]*)", "k-" + keyWord);
			changeValues = changeValues.replaceFirst("keyWord=([^&]*)", "");
		}

		// 页码替换
		if (changeValues.indexOf("pageNo=") > -1) {
			String pageNo = getQuestParam(changeValues, "pageNo");
			url = url.replaceFirst("p\\d+", "p" + pageNo);
			changeValues = changeValues.replaceFirst("pageNo=([^&]*)", "");
		}

		// 是否�?��编码
		if (encodeFlag) {
			changeValues = encodeString(changeValues);
		}
		return pageUrl(url, changeValues);

	}

	public static String encodeString(String encodeString) {
		// 编码
		try {
			return UriUtils.encodeQuery(encodeString, "GBK");
		} catch (UnsupportedEncodingException e) {
			logger.error("url 参数编码错误", e);
		}
		return "";
	}

	/**
	 * 
	 * pageUrl:(url操作). (url变更).
	 * 
	 * @author zengxiangzhu
	 * @param url
	 *            原始url
	 * @param changeValues
	 *            �?��变动的参�?
	 * @return
	 * @since JDK 1.6
	 */
	public static String pageUrl(String url, String changeValues) {
		if (StringUtils.isEmpty(url)) {
			return "";
		}
		// 解析url
		String[] urlAndQuery = url.split("\\?");
		String baseUrl = urlAndQuery[0];
		String queryParam = "";
		if (urlAndQuery.length == 2) {
			queryParam = urlAndQuery[1];
		}
		List<String> paramList = null;

		// 变动的请求参�?
		if (StringUtils.isNotEmpty(changeValues)) {
			paramList = new ArrayList<String>();
			if (StringUtils.isNotEmpty(queryParam)) {
				paramList.addAll(Arrays.asList(queryParam.split("&")));
			}
			int oldLength = paramList.size();
			String[] keyValues = changeValues.split("&");
			List<String> sinList = findSelectedParam(keyValues, "sin");
			for (String keyValue : keyValues) {
				if (keyValue.indexOf("=") == -1 || keyValue.startsWith("sin=")) {
					continue;
				}
				String[] keyAndValue = keyValue.split("=");
				String keyParam = keyAndValue[0];
				String valueParam = "";
				if (keyAndValue.length == 2) {
					valueParam = keyAndValue[1];
				}
				// 更新判断
				boolean changeFlag = Boolean.FALSE;
				for (int i = 0; i < oldLength; i++) {
					if (paramList.get(i).startsWith(keyParam + "=")) {
						changeFlag = Boolean.TRUE;
						//清除内容
						if (StringUtils.isEmpty(valueParam)) {
							paramList.set(i, keyValue);
							continue;
						}
						// ------------替换内容  start------------ 
						
						//强制单替�?
						if (isSelected(sinList, keyParam)) {
							paramList.set(i, keyValue);
							continue;
						}
						
						//------默认的配�?start---------
						// 属�?多�?
						if (keyParam.contains("attr_")) {
							String returnParam = multiParam(paramList.get(i), valueParam);
							if (returnParam != null) {
								paramList.set(i, returnParam);
							}
						} else {
							paramList.set(i, keyValue);
						}
						//------默认的配�?end---------
						
						// ------------替换内容 end ------------ 
						break;
					}
				}
				if (!changeFlag) {
					paramList.add(keyValue);
				}

			}
		}
		// list转换成字符串
		if (paramList != null && !paramList.isEmpty()) {
			StringBuilder paramBuilder = new StringBuilder();
			for (String param : paramList) {
				if (param.split("=").length == 2) {
					if (paramBuilder.length() > 0) {
						paramBuilder.append("&");
					}
					paramBuilder.append(param);
				}
			}
			queryParam = paramBuilder.toString();
		}

		// 返回结果
		try {
			String urlPath = UriUtils.encodePath(baseUrl, "GBK");
			if (StringUtils.isNotEmpty(queryParam)) {
				return urlPath + "?" + queryParam;
			} else {
				return urlPath;
			}

		} catch (UnsupportedEncodingException e) {
			logger.error("url编码错误", e);

		}
		return url;

	}

	/**
	 * 
	 * isSelected:(判断是否被�?�?. 
	 *
	 * @author zengxiangzhu
	 * @param selectedList
	 * @param keyParam
	 * @return
	 * @since JDK 1.6
	 */
	private static Boolean isSelected(List<String> selectedList, String keyParam) {
		if (selectedList != null) {
//			for (String sinPram : selectedList) {
//				if (keyParam.startsWith(sinPram)) {
//					return Boolean.TRUE;
//				}
//			}
			return selectedList.contains(keyParam);
		}
		return Boolean.FALSE;
	}
	
	/**
	 * 
	 * getKeyValue:(获取参数�?. 
	 *
	 * @author zengxiangzhu
	 * @param keyValues
	 * @param paramName
	 * @return
	 * @since JDK 1.6
	 */
	private static String getKeyValue(String[] keyValues, String paramName) {
		// 判断是否�?��多属�?
		for (String keyValue : keyValues) {
			if (keyValue.startsWith(paramName + "=")) {
				return keyValue;
			}
		}
		return "";
	}

	/**
	 * 
	 * findSelectedParam:(获取选中的参数名列表). 
	 *
	 * @author zengxiangzhu
	 * @param keyValues
	 * @param selectedPre
	 * @return
	 * @since JDK 1.6
	 */
	private static List<String> findSelectedParam(String[] keyValues, String selectedPre) {
		String keyValue = getKeyValue(keyValues, selectedPre);
		String[] keyItem = keyValue.split("=");
		if (keyItem.length == 2) {
			List<String> mulOrSinList = Arrays.asList(keyItem[1].split(","));
			return mulOrSinList;
		}
		return null;
	}

	private static String multiParam(String urlParam, String valueParam) {
		if (StringUtils.isEmpty(urlParam)) {
			return null;
		}
		if (!urlParam.endsWith(",")) {
			urlParam += ",";
		}
		String attrRep = urlParam.replaceFirst("(?<=[\\,|=])" + valueParam + "\\,", "");
		if (urlParam.equals(attrRep)) {
			attrRep += valueParam;
		}
		if (attrRep.split("=").length == 2) {
			return attrRep.replaceAll(",*$", "");
		} else {
			return null;
		}
	}

	private static String getQuestParam(String questString, String paramName) {
		if (StringUtils.isEmpty(questString)) {
			return "";
		}
		int valStartIndex = questString.indexOf(paramName + "=");
		int valEndIndex = questString.indexOf("&", valStartIndex);
		if (valEndIndex == -1)
			valEndIndex = questString.length();
		return questString.substring(valStartIndex + paramName.length() + 1, valEndIndex);
	}
	
	public static String getCurrentUrl(HttpServletRequest request)
			throws UnsupportedEncodingException {
		StringBuilder sb = new StringBuilder();
		sb.append(request.getRequestURL());
		if (request.getQueryString() != null)
			sb.append("?").append(escapeParamString(request.getQueryString()));
		if (sb.toString().endsWith("?"))
			sb.substring(0, sb.length() - 1);
		return URLEncoder.encode(sb.toString(), "UTF-8");
	}

	public static String escapeParamString(String value) {

		if (value == null)
			return "";

		// value = StringUtils.replace(value, "|", "");
		value = StringUtils.replace(value, "&amp;", "");
		// value = StringUtils.replace(value, ";", "");
		value = StringUtils.replace(value, "$", "");
		// value = StringUtils.replace(value, "%", "");
		// value = StringUtils.replace(value, "@", "");
		value = StringUtils.replace(value, "'", "");
		value = StringUtils.replace(value, "\"", "");
		value = StringUtils.replace(value, "\\'", "");
		value = StringUtils.replace(value, "&lt;", "");
		value = StringUtils.replace(value, "&gt;", "");
		value = StringUtils.replace(value, "<", "");
		value = StringUtils.replace(value, ">", "");
		value = StringUtils.replace(value, "(", "");
		value = StringUtils.replace(value, ")", "");
		value = StringUtils.replace(value, "+", "");
		// value = StringUtils.replace(value, "\n", "");
		value = StringUtils.replace(value, "\r", "");
		// value = StringUtils.replace(value, ",", "");
		value = StringUtils.replace(value, "\\", "");

		return value;
	}

 }
