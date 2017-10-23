package org.game.nara.controllers;

import java.util.*;

import org.game.nara.ReplyVO;
import org.game.nara.models.ReplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply")
public class ReplyController {
@Autowired
ReplyDao replyDao;	

	@RequestMapping("/")
	@ResponseBody
	public int register(@RequestBody ReplyVO vo) {
		return replyDao.create(vo);
	}
}
