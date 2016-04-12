package com.softala.fiilis.service;

import org.springframework.stereotype.Service;

import com.softala.fiilis.service.MiscService;

@Service
public class MiscServiceImpl implements MiscService {

	public void palveluAdmineille() {
		System.out.println("misc admineille");
	}

	public void palveluSisaankirjautuneille() {
		System.out.println("misc sisaankirjautuneille");
	}

	public void palveluKaikille() {
		System.out.println("misc kaikille");
	}

}
