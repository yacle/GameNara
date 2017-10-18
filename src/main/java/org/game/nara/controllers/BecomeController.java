package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.game.nara.models.FreeBoardDao;
import org.game.nara.models.becomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/become_member")
public class BecomeController {
	@Autowired
	becomeDao becomeDao;
	
	@Autowired
	FreeBoardDao freeboardDao;

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
		mav.addObject("section", "become_member/add");
		return mav;
	}

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String becomeAddPostHandle(@RequestParam Map param, ModelMap map,HttpSession session) throws SQLException {
		boolean b = becomeDao.addOne(param);
		String id = (String)session.getAttribute("auth_id");
		if (b) {
			freeboardDao.addPoint(id);
			freeboardDao.upLevel(id);
			return "redirect:/become_member/list";
		}
		map.put("result", b);
		map.put("section", "become_member/add_rst");
		return "temp";
	}
	
	@RequestMapping(path = "/view/{num}")
	public ModelAndView becomeviewHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp");	
		Map one = becomeDao.readOne(num);
		int b = becomeDao.countup(num);
		one.put("countup", b);
		mav.addObject("one", one);
		mav.addObject("section", "become_member/view");
		return mav;
	}

}