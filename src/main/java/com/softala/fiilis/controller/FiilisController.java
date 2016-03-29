package com.softala.fiilis.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.softala.fiilis.bean.fiilistaulu;
import com.softala.fiilis.dao.FiilisDAO;

@Controller
public class FiilisController {
	@Inject
	FiilisDAO dao;

	@RequestMapping("fiilikset.json")
	public @ResponseBody List<fiilistaulu> haeFiiliksetJSON() {
		List<fiilistaulu> fiilikset = dao.haeKaikki();
		return fiilikset;
	}

	// fiilisten LISTAUS
	@RequestMapping(value = "tuloksiin", method = RequestMethod.GET)
	public String getList(Model model) {
		List<fiilistaulu> tulokset = dao.haeKaikki();
		model.addAttribute("tulokset", tulokset);
		return "tulokset";
	}
	//vie tulossivulle
	@RequestMapping("fiilissivulle")
	public String naytaFiilissivu() {
		return "fiilis";
	}
}
