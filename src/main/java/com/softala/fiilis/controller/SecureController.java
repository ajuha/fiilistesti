package com.softala.fiilis.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.softala.fiilis.bean.FiilisImpl;
import com.softala.fiilis.bean.fiilistaulu;
import com.softala.fiilis.dao.FiilisDAO;

@Controller
@RequestMapping(value = "/secure")
public class SecureController {

	@Inject
	FiilisDAO dao;
	
	@RequestMapping(value = "/fiilis", method = RequestMethod.GET)
	public String paasivu(Model model) {
		return "secure/fiilis";
	}
	
	@RequestMapping(value = "/etusivu", method = RequestMethod.GET)
	public String etusivu(Model model) {
		return "secure/etusivu";
	}
	
	@RequestMapping(value = "tulokset", method = RequestMethod.GET)
	public String getList(Model model) {
		List<fiilistaulu> tulokset = dao.haeKaikki();
		model.addAttribute("tulokset", tulokset);
		return "secure/tulokset";
	}

	@RequestMapping("fiilikset.json")
	public @ResponseBody List<fiilistaulu> haeFiiliksetJSON() {
		List<fiilistaulu> fiilikset = dao.haeKaikki();
		return fiilikset;
	}

	// fiilisten LISTAUS

	
	@RequestMapping(value="lisaatulos", method=RequestMethod.POST, 
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public FiilisImpl lisaaFiilis(@RequestBody FiilisImpl fiilis) {
		System.out.println("fiilis: "+fiilis);
		dao.talleta(fiilis);
		return fiilis;
        
    }
	
	
	//vie fiilissivulle
	@RequestMapping("fiilissivulle")
	public String naytaFiilissivu() {
		return "secure/fiilis";
	}
	

		
		//vie login sivulle
		@RequestMapping("loginsivulle")
		public String naytalogin() {
			return "login";
		}
}
