package org.game.nara.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MasterInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			HttpSession session = request.getSession();
			Integer level = (Integer) session.getAttribute("auth_level");
			if(level!=null) {
				if(9>level){
					response.sendRedirect("/index/2");
					return false;
				}else {
					return true;
				}
			}else {
				response.sendRedirect("/index/2");
				return false;
			}
	}
}