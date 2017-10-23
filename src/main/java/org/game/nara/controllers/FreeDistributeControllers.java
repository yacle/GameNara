package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.models.FreeBoard_ReplyDao;
import org.game.nara.models.FreeDistributeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/FreeDistribute")
public class FreeDistributeControllers {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	SimpleDateFormat sdf;

	@Autowired
	FreeDistributeDao FD_Dao;
	
	@RequestMapping("/list")
	public ModelAndView FreeDistributeListHandle() throws SQLException {
		List<Map> li = FD_Dao.listAll();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "FreeDistribute/list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public ModelAndView FreeDistributeAddGetHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","FreeDistribute/add");
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String FreeDistributeAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session, 
		@RequestParam(name = "attach") MultipartFile mpf) throws SQLException, IOException {
		String id = (String)session.getAttribute("auth_id");
		if(mpf.getSize() > 0) {
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/freeD_File");
			System.out.println("pppppath==>"+path);
			String name = id+"_"+fmt;
			
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
	
			File up = new File(application.getRealPath("/freeD_File"), name);
			mpf.transferTo(up);
			param.put("attach", name);
		}
		FD_Dao.addOne(param);
		
		return  "redirect:/FreeDistribute/list";
	}
	
	@RequestMapping(path = "/view/{num}")
	   public ModelAndView FreeDistributeViewHandle(@PathVariable String num) throws SQLException {
	      ModelAndView mav = new ModelAndView("temp");   // 바로 뷰이름지정
	      Map one = FD_Dao.readOne(num);
	      FD_Dao.countOne(num);
	      System.out.println("one="+one.toString());
	      //List<Map> r = FD_Dao.readReply(num);
	      mav.addObject("one", one);
	      mav.addObject("section", "FreeDistribute/view");
	      //mav.addObject("reply", r);
	      return mav;
	   }
	
	@RequestMapping("/end")
	public ModelAndView buyendHandle(@RequestParam Map param) {
		int li = FD_Dao.endSet(param);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "FreeDistribute/view");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
}
