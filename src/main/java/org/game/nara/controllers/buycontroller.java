package org.game.nara.controllers;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.models.FreeBoardDao;
import org.game.nara.models.buyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/buy")
public class buycontroller {
	@Autowired
	buyDao buyDao;

	@Autowired
	FreeBoardDao freeDao;

	@Autowired
	ServletContext application;

	@Autowired
	SimpleDateFormat sdf;

	@RequestMapping(value="/list/{category}")
	public ModelAndView buyListHandle(@PathVariable(value="category")int category) throws SQLException {
		List<Map> li = buyDao.readAll();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","buy/list");
		switch(category) {
		
		case 1:
			mav.addObject("list", li);
			mav.addObject("title","삽니다 전체 ");
			mav.addObject("cnt", li.size());			
			break;
			
		case 2:
			li = buyDao.consoleread();
			mav.addObject("list", li);
			mav.addObject("title","콘솔삽니다");
			mav.addObject("cnt", li.size());			
			break;
		case 3:
			li = buyDao.titleread();
			mav.addObject("list", li);
			mav.addObject("title","게임타이틀 삽니다");
			mav.addObject("cnt", li.size());			
			break;
	
		case 4:
			li = buyDao.accessoryread();
			mav.addObject("list", li);
			mav.addObject("title","주변기기 삽니다");
			mav.addObject("cnt", li.size());			
			break;
		case 0:
			li = buyDao.othersread();
			mav.addObject("list", li);
			mav.addObject("title","기타삽니다");
			mav.addObject("cnt", li.size());			
			break;
		}
		return mav;
	}	

	@RequestMapping("/end")
	public ModelAndView buyendHandle(@RequestParam Map param) {
		int li = buyDao.endset(param);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/view");
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public ModelAndView buyAddGetHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/add");
		return mav;
	}



	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String buyaddpostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		boolean b = buyDao.addOne(param);
		String id = (String) session.getAttribute("auth_id");
		if (b) {
			freeDao.subPoint(id);
		}
			return "redirect:/buy/list/1";
	}


	@RequestMapping("/add_rst")
	@ResponseBody
	public int buyadjustHandle(@RequestParam Map param,ModelMap map) throws SQLException {
		int b = buyDao.adjust(param);
			return b;
	}
	
	@RequestMapping(path = "/view/{num}")
	public ModelAndView buyViewHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp"); // 바로 뷰이름지정
		Map one = buyDao.readOne(num);
		mav.addObject("one", one);
		mav.addObject("section", "buy/view");
		return mav;
	}
	
	@RequestMapping("/delete")
	public String deleteReplyHandle(@RequestParam String num) {
		int rst=0;
		int ok = buyDao.delete(num);
		if(ok==1) {
			rst =1;
		}
		return "redirect:/buy/list/"+rst; 
	}

}
