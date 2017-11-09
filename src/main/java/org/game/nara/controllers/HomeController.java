package org.game.nara.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.game.nara.models.IndexDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	IndexDao indexDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/index/{notice}")
	public ModelAndView indexHandle(@PathVariable String notice) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		Map data = indexDao.indexHandel();
		mav.addObject("section", "index");
		mav.addObject("data", data);
		if(notice.equals("2")) {
			mav.addObject("notice", "접근이 금지된 경로입니다.");
		}
		return mav;
	}
	
	@RequestMapping("/notice")
	public ModelAndView noticeHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "notice");
		return mav;
	}
	
	@RequestMapping("/notice_info")
	public ModelAndView notice_infoHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "notice_info");
		return mav;
	}
	
}
