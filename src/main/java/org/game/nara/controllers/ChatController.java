package org.game.nara.controllers;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.game.nara.models.ChatDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat")
public class ChatController {
@Autowired
ChatDao chatDao;

	@RequestMapping("/note")
	public ModelAndView noteSendHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("section", "chat/note");
		mav.addObject("id", id);
		return mav;
	}
	
	@PostMapping("/note_send")
	@ResponseBody
	public String noteSendHandle(@RequestParam Map map) {
		int r = chatDao.noteAddHandle(map);
		if(r!=0) {
			return "send complate";
		}else {
			return "send fail";
		}
	}
	
	@PostMapping("/note_cnt")
	@ResponseBody
	public int note_cntHandle(@RequestParam Map map) {
		System.out.println(map.toString());
		int r = chatDao.receiv_cntHandle((String)map.get("id"));
		return r;
	}
}
