package com.confession.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.confession.entity.Confession;
import com.confession.redis.RedisService;
import com.confession.utils.PageUtiles;

/**
 * 这里用一句话描述这个类的作用
 * @author xiaofei.xian
 * @version V1.0
*/

@Controller
@RequestMapping("index")
public class ConfessionController {

	private static String CONFESSIONS_KEY = "confessions";
	@Autowired
	private RedisService redis;

	@RequestMapping("list")
	public Object index(@RequestParam(value="phone",required=false)String phone) {
		if("17603036433".equals(phone) || "17603036477".equals(phone)){
			ModelAndView model = new ModelAndView();
			model.setViewName("index");
			return model;
		}else{
			return "confession";
		}
	}

	@RequestMapping(value="listConfessions",method=RequestMethod.GET)
	@ResponseBody
	public Object listConfessions(@RequestParam(value="page",required=false)Integer page,@RequestParam(value="size",required=false) Integer size) {
		Map<String,Object> reMap = new HashMap<String,Object>();
		List<Object> list = redis.get(CONFESSIONS_KEY);
		reMap.put("total", list.size());
		reMap.put("success", true);
		reMap.put("rows", PageUtiles.page(list, page, size));
		return reMap;
	}

	@RequestMapping("submit")
	@ResponseBody
	public Object submit(Confession confession) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		confession.setCreateDate(new Date());
		confession.setId(UUID.randomUUID().toString().toUpperCase().replace("-", ""));
		redis.add(CONFESSIONS_KEY, confession.getId(), confession);
		reMap.put("success", true);
		return reMap;
	}
	
	@RequestMapping("del")
	@ResponseBody
	public Object del(@RequestParam(value="id",required=true)String id) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		redis.del(CONFESSIONS_KEY, id);
		reMap.put("success", true);
		return reMap;
	}

	@RequestMapping("confession")
	public Object confessions() {
		return "confession";
	}
	
	@RequestMapping("manager")
	public Object manager() {
		return "manager";
	}

	@RequestMapping("success")
	public Object success(ModelAndView model) {
		return "success";
	}

}
