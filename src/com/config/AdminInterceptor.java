package com.config;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 后台登录验证拦截器
 */
public class AdminInterceptor extends HandlerInterceptorAdapter{

	/**
	 * 检测登录状态
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		if(uri.contains("images") || uri.contains("js") || 
				uri.contains("login") || uri.contains("logout")) {
			return true; // 不拦截路径
		}
		Object admin = request.getSession().getAttribute("admin");
		if (Objects.nonNull(admin) && !admin.toString().trim().isEmpty()) {
			return true; // 登录验证通过
		}
		response.sendRedirect("login.jsp");
		return false; // 其他情况一律拦截
	}

}
