package org.game.nara.controllers;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.game.nara.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String loginPostHandle(MemberVO vo, HttpSession session) {
		vo = mDao.check(vo);
		if(vo!=null) {
			session.setAttribute("auth_id", vo.getId());
			session.setAttribute("auth_level", vo.getLev());
			session.setAttribute("auth_point",vo.getPoint());
			return "redirect:/index";
		}else {
			return "redirect:/log/login/fail";
		}
	}
	
	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session) {
		session.removeAttribute("auth_id");
		return "redirect:/index";
	}

}
