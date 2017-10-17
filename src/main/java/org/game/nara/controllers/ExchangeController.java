package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.game.nara.models.ExchangeDao;
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
@RequestMapping("/exchange")
public class ExchangeController {
	@Autowired
	ExchangeDao exchangeDao;
	
	@Autowired
	FreeBoardDao freeDao;

	@RequestMapping("/list")
	public ModelAndView buyListHandle() throws SQLException {
		List<Map> li = exchangeDao.readAll();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "exchange/list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	@RequestMapping("/console_list")
	public ModelAndView buyconsoleHandle() throws SQLException {
		List<Map> li = exchangeDao.consoleread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "exchange/console_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	@RequestMapping("/accessory_list")
	public ModelAndView buyaccessoryHandle() throws SQLException {
		List<Map> li = exchangeDao.accessoryread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "exchange/accessory_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	@RequestMapping("/title_list")
	public ModelAndView buytitleHandle() throws SQLException {
		List<Map> li = exchangeDao.titleread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "exchange/title_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	@RequestMapping("/others_list")
	public ModelAndView buyothersHandle() throws SQLException {
		List<Map> li = exchangeDao.othersread();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "exchange/others_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	                  
	@RequestMapping("/end")
	public ModelAndView buyendHandle(@RequestParam Map param) {
		int li=exchangeDao.endset(param);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","exchange/view");
		mav.addObject("one", li);
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public ModelAndView buyAddGetHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","exchange/add");
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String buyAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session) throws SQLException {
		boolean b = exchangeDao.addOne(param);
		String id = (String)session.getAttribute("auth_id");
		if (b) {
			freeDao.subPoint(id);
			return "redirect:/exchange/list";
		}
		map.put("result", b);
		map.put("section", "exchange/add_rst");
		return  "temp";
	}
	
	@RequestMapping(path = "/view/{num}")
	public ModelAndView buyviewHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp");	// 바로 뷰이름지정
		Map one = exchangeDao.readOne(num);
		int b = exchangeDao.countup(num);
		one.put("countup", b);
		mav.addObject("one", one);
		mav.addObject("section", "exchange/view");
		return mav;
	}

}
