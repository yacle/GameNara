package org.game.nara.controllers;

import java.util.*;

import org.game.nara.models.AfterDealDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/after")
public class AfterDealController {
@Autowired
AfterDealDao adDao;

	@GetMapping("/list")
	public ModelAndView afterDeal_List_Handle() {
		List list = adDao.listAfter();
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "after/after_list");
		mav.addObject("list", list );
		return mav;
	}
	
	@GetMapping("/add")
	public ModelAndView afterDeal_add_Handle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "after/after_input");
		return mav;
	}
	@PostMapping("/add")
	public ModelAndView afterDeal_add_Handle(@RequestParam Map map) {
		int r = adDao.addAfter(map);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "after/after_list");
		mav.addObject("result", r);
		return mav;
	}
}
