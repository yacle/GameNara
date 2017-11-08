package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.game.nara.LevelReqVO;
import org.game.nara.models.FreeBoardDao;
import org.game.nara.models.becomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		int b = becomeDao.addOne(param);
		String id = (String)session.getAttribute("auth_id");
		if (b!=0) {
			freeboardDao.addPoint(id);
		}
		return "redirect:/become_member/list";
	}
	
	@RequestMapping(path = "/view/{num}")
	public ModelAndView becomeviewHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp");	
		Map one = becomeDao.readOne(num);
		mav.addObject("one", one);
		mav.addObject("section", "become_member/view");
		return mav;
	}
	
	@RequestMapping("/delete")
	public String deleteReplyHandle(@RequestParam Map num) {
		int rst=0;
		int ok = becomeDao.delete(num);
		if(ok==1) {
			rst =1;
		}
		return "redirect:/become_member/list"; 
	}
	
	@RequestMapping("/add_rst")
	@ResponseBody
	public int buyadjustHandle(@RequestParam Map param){
		return becomeDao.adjust(param);
	}
	
	@GetMapping("/levelup")
	public ModelAndView levelupHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "become_member/levelup");
		return mav;
	}
	
	@RequestMapping("/levelReqList")
	@ResponseBody
	public List<LevelReqVO> levelReqList() {
		return becomeDao.levelReqList();
	}
	
	@RequestMapping("/levelReqAdd")
	@ResponseBody
	public int levelReqAdd(@RequestBody LevelReqVO vo){
		return becomeDao.leverReqAdd(vo);
	}
	
	@RequestMapping("/levelReqDel")
	@ResponseBody
	public int levelReqDel(@RequestParam Map map){
		System.out.println(map.toString());
		return becomeDao.leverReqDel(map.get("no"));
	}
}
