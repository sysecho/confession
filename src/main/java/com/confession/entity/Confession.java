package com.confession.entity;

import java.io.Serializable;
import java.util.Date;

public class Confession implements Serializable{

	private static final long serialVersionUID = 1L;

	private String name;

	private String content;

	private String fromeUser;

	private Date createDate;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getFromeUser() {
		return fromeUser;
	}

	public void setFromeUser(String fromeUser) {
		this.fromeUser = fromeUser;
	}

}
