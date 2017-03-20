package com.confession.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/** 
 * 这里用一句话描述这个类的作用
 * @author xiaofei.xian 
 * @version V1.0 
*/

@Controller
@RequestMapping("confession")
public class ConfessionController {
	
	
	@RequestMapping("home")
	public Object index(){
		ModelAndView model = new ModelAndView();
		return model;
	}
}
