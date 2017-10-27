package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","sell/listMap");
		switch(category) {
		
		case 1:
			List ttl = sellDao.sellList();
			int total = ttl.size();
			mav.addObject("list", ttl);
			mav.addObject("title","팝니다");
			mav.addObject("cnt", total);	
			break;
			
		case 2:
			List cons = sellDao.sellConsole();
			int con = cons.size();
			mav.addObject("list", cons);
			mav.addObject("title","콘솔팝니다");
			mav.addObject("cnt", con);	
			break;
		case 3:
			List titl = sellDao.sellTitle();
			int tit = titl.size();
			mav.addObject("list", titl);
			mav.addObject("title","게임타이틀 팝니다");
			mav.addObject("cnt", tit);		
			break;
	
		case 4:
			List acce = sellDao.sellAcce();
			int acc = acce.size();
			mav.addObject("list", acce);
			mav.addObject("title","주변기기 팝니다");
			mav.addObject("cnt", acc);	
			break;
		case 5:
			List othe = sellDao.sellOther();
			int oth = othe.size();
			mav.addObject("list", othe);
			mav.addObject("title","기타팝니다");
			mav.addObject("cnt", oth);			
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
	public String picupdateHandle(@RequestParam Map map, @RequestParam(name = "pic") MultipartFile pic) throws SQLException, IllegalStateException, IOException {
		System.out.println(map.toString());
		if(pic.getSize() > 0) {
			String id = (String)map.get("writer");
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/sellB_File");
			String name = id+"_"+fmt;
			File dir = new File(path);
			if (!dir.isDirectory())
				dir.mkdirs();
			File up = new File(application.getRealPath("/sellB_File"), name);
			pic.transferTo(up);
			map.put("pic", name);
			sellDao.sellUpdate(map);
			System.out.println(map.toString());
		}else {
			sellDao.sellUpdate2(map);
		}
		String url="redirect:/sell/view/"+(String)map.get("no");
		return url;
	}
	
	@RequestMapping("/state")
	@ResponseBody
	public String stateUpdate(@RequestParam Map map) {
		int r = sellDao.stateUpdate(map);
		if(r==1) {
			return "success";
		}else {
			return "fail";
		}
	}
}
