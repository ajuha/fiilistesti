package com.softala.fiilis.bean;

public interface User {

	public abstract void setId(int id);

	public abstract void setUsername(String username);

	public abstract void setPassword_encrypted(String password_encrypted);

	public abstract void setEnabled(int enabled);

	public abstract void setFirstname(String firstname);

	public abstract void setLastname(String lastname);
	
	
	
	
	public abstract int getId();

	public abstract String getUsername();

	public abstract String getPassword_encrypted();

	public abstract int getEnabled();

	public abstract String getFirstname();

	public abstract String getLastname();
	
	
	

	

}