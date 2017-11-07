package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.AfterVO;
import org.game.nara.models.AfterDealDao;
import org.game.nara.models.ReplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/after")
public class AfterDealController {
@Autowired
AfterDealDao afterDao;
@Autowired
ReplyDao replyDao;
@Autowired
SimpleDateFormat sdf;
@Autowired
ServletContext application;

	@GetMapping("/list")
	public ModelAndView afterDeal_List_Handle() {
		List li = afterDao.listAfter();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "after/after_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	@GetMapping("/add/{parent_no}")
	public ModelAndView afterDeal_add_Handle(@PathVariable String parent_no) {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "after/after_input");
		mav.addObject("no", parent_no);
		return mav;
	}
	@PostMapping("/add")
	public String freeBoardAddPostHandle(AfterVO vo) throws IllegalStateException, IOException{
		System.out.println(vo.toString());
		String id = vo.getWriter();
		MultipartFile pic = vo.getPicdata();
		if(pic.getSize()>0) {
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/afterB_File");
			String name = id+"_"+fmt;
			File dir = new File(path);
				if (!dir.isDirectory()) 
					dir.mkdirs();
			File up = new File(application.getRealPath("/afterB_File"), name);
			pic.transferTo(up);
			vo.setAttach(name);
		}
		int r = afterDao.addAfter(vo);
		if (r!=0) {
			afterDao.addPoint(id);
		}
		return "redirect:/after/list";
	}
	
	@RequestMapping("/view/{no}")
	public ModelAndView freeBoardViewHandle(@PathVariable String no) throws SQLException {
		ModelAndView mav = new ModelAndView("temp");
		AfterVO vo = afterDao.readAfter(no);
		mav.addObject("section", "after/view");
		mav.addObject("vo", vo);
		return mav;
	}
	
	
	@RequestMapping("/modify")
	@ResponseBody
	public int modifyHandle(@RequestParam Map map) {
		int r = afterDao.modifyAfter(map);
		return r;
	}
}
