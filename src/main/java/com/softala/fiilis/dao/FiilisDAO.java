package com.softala.fiilis.dao;

import java.util.List;

import com.softala.fiilis.bean.User;
import com.softala.fiilis.bean.fiilistaulu;


public interface FiilisDAO {

	public abstract void talleta(fiilistaulu henkilo);

	public abstract fiilistaulu etsi(int id);

	public abstract List<fiilistaulu> haeKaikki(int oikeaId);
	
	public abstract List<fiilistaulu> haeIhanKaikki();
	
	public abstract List<User> haeKaikkiKayttajat();
	
	public abstract User haeYksiKayttaja(String username);

	
}