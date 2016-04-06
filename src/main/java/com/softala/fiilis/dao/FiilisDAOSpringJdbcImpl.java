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

import com.softala.fiilis.bean.fiilistaulu;
@Repository
public class FiilisDAOSpringJdbcImpl implements FiilisDAO {
		
	@Inject
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	
	/**
	 * Tallettaa parametrina annetun henkil??n tietokantaan.
	 * Tietokannan generoima id asetetaan parametrina annettuun olioon.
	 */
	public void talleta(fiilistaulu h) {
		final String sql = "insert into fiilikset(fiilis1, fiilis2, fiilis3, fiilis4, fiilis5, keskiarvo, aanet, nimi, pvm) values(?,?,?,?,?,?,?,?,?)";
		
		//anonyymi sis??luokka tarvitsee vakioina v??litett??v??t arvot,
		//jotta roskien keruu onnistuu t??m??n metodin suorituksen p????ttyess??. 
		final int fiilis1 = h.getFiilis1();
		final int fiilis2 = h.getFiilis2();
		final int fiilis3 = h.getFiilis3();
		final int fiilis4 = h.getFiilis4();
		final int fiilis5 = h.getFiilis5();
		final double keskiarvo = h.getKeskiarvo();
		final int aanet = h.getAanet();
		final String nimi = h.getNimi();
		final String pvm = h.getPvm();
		
		//jdbc pist???? generoidun id:n t??nne talteen
		KeyHolder idHolder = new GeneratedKeyHolder();
	    
		//suoritetaan p??ivitys itse m????ritellyll?? PreparedStatementCreatorilla ja KeyHolderilla
		jdbcTemplate.update(
	    	    new PreparedStatementCreator() {
	    	        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
	    	            PreparedStatement ps = connection.prepareStatement(sql, new String[] {"id"});
	    	            ps.setInt(1, fiilis1);
	    	            ps.setInt(2, fiilis2);
	    	            ps.setInt(3, fiilis3);
	    	            ps.setInt(4, fiilis4);
	    	            ps.setInt(5, fiilis5);
	    	            ps.setDouble(6, keskiarvo);
	    	            ps.setInt(7, aanet);
	    	            ps.setString(8, nimi);
	    	            ps.setString(9, pvm);
	    	            return ps;
	    	        }
	    	    }, idHolder);
	    
		//tallennetaan id takaisin beaniin, koska
		//kutsujalla pit??isi olla viittaus samaiseen olioon
	    h.setId(idHolder.getKey().intValue());

	}
	

	public fiilistaulu etsi(int id) {
		String sql = "select fiilis1, fiilis2, fiilis3, fiilis4, fiilis4, fiilis5, keskiarvo, aanet, nimi, pvm from fiilikset where id = ?";
		Object[] parametrit = new Object[] { id };
		RowMapper<fiilistaulu> mapper = new FiilisRowMapper();
		
	    fiilistaulu h;
	    try { 
	    h = jdbcTemplate.queryForObject(sql , parametrit, mapper);
	    } catch(IncorrectResultSizeDataAccessException e) {
	    	throw new FiilistaEiLoydyPoikkeus(e);
	    }
	    return h;
	                                  

	}
	

	public List<fiilistaulu> haeKaikki() {
		
		String sql = "select id, fiilis1, fiilis2, fiilis3, fiilis4, fiilis4, fiilis5, keskiarvo, aanet, nimi, pvm from fiilikset";
		RowMapper<fiilistaulu> mapper = new FiilisRowMapper();
		List<fiilistaulu> henkilot = jdbcTemplate.query(sql,mapper);

		return henkilot;
	}
}
