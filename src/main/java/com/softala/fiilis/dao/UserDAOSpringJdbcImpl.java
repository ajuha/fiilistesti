package com.softala.fiilis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.softala.fiilis.bean.User;

public class UserDAOSpringJdbcImpl implements UserDAO {
	
	
	@Inject
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public User haeId(String nimi) {
		System.out.println(nimi);
		String sql = "select id from webuser2 where username = ?";
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
