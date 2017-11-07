package org.game.nara.controllers;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.game.nara.MemberVO;
import org.game.nara.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/log")
public class LogController {
@Autowired
MemberDao mDao;

	@RequestMapping("/login/{fail}")
	public ModelAndView loginHandle(@PathVariable String fail) {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "log/login");
		if(fail.equals("fail")) {
			mav.addObject("result", "fail");
			return mav;
		}else {
			return mav;
		}
	}
	
	@PostMapping("/login")
	public String loginPostHandle(MemberVO vo, HttpSession session, HttpServletResponse response ) {
<<<<<<< HEAD
		String keep="";
		if(vo.getKeep()!=null) {
			keep="keep";
		}
=======
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
		vo = mDao.check(vo);
		if(vo!=null) {
			session.setAttribute("auth_id", vo.getId());
			session.setAttribute("auth_level", vo.getLev());
			session.setAttribute("auth_point",vo.getPoint());
<<<<<<< HEAD
			if(keep!=null){
				Cookie c = new Cookie("keep", vo.getId());
				c.setMaxAge(60*60*24*7);
				c.setPath("/");
				response.addCookie(c);
			}
=======
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
			return "redirect:/index";
		}else {
			return "redirect:/log/login/fail";
		}
	}
	
	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session) {
		session.removeAttribute("auth_id");
		session.removeAttribute("auth_level");
		session.removeAttribute("auth_point");
		return "redirect:/index";
	}

}
