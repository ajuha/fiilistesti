package com.softala.fiilis.bean;

public interface fiilistaulu {

	public abstract int getId();

	public abstract void setId(int id);

	public abstract void setFiilis1(int fiilis1);

	public abstract void setFiilis2(int fiilis2);

	public abstract void setFiilis3(int fiilis3);

	public abstract void setFiilis4(int fiilis4);

	public abstract void setFiilis5(int fiilis5);

	public abstract void setAanet(int aanet);

	public abstract void setNimi(String nimi);

	public abstract void setPvm(String pvm);

	public abstract void setKeskiarvo(double keskiarvo);

	public abstract void setKayttajaid(int kayttajaid);

	public abstract int getFiilis1();

	public abstract int getFiilis2();

	public abstract int getFiilis3();

	public abstract int getFiilis4();

	public abstract int getFiilis5();
	
	public abstract double getKeskiarvo();

	public abstract int getAanet();

	public abstract String getNimi();

	public abstract String getPvm();
	
	public abstract int getKayttajaid();
	

}