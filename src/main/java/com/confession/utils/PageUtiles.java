package com.confession.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 分页控制
 * @author xiaofei.xian
 * @version V1.0
*/
public class PageUtiles {

	/*
     * 分页控制
     */
	public static List<Object> page(List<Object> list, Integer page, Integer size){
		Collections.sort(list, new ComparatorUtils());
		if(null == page || null == size){
			return list;
		}
		int len = (page + 1) * size > list.size() ? list.size() : (page + 1) * size;
		page = page * 5;
        List<Object> reList = new ArrayList<Object>();
		for (; page < len; page++) {
        	reList.add(list.get(page));
        }
        return reList;
	}

}
