package org.game.nara.controllers;

import java.io.IOException;
import java.util.Map;

import org.game.nara.wsControllers.ChattingWSHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chatting")
public class ChattingControllers {
	
	@Autowired
	ChattingWSHandler cws;
	
	@Autowired
	ObjectMapper mapper;

	@RequestMapping("/chatPage")
	public ModelAndView chatSendHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("section", "chatting/chatPage");
		mav.addObject("id", id);
		return mav;
	}
	
	@PostMapping("/chatPage")
	public ModelAndView chatPageHandle(@RequestParam Map map) throws IOException {
		ModelAndView mav = new ModelAndView();
		String recev = (String) map.get("receiver");
		String send = (String) map.get("sender");
		String msg = (String) map.get("msg");
		System.out.println("받는인간="+recev+"/ 보낸인간="+send+"/내용="+msg);
		mav.addObject("section", "chatting/chatPage");
		cws.sendMessageToUser(recev, msg, send);
		return mav;
	}
	
	@PostMapping("/confirm")
	@ResponseBody
	public String chatConfirmHandle(@RequestParam Map map) {
		String chat = (String) map.get("chat");
		String id = (String) map.get("id");
		System.out.println(chat+" /=/"+id);
		try {
			cws.confirmToUser(chat,id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "ok";
		
	}
}
