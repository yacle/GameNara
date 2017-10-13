package org.game.nara.controllers;

import java.util.*;

import org.game.nara.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/join")
	public ModelAndView joinHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "member/join");
		return mav;
	}
	
	@PostMapping("/join")
	public ModelAndView joinPostHandle(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView("temp");
		int r = mDao.addMember(map);
		if(r!=0) {
			mav.addObject("section", "log/login");
		}else {
			mav.addObject("section", "member/join");
			mav.addObject("result", "fail");
		}
		return mav;
	}
	
	@RequestMapping("/idcheck")
	@ResponseBody
	public int idcheckHandle(@RequestParam Map map) {
		int r = mDao.idcheck((String)map.get("id"));
		return r;
	}
	
	@RequestMapping("/info")
	public ModelAndView infoHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "member/info");
		return mav;
	}

}
