package com.softala.fiilis.dao;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@SuppressWarnings("serial")
@ResponseStatus(value=HttpStatus.NOT_FOUND)
public class FiilistaEiLoydyPoikkeus extends RuntimeException {
	
	public FiilistaEiLoydyPoikkeus(Exception cause) {
		super(cause);
	}
	
}