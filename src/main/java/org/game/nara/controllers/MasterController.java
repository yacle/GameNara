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
	public ModelAndView manageHandel() throws Exception {
		List list = masterDao.memberList();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "master/manage_member");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/report")
	public ModelAndView reportHandel(@RequestParam String id) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		Map map = masterDao.memberOne(id);
		mav.addObject("section", "master/report");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("/report02")
	public ModelAndView report02Handel(@RequestParam String id) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		Map map = masterDao.reportCount(id);
		map.put("ID", id);
		mav.addObject("section", "master/report02");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("/board")
	@ResponseBody
	public List report03Handel(@RequestParam Map map) throws Exception {
		List list = new ArrayList();
		String board = (String) map.get("board");
		String id = (String) map.get("id");
		switch(board) {
		case "sell":
			list = masterDao.sellData(id);
			break;
		case "buy":
			list = masterDao.buyData(id);
			break;
		case "freedist":
			list = masterDao.freedistData(id);
			break;
		case "free":
			list = masterDao.freeData(id);
			break;
		case "after":
			list = masterDao.afterData(id);
			break;
		}
		return list;
	}

	@RequestMapping("/chgLevel")
	@ResponseBody
	public String levelChange(@RequestParam Map map) throws Exception {
		int r = masterDao.levelChange(map);
		if(r==0) {
			return "update fail";
		}else {
			return "update success";
		}
	}
	
}



