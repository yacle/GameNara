package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.game.nara.models.FreeBoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardControllers {

	@Autowired
	FreeBoardDao dao;
	
	@RequestMapping("/list")
	public ModelAndView buyListHandle() throws SQLException {
		List<Map> li = dao.listAll();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "freeBoard/list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public ModelAndView buyAddGetHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","freeBoard/add");
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String buyAddPostHandle(@RequestParam Map param, ModelMap map) throws SQLException {
		boolean b = dao.addOne(param);
		if (b) {
			dao.addPoint();
			return "redirect:/freeBoard/list";
		}
		map.put("result", b);
		map.put("section", "freeBoard/add_rst");
		return  "temp";
	}
	
	@RequestMapping(path = "/view/{num}")
	public ModelAndView buyAddPostHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp");	// 바로 뷰이름지정
		Map one = dao.readOne(num);
		mav.addObject("one", one);
		mav.addObject("section", "freeBoard/view");
		return mav;
	}
	
}
