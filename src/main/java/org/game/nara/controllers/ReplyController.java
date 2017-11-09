package org.game.nara.controllers;

import java.util.*;

import org.apache.commons.lang.StringUtils;
import org.game.nara.ReplyVO;
import org.game.nara.models.ReplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/replies")
public class ReplyController {
@Autowired
ReplyDao replyDao;	

	@RequestMapping("/add")
	@ResponseBody
	public int register(@RequestBody ReplyVO vo) throws Exception {
		return replyDao.create(vo);
	}
	
	@RequestMapping("/list/{bno}")
	@ResponseBody
	public List<ReplyVO> replyList(@PathVariable Integer bno) throws Exception {
		return replyDao.list(bno);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int replyUpdate(@RequestBody ReplyVO vo) throws Exception {
		return replyDao.update(vo);
	}
	
	@RequestMapping("/delete/{rno}")
	@ResponseBody
	public int replyDelte(@PathVariable Integer rno) throws Exception {
		return replyDao.delete(rno);
	}	
}
