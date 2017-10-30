package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
AfterDealDao adDao;
@Autowired
ReplyDao replyDao;
@Autowired
SimpleDateFormat sdf;
@Autowired
ServletContext application;

	@GetMapping("/list")
	public ModelAndView afterDeal_List_Handle() {
		List li = adDao.listAfter();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "after/after_list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	@GetMapping("/add")
	public ModelAndView afterDeal_add_Handle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "after/after_input");
		return mav;
	}
	@PostMapping("/add")
	public String freeBoardAddPostHandle(@RequestParam Map map, HttpSession session, @RequestParam(name="pic") MultipartFile pic) 
			throws IllegalStateException, IOException{
		String id = (String)session.getAttribute("auth_id");
		if(pic.getSize()>0) {
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/afterB_File");
			String name = id+"_"+fmt;
			File dir = new File(path);
				if (!dir.isDirectory()) 
					dir.mkdirs();
			File up = new File(application.getRealPath("/afterB_File"), name);
			pic.transferTo(up);
			map.put("attach", name);
		}
		System.out.println(map.toString());
		map.put("writer", id);
		int r = adDao.addAfter(map);
	//	if (r!=0) {
	//		adDao.addPoint(id);
	//	}
		return "redirect:/after/list";
	}
	
	@RequestMapping("/view/{num}")
	public ModelAndView freeBoardViewHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp");
		Map map = adDao.readAfter(num);
		List list = adDao.readReply(num);
		mav.addObject("section", "after/view");
		mav.addObject("one", map);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/reply_save")
	@ResponseBody
	public String replySaveHandle(@RequestParam Map map) {
		int r = adDao.addReply(map);
		return "r";
	}
	
	@RequestMapping("/reply_delete")
	@ResponseBody
	public String replyDeleteHandle(@RequestParam Map map) {
		int r = adDao.deleteReply((String)map.get("num"));
		return "r";
	}
	
	@RequestMapping("/modify")
	@ResponseBody
	public int modifyHandle(@RequestParam Map map) {
		int r = adDao.modifyAfter(map);
		return r;
	}
}
