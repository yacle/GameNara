package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.game.nara.models.SellDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sell")
public class SellController {
@Autowired
SellDao sellDao;

	@RequestMapping("/sellForm")
	public ModelAndView sellformHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "sell/sell_form");
		return mav;
	}
/*	
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
*/
}
