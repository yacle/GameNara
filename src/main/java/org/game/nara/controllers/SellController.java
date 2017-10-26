package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.models.SellDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sell")
public class SellController {
@Autowired
SellDao sellDao;
@Autowired
ServletContext application;
@Autowired
SimpleDateFormat sdf;

	@RequestMapping("/sellForm")
	public ModelAndView sellformHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "sell/sell_form");
		return mav;
	}
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String freeBoardAddPostHandle(@RequestParam Map map, @RequestParam(name = "pic") MultipartFile pic) throws SQLException, IOException {
		String id = (String)map.get("writer");
		if(pic.getSize() > 0) {
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/sellB_File");
			String name = id+"_"+fmt;
			
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
	
			File up = new File(application.getRealPath("/sellB_File"), name);
			pic.transferTo(up);
			map.put("pic", name);
		}
		int r = sellDao.sellAdd(map);
		if (r!=0) {
			sellDao.subtractPoint(id);
		}
		return  "redirect:/sell/list/1";
	}
	
	@RequestMapping(value="/list/{category}")
	public ModelAndView buyListHandle(@PathVariable(value="category")int category) throws SQLException {
		List<Map> li = sellDao.sellList();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","sell/sellList");
		switch(category) {
		
		case 1:
			mav.addObject("list", li);
			mav.addObject("title","팝니다 전체 ");
			mav.addObject("cnt", li.size());	
			break;
			
		case 2:
			li = sellDao.sellConsole();
			mav.addObject("list", li);
			mav.addObject("title","콘솔팝니다");
			mav.addObject("cnt", li.size());			
			break;
		case 3:
			li = sellDao.sellTitle();
			mav.addObject("list", li);
			mav.addObject("title","게임타이틀 팝니다");
			mav.addObject("cnt", li.size());			
			break;
	
		case 4:
			li = sellDao.sellAcce();
			mav.addObject("list", li);
			mav.addObject("title","주변기기 팝니다");
			mav.addObject("cnt", li.size());			
			break;
		case 0:
			li = sellDao.sellOther();
			mav.addObject("list", li);
			mav.addObject("title","기타팝니다");
			mav.addObject("cnt", li.size());			
			break;
		}
		return mav;
	}	
	
	@RequestMapping("/view/{num}")
	public ModelAndView buyViewHandle(@PathVariable String num) throws SQLException {
		ModelAndView mav = new ModelAndView("temp"); // 바로 뷰이름지정
		Map map = sellDao.sellOne(num);
		mav.addObject("section", "sell/sellView");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int sellupdateHandle(@RequestParam Map map, @RequestParam(name = "pic") MultipartFile pic) throws SQLException, IllegalStateException, IOException {
		System.out.println(map.toString());
		if(pic.getSize() > 0) {
			String id = (String)map.get("id");
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/sellB_File");
			String name = id+"_"+fmt;
			File dir = new File(path);
			if (!dir.isDirectory())
				dir.mkdirs();
			File up = new File(application.getRealPath("/sellB_File"), name);
			pic.transferTo(up);
			map.put("pic", name);
		}
		return  sellDao.sellUpdate(map);
	}
	
	@RequestMapping("/state/{state}")
	@ResponseBody
	public String stateUpdate(@RequestParam Map map, @PathVariable String state) {
		if(state.equals("state0")) {
			sellDao.stateUpdate(map);
		}else {
			
		}
		
		return "success";
	}
}
