package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.game.nara.models.buyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/buy")
public class buycontroller {
	@Autowired
	buyDao buy;

	@RequestMapping("/list")
	public ModelAndView buyListHandle() throws SQLException {
		List<Map> li = buy.readAll();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "buy/list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public ModelAndView boardAddGetHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","buy/add");
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String boardAddPostHandle(@RequestParam Map param, ModelMap map) throws SQLException {
		boolean b = buy.addOne(param);
		if (b) {
			return "redirect:/buy/list";
		}
		map.put("result", b);
		map.put("section", "buy/add_rst");
		return  "t_expr";
	}
}
