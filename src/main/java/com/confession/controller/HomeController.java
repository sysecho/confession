/** 
 * 这里用一句话描述这个类的作用
 * @author xiaofei.xian 
 * @version V1.0 
*/
package com.confession.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.confession.redis.RedisService;

@Controller
@RequestMapping("index")
public class HomeController{
	
	@Autowired
	private RedisService redis;
	
	@RequestMapping("home")
	public String index(){
		System.out.println(redis.count("1"));
		System.out.println("index");
		return "index";
	}
}