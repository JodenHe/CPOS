package com.scau.jodenhe.cpos.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index() {
		return home();
	}
	
	@RequestMapping(value="/index.htm",method=RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginGet() {
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginPost(Model model) {
		//TODO 待接入shiro
		model.addAttribute("errorInfo", "帐号密码错误！");
		return "login";
	}
	
	/**
	 * 404
	 * 
	 * @return
	 */
	@RequestMapping(value = "/404.htm", method = RequestMethod.GET)
	public String pageNotFound() {
		return "404";
	}

	/**
	 * 500
	 * 
	 * @return
	 */
	@RequestMapping(value = "/500.htm", method = RequestMethod.GET)
	public String error() {
		return "500";
	}
}
