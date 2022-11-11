package com.rb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.rb.dto.DtoUserLogin;
import com.rb.dto.DtoUserSignup;

public class DaoUserLogin {

	DataSource dataSource;
	private static DaoUserLogin instance = new DaoUserLogin();

	public DaoUserLogin() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/roastbean");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// loginCheck
	public int loginCheck(String user_id, String user_pw) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int check = 0;

		try {
			connection = dataSource.getConnection();

			String query = "select count(*) from user where user_id = ? and user_pw = ? and user_deletedate is null ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user_id);
			preparedStatement.setString(2, user_pw);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				check = resultSet.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return check;

	} // loginCheck
	
	// loginCheck
	public int loginCheckApi(String user_id) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int check = 0;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select count(*) from user where user_id = ? and user_deletedate is null ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user_id);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				check = resultSet.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return check;
		
	} // loginCheck

	// Login Action : Admin Check
	public int loginCheckAdmin(String user_id, String user_pw) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int check = 0;

		try {
			connection = dataSource.getConnection();

			String query = "select count(*) from admin where admin_id = ? and admin_pw = ? ";

			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user_id);
			preparedStatement.setString(2, user_pw);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				check = resultSet.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return check;
	} // login
	

} // End
