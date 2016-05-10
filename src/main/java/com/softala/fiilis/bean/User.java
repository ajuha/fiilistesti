package com.softala.fiilis.bean;

public interface User {

	public abstract int getId();

	public abstract String getUsername();

	public abstract String getPassword_encrypted();

	public abstract int getenabled();

	public abstract String getFirstname();

	public abstract String getLastname();
	

}