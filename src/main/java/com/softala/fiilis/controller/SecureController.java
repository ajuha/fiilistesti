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
import com.softala.fiilis.bean.User;
import com.softala.fiilis.bean.fiilistaulu;
import com.softala.fiilis.dao.FiilisDAO;
import com.softala.fiilis.dao.UserDAO;

@Controller
@RequestMapping(value = "/secure")
public class SecureController {

	@Inject
	private FiilisDAO dao;
	
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
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String nimi = authentication.getName();
		User id = dao.haeYksiKayttaja(nimi);
		System.out.println(id.toString());
		int oikeaId = id.getId();
		
		System.out.println(oikeaId);
		
		List<fiilistaulu> fiilikset = dao.haeKaikki(oikeaId);
		
		int maara = fiilikset.size();
		System.out.println(maara);
		model.addAttribute("maara", maara);
		
		
		
		String viimeisin = "-";
		
		if (maara > 0){
			viimeisin = fiilikset.get(fiilikset.size() - 1).getPvm();
			
		}
		
		model.addAttribute("viimeisin", viimeisin);	
		
		
		
		return "secure/tulokset";
	}

	@RequestMapping("fiilikset.json")
	public @ResponseBody List<fiilistaulu> haeFiiliksetJSON() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String nimi = authentication.getName();
		User id = dao.haeYksiKayttaja(nimi);
		System.out.println(id.toString());
		int oikeaId = id.getId();
		
		System.out.println(oikeaId);
		
		List<fiilistaulu> fiilikset = dao.haeKaikki(oikeaId);
		return fiilikset;
	}

	// fiilisten LISTAUS

	
	@RequestMapping(value="lisaatulos", method=RequestMethod.POST, 
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public FiilisImpl lisaaFiilis(@RequestBody FiilisImpl fiilis) {
		System.out.println("fiilis: "+fiilis);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String nimi = authentication.getName();
		User id = dao.haeYksiKayttaja(nimi);
		System.out.println(id.toString());
		int oikeaId = id.getId();
		System.out.println(oikeaId);
		//2. userilta saat id:n
		//3. tee sille mit‰ haluat, lis‰‰ fiilikseen messiin...
		
		fiilis.setKayttajaid(oikeaId);
		
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
