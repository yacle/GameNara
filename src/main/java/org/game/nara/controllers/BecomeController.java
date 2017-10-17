package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.game.nara.models.becomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/become_member")
@Controller
public class BecomeController {
@Autowired
becomeDao becomeDao;

@RequestMapping("/list")
public ModelAndView becomeListHandle() throws SQLException {
	List<Map> li = becomeDao.readAll();
	ModelAndView mav = new ModelAndView("temp");
	mav.addObject("section", "become_member/list");
	mav.addObject("list", li);
	mav.addObject("cnt", li.size());
	return mav;
}

@RequestMapping(path = "/add", method = RequestMethod.GET)
public ModelAndView becomeAddGetHandle() {
	ModelAndView mav = new ModelAndView("temp");
	mav.addObject("section","become_member/add");
	return mav;
}

@RequestMapping(path = "/add", method = RequestMethod.POST)
public String becomeAddPostHandle(@RequestParam Map param, ModelMap map) throws SQLException {
	boolean b = becomeDao.addOne(param);
	if (b) {
		return "redirect:/become_member/list";
	}
	map.put("result", b);
	map.put("section", "become_member/add_rst");
	return  "temp";
}

}
