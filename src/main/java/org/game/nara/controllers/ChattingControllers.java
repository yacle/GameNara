package org.game.nara.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.game.nara.ChatVO;
import org.game.nara.models.ChattingDao;
import org.game.nara.wsControllers.ChattingWSHandler;
import org.game.nara.wsControllers.NoteWSHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chatting")
public class ChattingControllers {
	@Autowired
	NoteWSHandler nws;	
	@Autowired
	ChattingWSHandler cws;
	@Autowired
	ObjectMapper mapper;
	@Autowired
	ChattingDao chattingDao;

	@GetMapping("/chatPage")
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
	
	@PostMapping("/deny")
	@ResponseBody
	public void noteSendHandle(@RequestParam Map map) throws IOException {
		String receiver = (String) map.get("receiver");
		String sender = (String) map.get("sender");
		String msg = (String) map.get("msg");
		cws.sendMessageToUser(receiver, msg, sender);
	}
	
	@PostMapping("/save")
	@ResponseBody
	public int chattingSaveHandle(ChatVO vo) throws IOException {
		return chattingDao.addChatting(vo);
	}
	
	@RequestMapping("/chatList")
	public ModelAndView ChatListHandel(@RequestParam Map map){
		List<ChatVO> list = chattingDao.selectChat((String)map.get("id"));
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "chatting/chatList");
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		return mav;
	}
	
	@RequestMapping("/chatView")
	public ModelAndView chatViewHandle(@RequestParam Map map) {
		ChatVO vo = chattingDao.selectOne((String)map.get("no"));
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "chatting/chatView");
		mav.addObject("vo", vo);
		return mav;
	}
	
	@PostMapping("/deleteChat")
	@ResponseBody
	public int deleteChatHandle(@RequestParam Map map) throws JsonParseException, JsonMappingException, IOException {
		Map m = new HashMap();
		String id = (String)map.get("id");
		List<String> list =  mapper.readValue((String)map.get("arr"), List.class);
		m.put("list", list);
		m.put("id", id);
		return chattingDao.deleteChat(m);
	}
	
}
