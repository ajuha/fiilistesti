package com.softala.fiilis.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.softala.fiilis.bean.User;
import com.softala.fiilis.bean.fiilistaulu;
import com.softala.fiilis.dao.FiilisDAO;

@Controller
@RequestMapping(value="/secure/admin")
public class AdminController {
	
	
	@Inject
	private FiilisDAO dao;
	
	
	@RequestMapping(value = "/tools", method = RequestMethod.GET)
	public String paasivu(Model model) {
		
		return "secure/admin/tools";
	}
	
	
	@RequestMapping("fiilikset.json")
	public @ResponseBody List<fiilistaulu> haeFiiliksetJSON() {
		
		List<fiilistaulu> fiilikset = dao.haeIhanKaikki();
		return fiilikset;
	}
	
	@RequestMapping("kayttajat.json")
	public @ResponseBody List<User> haeKayttajatJSON() {
		
		List<User> kayttajat = dao.haeKaikkiKayttajat();
		return kayttajat;
	}
	
}
