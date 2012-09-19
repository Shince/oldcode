package com.ibm.cn.db2.mytable.cqdb;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CQDBHandler {
	
	private CQDBHandler(){
		Context initContext;
		try {
			initContext = new InitialContext();
			ds_ = (DataSource)initContext.lookup("java:comp/env/jdbc/CQDB");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	private static CQDBHandler instance_;
	private DataSource ds_;
	
	public synchronized static CQDBHandler getInstance(){
		if( instance_ == null ) {
			instance_ = new CQDBHandler();
			return instance_;
		}else{
			return instance_;
		}
	}
	
	public Connection getConnection(){
		try {
			return ds_.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void updateSQL( String sql ){
		Connection conn = this.getConnection();
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
