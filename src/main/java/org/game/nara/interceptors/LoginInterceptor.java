package org.game.nara.interceptors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("auth_id");
         
        if ( obj == null ){ 
            Cookie loginCookie = WebUtils.getCookie(request, "keep");
            if ( loginCookie != null ){ 
                String id = loginCookie.getValue();
                session.setAttribute("auth_id", id);
                response.sendRedirect("/index/1");
                return false;
            }
            return true;
        }
        return true;
    }
}