package com.bookstore.vo;

import java.sql.Date;

public class User {

	private String id;
	private String password;
	private String name;
	private String email;
	private int point;
	private Date regeisteredDate;
	
	public User() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getRegeisteredDate() {
		return regeisteredDate;
	}

	public void setRegeisteredDate(Date regeisteredDate) {
		this.regeisteredDate = regeisteredDate;
	}
}
