package com.softala.fiilis.bean;

public class TulosBean {

	private int id;
	private int fiilis1;
	private int fiilis2;
	private int fiilis3;
	private int fiilis4;
	private int fiilis5;
	private double keskiarvo;
	private int aanet;
	private String alkuloppu;
	
	
	public TulosBean(){

		id = 0;
		fiilis1 = 0;
		fiilis2 = 0;
		fiilis3 = 0;
		fiilis4 = 0;
		fiilis5 = 0;
		keskiarvo = 0.0;
		aanet = 0;
	}
	
	
	public TulosBean(int id, int fiilis1, int fiilis2, int fiilis3,
			int fiilis4, int fiilis5, double keskiarvo, int aanet) {
		super();
		this.id = id;
		this.fiilis1 = fiilis1;
		this.fiilis2 = fiilis2;
		this.fiilis3 = fiilis3;
		this.fiilis4 = fiilis4;
		this.fiilis5 = fiilis5;
		this.keskiarvo = keskiarvo;
		this.aanet = aanet;
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFiilis1() {
		return fiilis1;
	}
	public void setFiilis1(int fiilis1) {
		this.fiilis1 = fiilis1;
	}
	public int getFiilis2() {
		return fiilis2;
	}
	public void setFiilis2(int fiilis2) {
		this.fiilis2 = fiilis2;
	}
	public int getFiilis3() {
		return fiilis3;
	}
	public void setFiilis3(int fiilis3) {
		this.fiilis3 = fiilis3;
	}
	public int getFiilis4() {
		return fiilis4;
	}
	public void setFiilis4(int fiilis4) {
		this.fiilis4 = fiilis4;
	}
	public int getFiilis5() {
		return fiilis5;
	}
	public void setFiilis5(int fiilis5) {
		this.fiilis5 = fiilis5;
	}
	public double getKeskiarvo() {
		return keskiarvo;
	}
	public void setKeskiarvo(double keskiarvo) {
		this.keskiarvo = keskiarvo;
	}
	public int getAanet() {
		return aanet;
	}
	public void setAanet(int aanet) {
		this.aanet = aanet;
	}
	
	
}
