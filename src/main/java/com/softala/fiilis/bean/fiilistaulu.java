package com.softala.fiilis.bean;

public interface fiilistaulu {

	public abstract int getId();

	public abstract void setId(int id);

	public abstract void setFiilis1(int int1);

	public abstract void setFiilis2(int int1);

	public abstract void setFiilis3(int int1);

	public abstract void setFiilis4(int int1);

	public abstract void setFiilis5(int int1);

	public abstract void setAanet(int int1);

	public abstract void setAlkuloppu(String string);

	public abstract void setPvm(String string);

	public abstract void setKeskiarvo(double double1);

	public abstract int getFiilis1();

	public abstract int getFiilis2();

	public abstract int getFiilis3();

	public abstract int getFiilis4();

	public abstract int getFiilis5();
	
	public abstract double getKeskiarvo();

	public abstract int getAanet();

	public abstract String getAlkuloppu();

	public abstract String getPvm();
	

}