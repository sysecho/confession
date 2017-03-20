/** 
 * 这里用一句话描述这个类的作用
 * @author xiaofei.xian 
 * @version V1.0 
*/
package com.confession.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.confession.entity.Confession;
import com.confession.redis.RedisService;

@Controller
@RequestMapping("index")
public class HomeController {

	@Autowired
	private RedisService redis;

	@RequestMapping("home")
	public Object index() {
		ModelAndView model = new ModelAndView();
		List<Object> list = redis.get("confessions");
		Collections.sort(list, new Comparator<Object>() {
			public int compare(Object o1, Object o2) {
				Confession con1 = (Confession) o1;
				Confession con2 = (Confession) o2;
				if (con1.getCreateDate().compareTo(con2.getCreateDate()) > 0) {
					return 1;
				}
				if (con1.getCreateDate().compareTo(con2.getCreateDate()) <= 0) {
					return 0;
				}
				return -1;
			}
		});
		model.addObject("confessions", list);
		model.setViewName("index");
		return model;
	}

	@RequestMapping("submit")
	@ResponseBody
	public Object submit(Confession confession) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		confession.setCreateDate(new Date());
		redis.add("confessions", UUID.randomUUID().toString(), confession);
		reMap.put("success", true);
		return reMap;
	}

	@RequestMapping("confession")
	public Object confessions() {
		return "confession";
	}
}