package org.game.nara.controllers;

import java.util.*;

import org.game.nara.models.MasterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView report03Handel(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("section", "master/board");
		String board = (String) map.get("board");
		String id = (String) map.get("id");
		Map total = masterDao.reportData(id);
		mav.addObject("id", id);
		switch(board) {
		case "sell":
			List listSell= (List) total.get("sell");
			mav.addObject("data", listSell);
			mav.addObject("title", "SELL BOARD");
			break;
		case "buy":
			List listBuy= (List) total.get("buy");
			mav.addObject("data", listBuy);
			mav.addObject("title", "BUY BOARD");
			break;
		case "free_dist":
			List listfreedist= (List) total.get("free_dist");
			mav.addObject("data", listfreedist);
			mav.addObject("title", "FREE_DISTRIBUTE BOARD");
			break;
		case "freeboard":
			List listFreeboard= (List) total.get("freeboard");
			mav.addObject("data", listFreeboard);
			mav.addObject("title", "FREEBOARD BOARD");
			break;
		case "after":
			List listAfter= (List) total.get("after");
			mav.addObject("data", listAfter);
			mav.addObject("title", "AFTER DEAL BOARD");
			break;
		case "reply":
			List listReply= (List) total.get("reply");
			mav.addObject("data", listReply);
			mav.addObject("title", "REPLY BOARD");
			break;
		}
		return mav;
	}
}
