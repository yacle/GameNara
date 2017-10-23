package org.game.nara.controllers;

import org.game.nara.wsControllers.NoteWSHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chatting")
public class ChattingControllers {
	
	@Autowired
	NoteWSHandler nws;
	
	@Autowired
	ObjectMapper mapper;

}
