/** 
 * 这里用一句话描述这个类的作用
 * @author xiaofei.xian 
 * @version V1.0 
*/
package com.confession.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.confession.redis.RedisService;

@Controller
@RequestMapping("index")
public class HomeController{
	
	@Autowired
	private RedisService redis;
	
	@RequestMapping("home")
	public Object index(){
		ModelAndView model = new ModelAndView();
		redis.add("date", "1", new Date());
		model.addObject("date", redis.get("date", "1"));
		model.setViewName("index");
		return model;
	}
}