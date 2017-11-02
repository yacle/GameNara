package org.game.nara.controllers;

import java.util.*;

import org.game.nara.models.MasterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/master")
public class MasterController {
@Autowired
MasterDao masterDao;

	@RequestMapping("/manage_member")
	public ModelAndView manageHandel() {
		List list = masterDao.memberList();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "master/manage_member");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/report")
	public ModelAndView reportHandel(@RequestParam String id) {
		ModelAndView mav = new ModelAndView("temp");
		Map map = masterDao.memberOne(id);
		mav.addObject("section", "master/report");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("/report02")
	public ModelAndView report02Handel(@RequestParam String id) {
		ModelAndView mav = new ModelAndView("temp");
		Map map = masterDao.reportCount(id);
		map.put("ID", id);
		mav.addObject("section", "master/report02");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("/board")
	@ResponseBody
	public List report03Handel(@RequestBody Map map) {
		List list = new ArrayList();
		String board = (String) map.get("board");
		String id = (String) map.get("id");
		Map total = masterDao.reportData(id);
		switch(board) {
		case "sell":
			list = (List) total.get("sell");
			break;
		case "buy":
			list = (List) total.get("buy");
			break;
		case "freedist":
			list = (List) total.get("free_dist");
			break;
		case "free":
			list = (List) total.get("freeboard");
			break;
		case "after":
			list = (List) total.get("after");
			break;
		case "reply":
			list = (List) total.get("reply");
			break;
		}
		return list;
	}
	
	@RequestMapping("sell/view/{no}")
	public String boardview(@PathVariable String no) {
		String url="sell/view/"+no;
		return url;
	}
}
