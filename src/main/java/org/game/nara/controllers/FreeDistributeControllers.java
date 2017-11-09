package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.BuyVO;
import org.game.nara.FreeBoardVO;
import org.game.nara.FreeDistributeVO;
import org.game.nara.models.FreeDistributeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView FreeDistributeListHandle() throws Exception {
		List<FreeDistributeVO> li = FD_Dao.listAll();
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
	public String FreeDistributeAddPostHandle(FreeDistributeVO vo) throws Exception {
		MultipartFile picdata = vo.getPicdata();
		String id = vo.getWriter();
		if(picdata.getSize() > 0) {
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/freeD_File");
			String name = id+"_"+fmt;
			
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
	
			File up = new File(application.getRealPath("/freeD_File"), name);
			picdata.transferTo(up);
			vo.setAttach(name);
		}
		FD_Dao.addOne(vo);
		
		return  "redirect:/FreeDistribute/list";
	}
	
	@RequestMapping(path = "/view/{num}")
	   public ModelAndView FreeDistributeViewHandle(@PathVariable String num) throws Exception {
	      ModelAndView mav = new ModelAndView("temp");   // 바로 뷰이름지정
	      Map one = FD_Dao.readOne(num);
	      mav.addObject("one", one);
	      mav.addObject("section", "FreeDistribute/view");
	      return mav;
	   }
	
	@RequestMapping("/end")
	public ModelAndView buyendHandle(FreeDistributeVO vo) throws Exception {
		int li = FD_Dao.endSet(vo);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "FreeDistribute/view");
		return mav;
	}
	
	@RequestMapping("/modify")
	@ResponseBody
	public int modifyHandle(FreeDistributeVO vo) throws Exception {
		int r = FD_Dao.modifyFreeD(vo);
		return r;
	}
	
	@RequestMapping("/delete")
	public String deleteHandle(FreeDistributeVO vo) throws Exception {
		int ok = FD_Dao.delete(vo);
		return "redirect:/freeBoard/list"; 
	}
	
}
