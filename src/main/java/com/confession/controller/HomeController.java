package com.confession.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.confession.redis.RedisService;

@Controller
public class HomeController {

	@Autowired
	private RedisService redis;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public Object home(ModelAndView model) {
		redis.add("date", "1", new Date());
		model.addObject("date", redis.get("date", "1"));
		model.setViewName("index");
		return model;
	}
}