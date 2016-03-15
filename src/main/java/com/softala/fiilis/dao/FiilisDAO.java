package com.softala.fiilis.dao;

import java.util.List;

import com.softala.fiilis.bean.fiilistaulu;


public interface FiilisDAO {

	public abstract void talleta(fiilistaulu henkilo);

	public abstract fiilistaulu etsi(int id);

	public abstract List<fiilistaulu> haeKaikki();

}