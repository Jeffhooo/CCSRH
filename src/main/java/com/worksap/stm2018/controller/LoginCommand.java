package com.worksap.stm2018.controller;

public class LoginCommand {
	private String userName;

	private String password;

	String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
