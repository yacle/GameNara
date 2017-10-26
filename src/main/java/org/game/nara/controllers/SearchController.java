package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.game.nara.models.SearchDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
@Autowired
SearchDao search;

@RequestMapping("/search")
public ModelAndView freeBoardViewHandle(@RequestParam Map map) throws SQLException {
	ModelAndView mav = new ModelAndView("temp");
	System.out.println(map.toString());
	Map total = search.buysearch((String)map.get("search"));
	mav.addObject("section", "search");
	mav.addObject("total", total);
	return mav;
	}
}
