package org.game.nara.controllers;

import java.util.*;

import org.apache.commons.lang.StringUtils;
import org.game.nara.PageDTO;
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
	public int register(@RequestBody ReplyVO vo) {
		return replyDao.create(vo);
	}
	
	@RequestMapping("/list/{bno}")
	@ResponseBody
	public List<ReplyVO> replyList(@PathVariable Integer bno) {
		return replyDao.list(bno);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int replyUpdate(@RequestBody ReplyVO vo) {
		return replyDao.update(vo);
	}
	
	@RequestMapping("/delete/{rno}")
	@ResponseBody
	public int replyDelte(@PathVariable Integer rno) {
		return replyDao.delete(rno);
	}
	
	@GetMapping("/replytest")
	public ModelAndView replytest() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "replytest");
		return mav;
	}
	
	@RequestMapping("/paging")
	@ResponseBody
	public ModelAndView getReplyList(PageDTO dto, @RequestParam(value="pageNo", required=false) String pageNo) {
		dto.setPageSize(10);
		dto.setPageNo(1);
		if(StringUtils.isNotEmpty(pageNo)) {
			dto.setPageNo(Integer.parseInt(pageNo));
		}
		dto.setBlockSize(10);
		dto.setTotalCount(replyDao.totalcnt(dto.getBno()));
		List<ReplyVO> replyList = replyDao.getReplyList(dto);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("replyList", replyList);
		mav.addObject("param", dto);
		return mav;
	}
	
}
