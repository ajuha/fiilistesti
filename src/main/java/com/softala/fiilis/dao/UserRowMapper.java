package com.softala.fiilis.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.softala.fiilis.bean.User;
import com.softala.fiilis.bean.UserImpl;


public class UserRowMapper implements RowMapper<User> {

	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User u = new UserImpl();
		u.setId(rs.getInt("id"));
		u.setUsername(rs.getString("username"));
		u.setPassword_encrypted(rs.getString("password_encrypted"));
		u.setEnabled(rs.getInt("enabled"));
		u.setFirstname(rs.getString("firstname"));
		u.setLastname(rs.getString("lastname"));
		return u;
	}

}