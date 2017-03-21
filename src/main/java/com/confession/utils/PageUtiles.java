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
	public static List<Object> page(List<Object> list, int page, int size){
		Collections.sort(list, new ComparatorUtils());
		System.out.println("第"+page+"页，每页"+size+"条数据。");
		int len = page+size>list.size()?list.size():page+size;
        List<Object> reList = new ArrayList<Object>();
        for (; page < len; page++) {
        	reList.add(list.get(page));
        }
        return reList;
	}
	
}
