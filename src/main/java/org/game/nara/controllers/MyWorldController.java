package org.game.nara.controllers;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.game.nara.models.MyWorldDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/MyWorld")
public class MyWorldController {
@Autowired
MyWorldDao mydao;

@RequestMapping("/myworld")
public ModelAndView freeBoardViewHandle(HttpSession session) throws Exception {
	String id = (String) session.getAttribute("auth_id");
	ModelAndView mav = new ModelAndView();
	Map total = mydao.mysearch(id);
	mav.addObject("section", "/MyWorld/myworld");
	mav.addObject("total", total);
	return mav;
	}
}

