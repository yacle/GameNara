package org.game.nara.controllers;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.game.nara.models.ChatDao;
import org.game.nara.models.MemberDao;
import org.game.nara.models.SellDao;
import org.game.nara.wsControllers.NoteWSHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
MemberDao mDao;
@Autowired
NoteWSHandler nws;
@Autowired
ObjectMapper mapper;
@Autowired
SellDao sellDao;


	@RequestMapping("/QnA")
	public ModelAndView QnAHandle() {
	ModelAndView mav = new ModelAndView("temp");
	mav.addObject("section", "chat/QnA");
	return mav;
}

	@RequestMapping("/noteSend")
	public ModelAndView noteSendHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView();
			mav.addObject("section", "chat/noteSend");
			mav.addObject("id", id);
		return mav;
	}
	
	@RequestMapping("/noteSend2")
	public ModelAndView noteSendHandle() {
		ModelAndView mav = new ModelAndView();
			mav.addObject("section", "chat/noteSend2");
		return mav;
	}

	@PostMapping("/note_send")
	@ResponseBody
	public String noteSendHandle(@RequestParam Map map) throws Exception {
		System.out.println(map.toString());
		int r = chatDao.noteAddHandle(map);
		nws.sendMessageToUser((String)map.get("receiver"), (String)map.get("content"));
		if(r!=0) {
			return "send complate";
		}else {
			return "send fail";
		}
	}
	
	@PostMapping("/deal")
	@ResponseBody
	public String dealSendHandle(@RequestParam Map map) throws Exception {
		int r = chatDao.noteAddHandle(map);
		nws.sendMessageToUser((String)map.get("receiver"), (String)map.get("content"));
		sellDao.stateUpdate(map);
		if(r!=0) {
			return "send complate";
		}else {
			return "send fail";
		}
	}
	
	@PostMapping("/note_cnt")
	@ResponseBody
	public String note_cntHandle(@RequestParam Map map) throws Exception {
		int r = chatDao.receiv_cntHandle((String)map.get("id"));
		int p = chatDao.readPoint((String)map.get("id"));
		int l = mDao.levelcheck((String)map.get("id"));
		String json = String.format("{\"point\":%d,\"cnt\":%d,\"level\":%d}", p, r, l);
		return json;
	}
	
	@RequestMapping("/note_list")
	public ModelAndView noteListHandle(@RequestParam String id) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		List list = chatDao.receiveNoteListHandle(id);
		mav.addObject("section", "chat/receiveNoteList");
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		return mav;
	}
	
	@RequestMapping("/sendNoteList")
	public ModelAndView sendNoteListHandle(@RequestParam String id) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		List list = chatDao.sendNoteListHandle(id);
		mav.addObject("section", "chat/sendNoteList");
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		return mav;
	}
	
	@PostMapping("/receiveNoteDel")
	@ResponseBody
	public int noteDeleteHandle(@RequestParam Map map) throws Exception {
		Map m = new HashMap();
		String id = (String)map.get("id");
		List list =  mapper.readValue((String)map.get("arr"), List.class);
		m.put("id",id);
		m.put("list", list);
		int r = chatDao.receiveNoteDelHandle(m);
		return  r;
	}
	
	@PostMapping("/sendNoteDel")
	@ResponseBody
	public int sendNoteDeleteHandle(@RequestParam Map map) throws Exception {
		Map m = new HashMap();
		String id = (String)map.get("id");
		List list =  mapper.readValue((String)map.get("arr"), List.class);
		m.put("id",id);
		m.put("list", list);
		int r = chatDao.sendNoteDelHandle(m);
		return  r;
	}
	
	@RequestMapping("/note_sendAll")
	public ModelAndView AllSendHandle() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("section", "chat/note_sendAll");
		return mav;
	}
	
	@PostMapping("/note_sendAll")
	@ResponseBody
	public int postAllSend(@RequestParam Map map) throws Exception {
		List<Map> list =  chatDao.memberAll();
		String content = (String)map.get("content");
		int r=0;
		for(Map ss : list) {
			map.put("receiver", (String)ss.get("ID"));
			r += chatDao.noteAddHandle(map);
			nws.sendMessageToUser((String)ss.get("ID"), content);
		}
		return r;
	}
}
