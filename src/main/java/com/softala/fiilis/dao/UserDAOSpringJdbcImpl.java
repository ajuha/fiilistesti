package com.softala.fiilis.dao;

import javax.inject.Inject;

import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.softala.fiilis.bean.User;

public class UserDAOSpringJdbcImpl {
	
	
	@Inject
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public User etsi(String nimi) {
		String sql = "select id from fiilikset where nimi = ?";
		Object[] parametrit = new Object[] { nimi };
		RowMapper<User> mapper = new UserRowMapper();
		
	    User u;
	    try { 
	    u = jdbcTemplate.queryForObject(sql , parametrit, mapper);
	    } catch(IncorrectResultSizeDataAccessException e) {
	    	throw new FiilistaEiLoydyPoikkeus(e);
	    }
	    return u;
	                                  

	}
	
}
