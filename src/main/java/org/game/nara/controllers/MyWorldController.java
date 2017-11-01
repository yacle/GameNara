package org.game.nara.controllers;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.game.nara.SellVO;
import org.game.nara.models.MyWorldDao;
import org.game.nara.models.SellDao;
import org.game.nara.models.buyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/MyWorld")
public class MyWorldController {
@Autowired
MyWorldDao mydao;


@RequestMapping("/myworld")
public ModelAndView myworldViewHandle(HttpSession session) throws Exception {
	String id = (String) session.getAttribute("auth_id");
	ModelAndView mav = new ModelAndView();
	Map total = mydao.mysearch(id);
	mav.addObject("section", "MyWorld/myworld");
	mav.addObject("total", total);
	return mav;
	}

@RequestMapping(path = "/buy/{num}")
public String buyViewHandle(@PathVariable String num, Model model) throws SQLException {
	Map one = mydao.buyread(num);
	model.addAttribute("one",one);
	return "MyWorld/view";
}

@RequestMapping("/sell/{num}")
public String sellViewHandle(@PathVariable String num, Model model) throws SQLException {
	SellVO one = mydao.sellread(num);
	model.addAttribute("one", one);
	return "MyWorld/view";
}

@RequestMapping("/after/{num}")
public String afterViewHandle(@PathVariable String num, Model model) throws SQLException {
	Map one = mydao.afterread(num);
	model.addAttribute("one", one);
	return "MyWorld/view";
}

@RequestMapping("/free/{num}")
public String freeViewHandle(@PathVariable String num, Model model) throws SQLException {
	Map one = mydao.freeread(num);
	model.addAttribute("one", one);
	return "MyWorld/view";
}
@RequestMapping("/freedis/{num}")
public String freedisViewHandle(@PathVariable String num, Model model) throws SQLException {
	Map one = mydao.freedisread(num);
	model.addAttribute("one", one);
	return "MyWorld/view";
}


}

