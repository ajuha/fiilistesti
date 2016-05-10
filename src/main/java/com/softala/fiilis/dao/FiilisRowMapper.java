package com.softala.fiilis.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.softala.fiilis.bean.fiilistaulu;
import com.softala.fiilis.bean.FiilisImpl;


public class FiilisRowMapper implements RowMapper<fiilistaulu> {

	public fiilistaulu mapRow(ResultSet rs, int rowNum) throws SQLException {
		fiilistaulu h = new FiilisImpl();
		h.setId(rs.getInt("id"));
		h.setFiilis1(rs.getInt("fiilis1"));
		h.setFiilis2(rs.getInt("fiilis2"));
		h.setFiilis3(rs.getInt("fiilis3"));
		h.setFiilis4(rs.getInt("fiilis4"));
		h.setFiilis5(rs.getInt("fiilis5"));
		h.setKeskiarvo(rs.getDouble("keskiarvo"));
		h.setAanet(rs.getInt("aanet"));
		h.setNimi(rs.getString("nimi"));
		h.setPvm(rs.getString("pvm"));
		h.setKayttajaid(rs.getInt("kayttajaid"));
		
		return h;
	}

}
