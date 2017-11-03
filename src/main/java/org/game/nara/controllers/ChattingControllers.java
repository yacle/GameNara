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
		String receiver = (String) map.get("receiver");
		String sender = (String) map.get("sender");
		String msg = (String) map.get("msg");
		mav.addObject("section", "chatting/chatPage");
		cws.sendMessageToUser(receiver, msg, sender);
		return mav;
	}
	
	@PostMapping("/confirm")
	@ResponseBody
	public String chatConfirmHandle(@RequestParam Map map) {
		String rst="";
		String chat = (String) map.get("chat");
		String receiver = (String) map.get("receiver");
		String sender = (String) map.get("sender");
		try {
			rst = cws.confirmToUser(chat,receiver,sender);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rst;
	}
}
