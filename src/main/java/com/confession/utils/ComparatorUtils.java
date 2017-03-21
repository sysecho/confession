package com.confession.utils;

import java.util.Comparator;

import com.confession.entity.Confession;

public class ComparatorUtils implements Comparator<Object>{
	
	@Override
	public int compare(Object o1, Object o2) {
		Confession con1 = (Confession) o1;
		Confession con2 = (Confession) o2;
		if (con1.getCreateDate().compareTo(con2.getCreateDate()) > 0) {
			return -1;
		}
		if (con1.getCreateDate().compareTo(con2.getCreateDate()) < 0) {
			return 1;
		}
		return 0;
	}
}
