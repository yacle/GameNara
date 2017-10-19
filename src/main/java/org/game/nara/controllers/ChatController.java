package org.game.nara.controllers;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import org.game.nara.models.ChatDao;
import org.game.nara.wsControllers.NoteWSHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chat")
public class ChatController {
@Autowired
ChatDao chatDao;
@Autowired
NoteWSHandler nws;
@Autowired
ObjectMapper mapper;


	@RequestMapping("/noteSend")
	public ModelAndView noteSendHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("section", "chat/noteSend");
		mav.addObject("id", id);
		return mav;
	}
	
	@PostMapping("/note_send")
	@ResponseBody
	public String noteSendHandle(@RequestParam Map map) {
		int r = chatDao.noteAddHandle(map);
		nws.sendMessageToUser((String)map.get("receiver"), (String)map.get("content"));
		if(r!=0) {
			return "send complate";
		}else {
			return "send fail";
		}
	}
	
	@PostMapping("/note_cnt")
	@ResponseBody
	public int note_cntHandle(@RequestParam Map map) {
		int r = chatDao.receiv_cntHandle((String)map.get("id"));
		return r;
	}
	
	@RequestMapping("/note_list")
	public ModelAndView noteListHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView("temp");
		List list = chatDao.receiveNoteListHandle(id);
		mav.addObject("section", "chat/receiveNoteList");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/sendNoteList")
	public ModelAndView sendNoteListHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView("temp");
		List list = chatDao.sendNoteListHandle(id);
		mav.addObject("section", "chat/sendNoteList");
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/receiveNoteDel")
	public ModelAndView noteDeleteHandle(@RequestParam Map map) throws JsonParseException, JsonMappingException, IOException {
		ModelAndView mav = new ModelAndView("temp");
		Map m = new HashMap();
		List list =  mapper.readValue((String)map.get("arr"), List.class);
		m.put("id", map.get("id"));
		m.put("list", list);
		System.out.println(m.toString());
		int r = chatDao.receiveNoteDelHandle(m);
		List li = chatDao.receiveNoteListHandle((String)map.get("id"));
		mav.addObject("section", "chat/receiveNoteList");
		mav.addObject("list", li);
		mav.addObject("new", "new");
		return mav;
	}
	
}
