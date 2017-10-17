package org.game.nara.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

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
	FreeBoard_ReplyDao replyDao;

	@RequestMapping("/add")
	@ResponseBody
	public int replyAddHandle(@RequestParam Map body, HttpServletResponse resp,
			@CookieValue(name = "limit", required = false) String val) throws Exception {
		System.out.println(body.toString());
		int code = 0;
		if (val != null) { // ��Ű�� �ִٴ� ��Ȳ
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
}
