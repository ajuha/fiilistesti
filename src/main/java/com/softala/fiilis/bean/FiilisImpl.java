package com.softala.fiilis.bean;


public class FiilisImpl implements fiilistaulu {
	
	
	private int id;
	private int fiilis1;
	private int fiilis2;
	private int fiilis3;
	private int fiilis4;
	private int fiilis5;
	private double keskiarvo;
	private int aanet;
	private String nimi;
	private String pvm;
	private int kayttajaid;
	
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

	public String getNimi() {
		return nimi;
	}

	public void setNimi(String nimi) {
		this.nimi = nimi;
	}

	public String getPvm() {
		return pvm;
	}

	public void setPvm(String pvm) {
		this.pvm = pvm;
	}
	
	public int getKayttajaid() {
		return kayttajaid;
	}

	public void setKayttajaid(int kayttajaid) {
		this.kayttajaid = kayttajaid;
	}


	




	@Override
	public String toString() {
		return "HenkiloImpl [id=" + id + ", fiilis1=" + fiilis1 + ", fiilis2="
				+ fiilis2 + ", fiilis3=" + fiilis3 + ", fiilis4="
				+ fiilis4 + ", fiilis5=" + fiilis5
				+ ", keskiarvo=" + keskiarvo + ", aanet=" + aanet + ", nimi=" + nimi + ", pvm=" + pvm + "]";
	}

}
