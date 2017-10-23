package org.game.nara.controllers;

import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@RequestMapping("/afterReply")
	@ResponseBody
	public Map replyHandle(Map map) {
		
		return map;
	}
}
