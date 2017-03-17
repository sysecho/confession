package com.confession.redis;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 *  
 * redis
 *
 * @author xiaofei.xian
 * @version V1.0
 */
@Component
public class RedisService {
	
	/**  */
	/*
	 * redis 服务
	 */
	@Autowired
	private RedisTemplate<Serializable, Serializable> redisTemplate;
	
	/**
	 * (缓存中放入对象集合) .
	 *
	 * @author xiaofei.xian
	 * @version V1.0
	 * @param key 
	 * @param map 
	 */
	 public void add(String key,Map<String,Object> map) {  
		 redisTemplate.opsForHash().putAll(key, map);
     } 
	 
 	/**
 	 * (放入一个对象) .
 	 *
 	 * @author xiaofei.xian
 	 * @version V1.0
 	 * @param key 
 	 * @param hashKey 
 	 * @param obj 
 	 */
	 public void add(String key,String hashKey,Object obj){
		 redisTemplate.opsForHash().put(key, hashKey, obj);
	 }
	 
 	/**
 	 * (获取对象集合) .
 	 *
 	 * @author xiaofei.xian
 	 * @version V1.0
 	 * @param key 
 	 * @return 
 	 */
	 public List<Object> get(String key) {
		 return redisTemplate.opsForHash().values(key);
	 }
	 
 	/**
 	 * (获取一个对象) .
 	 *
 	 * @author xiaofei.xian
 	 * @version V1.0
 	 * @param key 
 	 * @param hashKey 
 	 * @return 
 	 */
	 public Object get(String key,String hashKey) {
		 return redisTemplate.opsForHash().get(key, hashKey);
	 }
	 
 	/**
 	 * 	  
 	 * (删除一个对象) .
 	 *
 	 * @author xiaofei.xian
 	 * @version V1.0
 	 * @param key 
 	 * @param hashKey 
 	 */
	 public void del(String key,String hashKey){
		 redisTemplate.opsForHash().delete(key,hashKey);  
	 }
	 
 	/**
 	 * (删除多个对象) .
 	 *
 	 * @author xiaofei.xian
 	 * @version V1.0
 	 * @param key 
 	 */
	 public void del(String key){
		 redisTemplate.delete(key);
	 }
	 
 	/**
 	 * (判断对象否存在) .
 	 *
 	 * @author xiaofei.xian
 	 * @version V1.0
 	 * @param key 
 	 * @param hashKey 
 	 * @return 
 	 */
	 public Boolean hasKey(String key,String hashKey){
		return redisTemplate.opsForHash().hasKey(key, hashKey);
	 }
	 
 	/**
 	 * (租赁清单统计) .
 	 *
 	 * @author xiaofei.xian
 	 * @version V1.0
 	 * @param key 
 	 * @return 
 	 */
	 public Integer count(String key){
		 return redisTemplate.opsForHash().values(key).size();
	 }
}
