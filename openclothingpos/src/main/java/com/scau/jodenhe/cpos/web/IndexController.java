package com.scau.jodenhe.cpos.web;

import org.springframework.stereotype.Controller;
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
		return "template/index";
	}
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String test() {
		return "template/index.ftl";
	}
	
	/**
	 * 404
	 * 
	 * @return
	 */
	@RequestMapping(value = "/404.htm", method = RequestMethod.GET)
	public String pageNotFound() {
		return "template/404";
	}

	/**
	 * 500
	 * 
	 * @return
	 */
	@RequestMapping(value = "/500.htm", method = RequestMethod.GET)
	public String error() {
		return "template/500";
	}
}
