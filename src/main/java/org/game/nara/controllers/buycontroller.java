package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.game.nara.models.FreeBoardDao;
import org.game.nara.models.buyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/buy")
public class buycontroller {
	@Autowired
	buyDao buyDoa;
	
	@Autowired
	FreeBoardDao freeDao;

	@RequestMapping("/list")
	public ModelAndView buyListHandle() throws SQLException {
		List<Map> li = buyDoa.readAll();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	@RequestMapping("/console_list")
	public ModelAndView buyconsoleHandle() throws SQLException {
		List<Map> li = buyDoa.consoleread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/console_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	@RequestMapping("/accessory_list")
	public ModelAndView buyaccessoryHandle() throws SQLException {
		List<Map> li = buyDoa.accessoryread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/accessory_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	@RequestMapping("/title_list")
	public ModelAndView buytitleHandle() throws SQLException {
		List<Map> li = buyDoa.titleread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/title_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	@RequestMapping("/others_list")
	public ModelAndView buyothersHandle() throws SQLException {
		List<Map> li = buyDoa.othersread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/others_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	                  
	@RequestMapping("/end")
	public ModelAndView buyendHandle(@RequestParam Map param) {
		int li=buyDoa.endset(param);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","buy/view");
		mav.addObject("one", li);
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public ModelAndView buyAddGetHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","buy/add");
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String buyAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		boolean b = buyDoa.addOne(param);
		String id = (String)session.getAttribute("auth_id");
		if (b) {
			freeDao.subPoint(id);
			return "redirect:/buy/list";
		}
		map.put("result", b);
		map.put("section", "buy/add_rst");
		return  "temp";
	}
	
	@RequestMapping(path = "/view/{num}")
	public ModelAndView freeBoardViewHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp");	// 바로 뷰이름지정
		Map one = buyDoa.readOne(num);
		List reply = (List) one.get("reply");
		Map readOne = (Map) one.get("one");
		
		mav.addObject("data", one);
		mav.addObject("section", "buy/view");
		return mav;
	}

}
