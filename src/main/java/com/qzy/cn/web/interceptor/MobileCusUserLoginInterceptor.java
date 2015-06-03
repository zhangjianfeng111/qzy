package com.qzy.cn.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.util.ClassUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.qzy.cn.conf.DataConfig;
import com.qzy.cn.utils.URLUtils;

/**
 * @author zgdcool
 * @version 2014年10月22日 下午3:59:23
 */
public class MobileCusUserLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler )
			throws Exception {
		HttpSession session = request.getSession();
		if (isNeedLogin(handler, URLUtils.getCurrentUrl(request)) && session.getAttribute(DataConfig.CURRENT_USER) == null) {
			response.sendRedirect(request.getContextPath() + "/mobile/cus/login.html");
			return false;
		}

		return true;
	}

	public Boolean isNeedLogin( Object obj, String s ) {
		if (ClassUtils.isAssignableValue(HandlerMethod.class, obj)) {
			HandlerMethod hm = (HandlerMethod) obj;
			if (AnnotationUtils.findAnnotation(hm.getBeanType(), MobileCusUserLogin.class) != null
					|| hm.getMethodAnnotation(MobileCusUserLogin.class) != null) {
				return Boolean.TRUE;
			}
		}
		return Boolean.FALSE;
	}

}
