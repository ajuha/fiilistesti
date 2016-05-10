package com.softala.fiilis.bean;

public class UserImpl implements User {

	
	private int id;
	private String username;
	private String password_encrypted;
	private int enabled;
	private String firstname;
	private String lastname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword_encrypted() {
		return password_encrypted;
	}
	public void setPassword_encrypted(String password_encrypted) {
		this.password_encrypted = password_encrypted;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	
}
