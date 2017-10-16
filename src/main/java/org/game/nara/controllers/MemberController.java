package org.game.nara.controllers;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.game.nara.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDao mDao;
	@Autowired
	ServletContext application;
	@Autowired
	SimpleDateFormat sdf;
	@Autowired
	JavaMailSender sender;
	
	@RequestMapping("/join")
	public ModelAndView joinHandle() {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "member/join");
		return mav;
	}
	
	@PostMapping("/join")
	public ModelAndView joinPostHandle(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView("temp");
		int r = mDao.addMember(map);
		if(r!=0) {
			mav.addObject("section", "log/login");
		}else {
			mav.addObject("section", "member/join");
			mav.addObject("result", "fail");
		}
		return mav;
	}
	
	@RequestMapping("/idcheck")
	@ResponseBody
	public int idcheckHandle(@RequestParam Map map) {
		int r = mDao.idcheck((String)map.get("id"));
		return r;
	}
	
	@RequestMapping("/nickcheck")
	@ResponseBody
	public int nickcheckHandle(@RequestParam Map map) {
		int r = mDao.nickcheck((String)map.get("nick"));
		return r;
	}
	
	@GetMapping("/info")
	public ModelAndView profileGetHandle(HttpSession session) {
		ModelAndView mav = new ModelAndView("temp");
		String id = (String)session.getAttribute("auth_id");
		Map map = mDao.readInfo(id);
		mav.addObject("section", "member/info");
		mav.addObject("map", map);
		return mav;
	}
	
	@PostMapping("/info")
	public ModelAndView infoPostHandle(@RequestParam Map map, HttpSession session) {
		ModelAndView mav = new ModelAndView("temp");
		String id = (String) session.getAttribute("auth_id");
		map.put("id", id);
		int r = mDao.addInfo(map);
		Map m = mDao.readInfo(id);
		mav.addObject("section", "member/info");
		mav.addObject("data", r);
		mav.addObject("map", m);
		return mav;
	}
	
	
	@PostMapping("/profile")
	public ModelAndView profilePostHandle(Map map, @RequestParam(name="profile") MultipartFile f, HttpSession session) throws IllegalStateException, IOException {
		if(f.getSize()>0) {
		String fmt = sdf.format(System.currentTimeMillis());
		String id = (String)session.getAttribute("auth_id");
		System.out.println("id="+id);
		String type = f.getContentType();
		String[] fileType = type.split("/");
		String name = id+"_"+fmt+"."+fileType[1];
		File up = new File(application.getRealPath("/profiles"), name);
		f.transferTo(up);
		map.put("id", id);
		map.put("profile",name);
		int r = mDao.addProfile(map);
		}
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "member/info");
		return mav;
	}
	
	@RequestMapping("/emailReg")
	@ResponseBody
	public void emailRegSend(@RequestParam Map map, HttpSession session) throws AddressException, MessagingException{
		String email = (String) map.get("email");
		MimeMessage msg = sender.createMimeMessage();
		msg.setRecipient(RecipientType.TO, new InternetAddress(email));
		msg.setSubject("Email 인증코드 ");
		UUID u = UUID.randomUUID();	
		String code = u.toString().substring(0, 6);
		String text = "가입 인증번호 :"+code;
		msg.setText(text, "UTF-8", "html");
		sender.send(msg);
		session.setAttribute("uuid", code);
		
	}
	
	@RequestMapping("/regCode")
	@ResponseBody
	public String regCodeHandle(@RequestParam Map map, HttpSession session) {
		String regCode = (String)map.get("regCode");
		String uuid = (String)session.getAttribute("uuid");
		if(regCode.equals(uuid)) {
			String id = (String)session.getAttribute("auth_id");
			map.put("id", id);
			mDao.emailReg(map);
			return "true";
		}else {
			return "false";
		}
	}

}
