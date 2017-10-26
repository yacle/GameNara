package org.game.nara.controllers;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.game.nara.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/log")
public class LogController {
@Autowired
MemberDao mDao;

	@RequestMapping("/login")
	public ModelAndView loginHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "log/login");
		return mav;
	}
	
	@PostMapping("/login")
	public ModelAndView loginPostHandle(MemberVO vo, HttpSession session) {
		vo = mDao.check(vo);
		System.out.println(vo.toString());

		ModelAndView mav = new ModelAndView("temp");
<<<<<<< HEAD
		if(mDao.check(map)!=null) {
			Map m = mDao.check(map);
			mDao.logcnt((String)map.get("id"));
			int r = m.size();
			session.setAttribute("auth_id", map.get("id"));
			session.setAttribute("auth_level", m.get("LEV"));
=======

		if(vo.getId()!=null) {
			session.setAttribute("auth_id", vo.getId());
			session.setAttribute("auth_level", vo.getLev());
			session.setAttribute("auth_point",vo.getPoint());
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
			mav.addObject("section", "index");
		}else {
			mav.addObject("section", "log/login");
			mav.addObject("result", "fail");
		}
		return mav;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logoutHandle(HttpSession session) {
		ModelAndView mav = new ModelAndView("temp");
		session.removeAttribute("auth_id");
		mav.addObject("section", "index");
		return mav;
	}

}
