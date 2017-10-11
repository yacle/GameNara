package org.game.nara.controllers;

import java.util.*;

import org.game.nara.models.AfterDealDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
