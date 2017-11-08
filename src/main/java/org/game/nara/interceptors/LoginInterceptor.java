package org.game.nara.interceptors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			HttpSession session = request.getSession();
			Cookie[] ar=request.getCookies();
			if(session.isNew() && ar!=null) {
				for(Cookie cm : ar){
					if(cm.getName().equals("keep")){
						String id = cm.getValue();
						session.setAttribute("auth_id", id);
					}
				}
				response.sendRedirect("/index/1");
				return false;
			}else {
				return true;
			}
	}
}