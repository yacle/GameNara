
package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.models.FreeBoardDao;
import org.game.nara.models.FreeBoard_ReplyDao;
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
@RequestMapping("/freeBoard")
public class FreeBoardControllers {

	@Autowired
	FreeBoardDao boardDao;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	SimpleDateFormat sdf;
	
	@Autowired
	FreeBoard_ReplyDao replyDao;
	
	@RequestMapping("/list")
	public ModelAndView freeBoardListHandle() throws SQLException {
		List<Map> li = boardDao.listAll();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "freeBoard/list");
		mav.addObject("list", li);
		mav.addObject("cnt", li.size());
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public ModelAndView freeBoardAddGetHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section","freeBoard/add");
		return mav;
	}
	
	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String freeBoardAddPostHandle(@RequestParam Map param, ModelMap map, HttpSession session, 
		@RequestParam(name = "attach") MultipartFile mpf) throws SQLException, IOException {
		String id = (String)session.getAttribute("auth_id");
		if(mpf.getSize() > 0) {
			String fmt = sdf.format(System.currentTimeMillis());
			String path = application.getRealPath("/freeB_File");
			String name = id+"_"+fmt;
			
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
	
			File up = new File(application.getRealPath("/freeB_File"), name);
			mpf.transferTo(up);
			param.put("attach", name);
		}
		boolean b = boardDao.addOne(param);
		if (b) {
			boardDao.addPoint(id);
		}
		return  "redirect:/freeBoard/list";
	}
	
	@RequestMapping(path = "/view/{num}")
	   public ModelAndView freeBoardViewHandle(@PathVariable String num) throws SQLException {
	      ModelAndView mav = new ModelAndView("temp");   // 바로 뷰이름지정
	      Map one = boardDao.readOne(num);
	      List<Map> r = replyDao.readReply(num);
	      mav.addObject("one", one);
	      mav.addObject("section", "freeBoard/view");
	      mav.addObject("reply", r);
	      return mav;
	   }
		
	
}

