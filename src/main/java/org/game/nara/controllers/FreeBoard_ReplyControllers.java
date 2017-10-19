package org.game.nara.controllers;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.game.nara.models.FreeBoardDao;
import org.game.nara.models.FreeBoard_ReplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/reply")
public class FreeBoard_ReplyControllers {
	@Autowired
	ObjectMapper mapper;

	@Autowired
	FreeBoardDao boardDao;
	
	@Autowired
	FreeBoard_ReplyDao replyDao;

	@RequestMapping("/add")
	@ResponseBody
	public int replyAddHandle(@RequestParam Map body, HttpServletResponse resp,
			@CookieValue(name = "limit", required = false) String val) throws Exception {
		
		
		System.out.println(body.toString());
		int code = 0;
		if (val != null) { // 쿠키가 있다는 상황
			code = -1;
		} else {
			int r = replyDao.addReply(body);
			if (r == 1) {
				code = 1;
				Cookie c = new Cookie("limit", "on");
				c.setPath("/");
				c.setMaxAge(5);
				resp.addCookie(c);
			}
		}
		return code;
	}

	@RequestMapping(path = "/list/{parent}")
	public ModelAndView replyListHandle(@PathVariable String parent) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		List<Map> r = replyDao.readReply(parent);
		mav.addObject("section","reply/list/"+parent);
		System.out.println("rrrr"+r);
		return mav;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public int deleteReplyHandle(@RequestParam String num) {
		int rst = 0;
		int ok = replyDao.deleteReply(num);
		if(ok==1) {
			rst =1;
		}
		System.out.println("ok-?"+ok+" / "+rst);
		return rst; 
	}
	
	@RequestMapping(path = "/update")
	   public ModelAndView replyListHandle(@RequestParam Map map) throws Exception {
	      ModelAndView mav = new ModelAndView("temp");
	      String parent = (String)map.get("parent");
	      String no = (String)map.get("no");
	      List<Map> r = replyDao.readReply(parent);
	      List al = new ArrayList<>();
	      for(Map m : r) {
	    	 int s =((BigDecimal)m.get("NO")).intValue();
	         if(Integer.parseInt(no)==s) {
	        	 System.out.println(Integer.parseInt(no)+"//"+s);
	            m.put("RE", "y");
	            al.add(m);
	         }
	      }
	      Map one = boardDao.readOne(parent);
	      mav.addObject("section","freeBoard/view");
	      mav.addObject("reply", al);
	      System.out.println("alll=>"+al.toString());
	      mav.addObject("one", one);
	      return mav;
	   }
}

