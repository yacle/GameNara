package org.game.nara.controllers;

import java.util.*;

import org.game.nara.ReplyVO;
import org.game.nara.models.ReplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/replies")
public class ReplyController {
@Autowired
ReplyDao replyDao;	

	@RequestMapping("/add")
	@ResponseBody
	public int register(@RequestBody ReplyVO vo) {
		return replyDao.create(vo);
	}
	
	@RequestMapping("/list/{bno}")
	@ResponseBody
	public List<ReplyVO> replyList(@PathVariable Integer bno) {
		return replyDao.list(bno);
	}
	
}
