package com.softala.fiilis.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	@RequestMapping(value="lisaatulos", method=RequestMethod.POST, 
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public FiilisImpl lisaaFiilis(@RequestBody FiilisImpl fiilis) {
		System.out.println("fiilis: "+fiilis);
		//1. Hae useri kannasta usernamen perustella
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user=userDao.getUserByUserName(authentication.getName());
		//2. userilta saat id:n
		//3. tee sille mit‰ haluat, lis‰‰ fiilikseen messiin...
		dao.talleta(fiilis);
		return fiilis;
        
    }
	
	
	//vie fiilissivulle
	@RequestMapping("fiilissivulle")
	public String naytaFiilissivu() {
		return "fiilis";
	}
	
	//vie fiilissivulle
		@RequestMapping("etusivulle")
		public String naytaEtusivu() {
			return "etusivu";
		}
		
		//vie login sivulle
		@RequestMapping("loginsivulle")
		public String naytalogin() {
			return "login";
		}	
		
		
}
