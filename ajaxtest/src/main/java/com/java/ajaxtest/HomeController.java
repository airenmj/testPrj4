package com.java.ajaxtest;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.ajaxtest.dao.DAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String salary=request.getParameter("salary");
		System.out.println(name);
		System.out.println(age);
		System.out.println(salary);
		DAO dao=new DAO();
		dao.write(name,age,salary);
		
		return "home";
	}
	
	@RequestMapping("/read")
	public String read(HttpServletRequest request, Model model) {
		DAO dao=new DAO();
		String str = dao.read();
		System.out.println(str);
		model.addAttribute("result",str);
		return "read";
	}
}
