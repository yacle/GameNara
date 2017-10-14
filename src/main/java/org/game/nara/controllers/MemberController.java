package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDao mDao;
	@Autowired
	ServletContext application;
	@Autowired
	SimpleDateFormat sdf;
	
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
	
	@GetMapping("/info")
	public ModelAndView profileGetHandle(HttpSession session) {
		ModelAndView mav = new ModelAndView("temp");
		String id = (String)session.getAttribute("auth_id");
		Map map = mDao.readProfile(id);
		mav.addObject("section", "member/info");
		mav.addObject("map", map);
		return mav;
	}
	
	@PostMapping("/profile")
	public ModelAndView profilePostHandle(Map map, @RequestParam(name="profile") MultipartFile f, HttpSession session) throws IllegalStateException, IOException {
		if(f.getSize()>0) {
		String fmt = sdf.format(System.currentTimeMillis());
		String id = (String)session.getAttribute("auth_id");
		System.out.println("id="+id);
		String type = f.getContentType();
		String[] fileType = type.split("/");
		String name = id+"_"+fmt+"."+fileType[1];
		System.out.println(application.getRealPath("/profiles"));
		File up = new File(application.getRealPath("/profiles"), name);
		f.transferTo(up);
		map.put("id", id);
		map.put("profile",name);
		int r = mDao.addProfile(map);
		}
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "member/info");
		return mav;
	}

}
