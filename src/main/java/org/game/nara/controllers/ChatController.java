package org.game.nara.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@RequestMapping("/note")
	public ModelAndView noteSendHandle(@RequestParam String id) {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "chat/note");
		mav.addObject("id", id);
		return mav;
	}
}
