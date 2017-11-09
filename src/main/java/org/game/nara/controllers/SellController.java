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

import org.game.nara.MemberVO;
import org.game.nara.SellVO;
import org.game.nara.models.SellDao;
import org.game.nara.models.buyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
@Autowired
buyDao buydao;


	@RequestMapping("/sellForm")
	public ModelAndView sellformHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "sell/sell_form");
		return mav;

	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String fsellBoardAddPostHandle(SellVO vo)throws Exception {
		MultipartFile picdata = vo.getPicdata();
		String id = vo.getWriter();
		if(picdata.getSize() > 0) {
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/sellB_File");
			String name = id+"_"+fmt;
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
	
			File up = new File(application.getRealPath("/sellB_File"), name);
			picdata.transferTo(up);
			vo.setPic(name);
		}
		int r = sellDao.sellAdd(vo);
		if (r!=0) {
			sellDao.subtractPoint(id);
		}
		return  "redirect:/sell/list?category=0&&type=map";
	}
	

	@RequestMapping(value="/list")
	public ModelAndView buyListHandle(@RequestParam Map map) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		String type=(String)map.get("type");
		String category = (String)map.get("category");
		if(type.equals("map")) {
			mav.addObject("section","sell/listMap");
		}else {
			mav.addObject("section","sell/sellList");
		}
		switch(category) {
		case "0":
			List ttl = sellDao.sellList();
			int total = ttl.size();
			mav.addObject("list", ttl);
			mav.addObject("title","팝니다");
			mav.addObject("cnt", total);	
			break;
			
		case "1":
			List cons = sellDao.sellConsole();
			int con = cons.size();
			mav.addObject("list", cons);
			mav.addObject("title","콘솔팝니다");
			mav.addObject("cnt", con);	
			break;
		case "2":
			List titl = sellDao.sellTitle();
			int tit = titl.size();
			mav.addObject("list", titl);
			mav.addObject("title","게임타이틀 팝니다");
			mav.addObject("cnt", tit);		
			break;
	
		case "3":
			List acce = sellDao.sellAcce();
			int acc = acce.size();
			mav.addObject("list", acce);
			mav.addObject("title","주변기기 팝니다");
			mav.addObject("cnt", acc);	
			break;
		case "4":
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
	public ModelAndView buyViewHandle(@PathVariable String num) throws Exception {
		ModelAndView mav = new ModelAndView("temp"); // 바로 뷰이름지정
		SellVO vo = sellDao.sellOne(num);
		mav.addObject("section", "sell/sellView");
		mav.addObject("map", vo);
		return mav;
	}
	
	@RequestMapping("/update")
	public String picupdateHandle(SellVO vo) throws Exception {
		MultipartFile picdata = vo.getPicdata();
		if(picdata.getSize() > 0) {
			String id = vo.getWriter();
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/sellB_File");
			String name = id+"_"+fmt;
			File dir = new File(path);
			if (!dir.isDirectory())
				dir.mkdirs();
			File up = new File(application.getRealPath("/sellB_File"), name);
			picdata.transferTo(up);
			vo.setPic(name);
			sellDao.sellUpdate(vo);
		}else {
			sellDao.sellUpdate2(vo);
		}
		String url="redirect:/sell/view/"+vo.getNo();
		return url;
	}
	
	@RequestMapping("/state")
	@ResponseBody
	public String stateUpdate(@RequestParam Map map) throws Exception {
		int r = sellDao.stateUpdate(map);
		if(r==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean deleteHandle(@RequestParam Map map) throws Exception {
		int r = sellDao.deleteOne((String)map.get("no"));
		String path = application.getRealPath("/sellB_File");
		File picdata = new File(path, (String)map.get("pic"));
		boolean check = false; 
		if(picdata.exists() == true) {
			picdata.delete();
			check = true;
		}
		return check;
	}
	
	@RequestMapping("/checkpoint")
	@ResponseBody
	public String buycheckpoint(MemberVO vo) throws Exception {
		MemberVO point=buydao.checkpoint(vo);
		if(point.getPoint()<500 || point.getLev()<=2) {
			return "ok";
		}else {
			return "no";
		}
	}
	
}
