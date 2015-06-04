/**
 * 
 */
package test;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.namespace.QName;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPHeader;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.util.Base64;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestTemplate;
import org.springframework.ws.WebServiceMessage;
import org.springframework.ws.client.core.WebServiceMessageCallback;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.soap.SoapHeader;
import org.springframework.ws.soap.SoapMessage;
import org.springframework.ws.soap.saaj.SaajSoapMessage;
import org.springframework.xml.transform.StringSource;

import com.qzy.cn.entity.pro.RegionWithCategory;
import com.qzy.cn.entity.pro.Category;
import com.qzy.cn.entity.sys.Region;
import com.qzy.cn.service.SequenceService;
import com.qzy.cn.service.pro.CategoryService;
import com.qzy.cn.service.pro.RegionWithCategoryService;
import com.qzy.cn.service.sys.RegionService;
import com.qzy.cn.utils.JsonMapper;

/**
 * @author zhangguodong
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:/spring/applicationContext.xml")
public class TestSoap {

	// private static final String MESSAGE =
	// "<message xmlns=\"http://tempuri.org\">Hello Web Service World</message>";

	@Autowired
	private WebServiceTemplate webServiceTemplate;
	
	@Autowired
	RegionService regionService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	RegionWithCategoryService regionWithCategoryService;
	@Autowired
	SequenceService sequenceService;
	
	private static ThreadLocal<SimpleDateFormat> TRADE_DATE_FORMATs = new ThreadLocal<SimpleDateFormat>();
	public static  SimpleDateFormat ymdFormat() {
		SimpleDateFormat simpleDateFormat = TRADE_DATE_FORMATs.get();
		if(simpleDateFormat == null){
			simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			TRADE_DATE_FORMATs.set(simpleDateFormat);
		}
		return simpleDateFormat;
	}
	
	public String regionNo(){
		return "REGION"+ymdFormat().format(Calendar.getInstance().getTime()) + StringUtils.leftPad(sequenceService.nextSequence("cate_number", true).getValue().toString(), 6, "0");
	}
	public String cateNo(){
		return "CATE"+ymdFormat().format(Calendar.getInstance().getTime()) + StringUtils.leftPad(sequenceService.nextSequence("cate_number", true).getValue().toString(), 6, "0");
	}
	
	
	
//	@org.junit.Test
//	public void testProduct() throws IOException {
//		simpleSendAndReceive();
//	}

//	@SuppressWarnings("unchecked")
//	public static void main(String[] args) {
//		Map<Object, Object> firstCate = new HashMap<Object, Object>();
//		Map<Object, Object> secondCate = new HashMap<Object, Object>();
//		
//		RestTemplate restTemplate = new RestTemplate();
//		HttpHeaders hds = createHeaders("6854", "dnRvdXJWVG91ciBUcmF2ZWw=");
//		Object obj = restTemplate.exchange("http://vtour.experienceoz.com.au/api",
//				HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
//		Map<String, Object> map = JsonMapper.beanToMap(obj);
//		if(map.get("statusCode").equals("OK")){
//			Map<Object, Object> result = JsonMapper.readStringValueToMap((String) map.get("body"));
//			List<Map<String, Object>> list = (List<Map<String, Object>>)result.get("regions");
//			for (Map<String, Object> map1 : list) {
//				System.out.println(map1);
//				
//				RegionWithCategory regionwithcate = new RegionWithCategory();
//				Region region = new Region();
//				region.setRegionId(Integer.parseInt(map1.get("id").toString()));
//				region.setRegionCode(regionNo());
//				region.setRegionName(map1.get("name").toString());
//				region.setMore1(map1.get("urlSegment").toString());
//				regionwithcate.setRegionId(Integer.parseInt(map1.get("id").toString()));
//				regionService.isSave(region);
//				
//				String uri = "http://vtour.experienceoz.com.au/api/";
//				uri = uri + map1.get("urlSegment");
//				System.out.println(uri);
//				Object objdetail = restTemplate.exchange(uri, HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
//				Map<String, Object> mapdetail = JsonMapper.beanToMap(objdetail);
//				if(mapdetail.get("statusCode").equals("OK")){
//					Map<Object, Object> resultdetail = JsonMapper.readStringValueToMap((String) mapdetail.get("body"));
//					List<Map<String, Object>> list1 = (List<Map<String, Object>>) resultdetail.get("categories");
//					if(list!=null){
//						for (Map<String, Object> map2 : list1) {
//							if(firstCate.get(map2.get("id"))==null){
//								firstCate.put(map2.get("id"), map2);
//								
//								Category category = new Category();
//								category.setCateId(Integer.parseInt(map2.get("id").toString()));
//								category.setParentId(0);
//								category.setCateCode(cateNo());
//								category.setCateName(map2.get("name").toString());
//								category.setMore1(map2.get("urlSegment").toString());
//								categoryService.isSave(category);
//							}
//							regionwithcate.setCateId(Integer.parseInt(map2.get("id").toString()));
//							regionWithCategoryService.isSave(regionwithcate);
//							
//							String uricate = uri + "/";
//							uricate = uricate + map2.get("urlSegment");
//							Object catedetails = restTemplate.exchange(uricate, HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
//							Map<String, Object> catedetail = JsonMapper.beanToMap(catedetails);
//							if(catedetail.get("statusCode").equals("OK")){
//								Map<Object, Object> catedetailbody = JsonMapper.readStringValueToMap((String) catedetail.get("body"));
//								List<Map<String, Object>> subcategories = (List<Map<String, Object>>) catedetailbody.get("subcategories");
//								for (Map<String, Object> map3 : subcategories) {
//									if(secondCate.get(map3.get("id"))!=null){
//										secondCate.put(map3.get("id"), map2);
//										
//										Category category1 = new Category();
//										category1.setParentId(Integer.parseInt(map2.get("id").toString()));//父类id
//										category1.setCateId(Integer.parseInt(map3.get("id").toString()));
//										category1.setCateCode(cateNo());
//										category1.setCateName(map3.get("name").toString());
//										category1.setMore1(map3.get("urlSegment").toString());
//										categoryService.isSave(category1);
//										
//									}
//									System.out.println(map3);
//								}
//							}
//						}
//					}
//					
//				}
//			}
//		}
////		System.out.println(JsonMapper.beanToMap(obj));
//	}
	
	public static void main(String[] args) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders hds = createHeaders("6854", "dnRvdXJWVG91ciBUcmF2ZWw=");
		Object obj = restTemplate.exchange("http://vtour.experienceoz.com.au/api/melbourne/river-cruises",
				HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
		Map<String, Object> map = JsonMapper.beanToMap(obj);
		if(map.get("body").toString().startsWith("<!DOCTYPE html>")){
			System.out.println("ERROR");
		}else{
			System.out.println(map.toString());
		}
	}
	
	@Test
	@SuppressWarnings("unchecked")
	public void test(){
		Map<Object, Object> firstCate = new HashMap<Object, Object>();
		Map<Object, Object> secondCate = new HashMap<Object, Object>();
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders hds = createHeaders("6854", "dnRvdXJWVG91ciBUcmF2ZWw=");
		Object obj = restTemplate.exchange("http://vtour.experienceoz.com.au/api",
				HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
		Map<String, Object> map = JsonMapper.beanToMap(obj);
		if(map.get("statusCode").equals("OK")){
			Map<Object, Object> result = JsonMapper.readStringValueToMap((String) map.get("body"));
			List<Map<String, Object>> list = (List<Map<String, Object>>)result.get("regions");
			for (Map<String, Object> map1 : list) {
				System.out.println(map1);
				
				RegionWithCategory regionwithcate = new RegionWithCategory();
				Region region = new Region();
				region.setRegionId(Integer.parseInt(map1.get("id").toString()));
				region.setRegionCode(regionNo());
				region.setName(map1.get("name").toString());
				region.setMore1(map1.get("urlSegment").toString());
				regionwithcate.setRegionId(Integer.parseInt(map1.get("id").toString()));
				regionService.isSave(region);
				
				String uri = "http://vtour.experienceoz.com.au/api/";
				uri = uri + map1.get("urlSegment");
				System.out.println(uri);
				Object objdetail = restTemplate.exchange(uri, HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
				Map<String, Object> mapdetail = JsonMapper.beanToMap(objdetail);
				if(mapdetail.get("statusCode").equals("OK")){
					Map<Object, Object> resultdetail = JsonMapper.readStringValueToMap((String) mapdetail.get("body"));
					List<Map<String, Object>> list1 = (List<Map<String, Object>>) resultdetail.get("categories");
					if(list!=null){
						for (Map<String, Object> map2 : list1) {
							if(firstCate.get(map2.get("id"))==null){
								firstCate.put(map2.get("id"), map2);
								
								Category category = new Category();
								category.setCateId(Integer.parseInt(map2.get("id").toString()));
								category.setParentId(0);
								category.setCateCode(cateNo());
								category.setCateName(map2.get("name").toString());
								category.setMore1(map2.get("urlSegment").toString());
								categoryService.isSave(category);
							}
							regionwithcate.setCateId(Integer.parseInt(map2.get("id").toString()));
							regionwithcate.setId(null);
							regionWithCategoryService.isSave(regionwithcate);
							
							String uricate = uri + "/";
							uricate = uricate + map2.get("urlSegment");
							System.out.println(uricate);
							Object catedetails = restTemplate.exchange(uricate, HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
							Map<String, Object> catedetail = JsonMapper.beanToMap(catedetails);
							if(catedetail.get("statusCode").equals("OK")){
								if(!catedetail.get("body").toString().startsWith("<!DOCTYPE html>")){
									Map<Object, Object> catedetailbody = JsonMapper.readStringValueToMap((String) catedetail.get("body"));
									List<Map<String, Object>> subcategories = (List<Map<String, Object>>) catedetailbody.get("subcategories");
									for (Map<String, Object> map3 : subcategories) {
										if(secondCate.get(map3.get("id"))!=null){
										secondCate.put(map3.get("id"), map2);
										
										Category category1 = new Category();
										category1.setParentId(Integer.parseInt(map2.get("id").toString()));//父类id
										category1.setCateId(Integer.parseInt(map3.get("id").toString()));
										category1.setCateCode(cateNo());
										category1.setCateName(map3.get("name").toString());
										category1.setMore1(map3.get("urlSegment").toString());
										categoryService.isSave(category1);
										
									}
									System.out.println(map3);
								}
								}
							}
						}
					}
					
				}
			}
		}
//		System.out.println(JsonMapper.beanToMap(obj));
	}
	
//	@Test
//	@SuppressWarnings("unchecked")
//	public void test(){
//		Map<Object, Object> firstCate = new HashMap<Object, Object>();
//		Map<Object, Object> secondCate = new HashMap<Object, Object>();
//		
//		RestTemplate restTemplate = new RestTemplate();
//		HttpHeaders hds = createHeaders("6854", "dnRvdXJWVG91ciBUcmF2ZWw=");
//		Object obj = restTemplate.exchange("http://vtour.experienceoz.com.au/api",
//				HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
//		Map<String, Object> map = JsonMapper.beanToMap(obj);
//		Boolean b = false;
//		if(map.get("statusCode").equals("OK")){
//			Map<Object, Object> result = JsonMapper.readStringValueToMap((String) map.get("body"));
//			List<Map<String, Object>> list = (List<Map<String, Object>>)result.get("regions");
//			for (Map<String, Object> map1 : list) {
//				System.out.println(map1);
//				
//				String uri = "http://vtour.experienceoz.com.au/api/";
//				uri = uri + map1.get("urlSegment");
//				System.out.println(uri);
//				
//				RegionWithCategory regionwithcate = new RegionWithCategory();
//				Region region = new Region();
//				region.setRegionId(Integer.parseInt(map1.get("id").toString()));
//				region.setRegionCode(regionNo());
//				region.setName(map1.get("name").toString());
//				region.setMore1(map1.get("urlSegment").toString());
//				regionwithcate.setId(null);
//				regionwithcate.setRegionId(Integer.parseInt(map1.get("id").toString()));
//				if(b){
//					regionService.isSave(region);
//				}
//				
//				Object objdetail = restTemplate.exchange(uri, HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
//				Map<String, Object> mapdetail = JsonMapper.beanToMap(objdetail);
//				if(mapdetail.get("statusCode").equals("OK")){
//					Map<Object, Object> resultdetail = JsonMapper.readStringValueToMap((String) mapdetail.get("body"));
//					List<Map<String, Object>> list1 = (List<Map<String, Object>>) resultdetail.get("categories");
//					if(list!=null){
//						for (Map<String, Object> map2 : list1) {
//							String uricate = uri + "/";
//							uricate = uricate + map2.get("urlSegment");
//							System.out.println(uricate);
//							boolean bb = false;
//							if(firstCate.get(map2.get("id"))==null){
//								firstCate.put(map2.get("id"), map2);
//								bb = true;
//							}else{
//								bb = false;
//							}
//							if(uricate.equals("http://vtour.experienceoz.com.au/api/gold-coast/tours")){
//								b = true;
//								continue;
//							}
//							if(!b){
//								continue;
//							}
//							if(bb){
//								Category category = new Category();
//								category.setCateId(Integer.parseInt(map2.get("id").toString()));
//								category.setParentId(0);
//								category.setCateCode(cateNo());
//								category.setCateName(map2.get("name").toString());
//								category.setMore1(map2.get("urlSegment").toString());
//								categoryService.isSave(category);
//							}
//							
//							
//							regionwithcate.setCateId(Integer.parseInt(map2.get("id").toString()));
//							regionWithCategoryService.isSave(regionwithcate);
//							
//							Object catedetails = restTemplate.exchange(uricate, HttpMethod.GET, new HttpEntity<Object>(hds), String.class);
//							Map<String, Object> catedetail = JsonMapper.beanToMap(catedetails);
//							if(catedetail.get("statusCode").equals("OK")){
//								if(!catedetail.get("body").toString().startsWith("<!DOCTYPE html>")){
//									Map<Object, Object> catedetailbody = JsonMapper.readStringValueToMap((String) catedetail.get("body"));
//									List<Map<String, Object>> subcategories = (List<Map<String, Object>>) catedetailbody.get("subcategories");
//									for (Map<String, Object> map3 : subcategories) {
//										if(secondCate.get(map3.get("id"))!=null){
//										secondCate.put(map3.get("id"), map2);
//										
//										Category category1 = new Category();
//										category1.setParentId(Integer.parseInt(map2.get("id").toString()));//父类id
//										category1.setCateId(Integer.parseInt(map3.get("id").toString()));
//										category1.setCateCode(cateNo());
//										category1.setCateName(map3.get("name").toString());
//										category1.setMore1(map3.get("urlSegment").toString());
//										categoryService.isSave(category1);
//										
//									}
//									System.out.println(map3);
//								}
//								}
//							}
//						}
//					}
//					
//				}
//			}
//		}
////		System.out.println(JsonMapper.beanToMap(obj));
//	}
	
	@SuppressWarnings("serial")
	public static HttpHeaders createHeaders(final String username, final String password) {
		return new HttpHeaders() {
			{
				String auth = username + ":" + password;
				byte[] encodedAuth = Base64.encodeBase64(auth.getBytes(Charset
						.forName("US-ASCII")));
				String authHeader = "Basic " + new String(encodedAuth);
				set("Authorization", authHeader);
			}
		};
	}

	/**
	 * 参考实现 http://docs.spring.io/spring-ws/sites/1.5/reference/html/client.html
	 * 
	 * @throws IOException
	 */
	// send to the configured default URI
	public void simpleSendAndReceive() throws IOException {
		String filePath = "/Users/zgdcool/Documents/workspace/carbon/src/main/resources/product.xml";
		String reqeustInfo = FileUtils.readFileToString(new File(filePath));

		StreamSource source = new StreamSource(new StringReader(reqeustInfo));
		StringWriter stringWriter = new StringWriter();
		StreamResult result = new StreamResult(stringWriter);
		webServiceTemplate.sendSourceAndReceiveToResult(source,
				new WebServiceMessageCallback() {
					public void doWithMessage(WebServiceMessage message) {
						try {
							// 推荐实现
							createSoapSecurity(message);
							// 原生实现
							// createSOAPSecurity(message);
						} catch (Exception e) {
							// getLogger().error(e.getMessage(), e);
						}
					}
				}, result);
		System.out.println(stringWriter.toString());
	}

	// send to an explicit URI
	// public void customSendAndReceive() {
	// StreamSource source = new StreamSource(new StringReader(MESSAGE));
	// StreamResult result = new StreamResult(System.out);
	// webServiceTemplate.sendSourceAndReceiveToResult(
	// "http://localhost:8080/AnotherWebService", source, result);
	// }

	/**
	 * 参考实现 http://stackoverflow.com/questions/2274378/add-soapheader-to-org-
	 * springframework-ws-webservicemessage
	 * 
	 * @param message
	 * @throws Exception
	 */
	private void createSoapSecurity(WebServiceMessage message) throws Exception {
		String securityInfo = FileUtils
				.readFileToString(new File(
						"/Users/zgdcool/Documents/workspace/carbon/src/main/resources/security.xml"));
		SoapMessage soapMessage = (SoapMessage) message;
		StringSource headerSource = new StringSource(securityInfo);
		SoapHeader header = soapMessage.getSoapHeader();
		Transformer transformer = TransformerFactory.newInstance()
				.newTransformer();
		transformer.transform(headerSource, header.getResult());
	}

	/**
	 * 远程实现， 参考 http://docs.oracle.com/javaee/5/tutorial/doc/bnbhr.html#bnbia
	 * http
	 * ://stackoverflow.com/questions/19140265/spring-ws-client-add-soapheader
	 * 
	 * @param message
	 * @throws Exception
	 */
	public void createSOAPSecurity(WebServiceMessage message) throws Exception {
		String wsseSpace = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";
		String wsuSpace = "http://docs.oasisopen.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd";
		String soapSpace = "http://schemas.xmlsoap.org/soap/envelope";
		SaajSoapMessage saajSoapMessage = (SaajSoapMessage) message;
		SOAPMessage soapMessage = saajSoapMessage.getSaajMessage();
		SOAPPart soapPart = soapMessage.getSOAPPart();
		SOAPEnvelope envelope = soapPart.getEnvelope();
		SOAPHeader header = soapMessage.getSOAPHeader();
		SOAPBody body = soapMessage.getSOAPBody();
		envelope.removeNamespaceDeclaration(envelope.getPrefix());
		envelope.addNamespaceDeclaration("soap", soapSpace);

		envelope.setPrefix("soap");
		header.setPrefix("soap");
		body.setPrefix("soap");

		QName security = new QName(wsseSpace, "Security", "wsse");
		SOAPElement headerElement = header.addChildElement(security);

		headerElement.addNamespaceDeclaration("wsu", wsuSpace);
		headerElement.addAttribute(new QName(null, "mustUnderstand", "soap"),
				"1");

		SOAPElement userNameToken = headerElement.addChildElement(new QName(
				wsseSpace, "UsernameToken", "wsse"));
		userNameToken.addAttribute(new QName(wsuSpace, "Id", "wsu"),
				"UsernameToken-3");

		SOAPElement userName = userNameToken.addChildElement(new QName(
				wsseSpace, "Username", "wsse"));
		userName.addTextNode("tuniu");

		SOAPElement Passwor = userNameToken.addChildElement(new QName(
				wsseSpace, "Password", "wsse"));
		Passwor.addAttribute(
				new QName("Type"),
				"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText");
		Passwor.addTextNode("tuniu6743");

	}
}
