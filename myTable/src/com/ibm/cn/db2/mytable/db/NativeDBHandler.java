package com.ibm.cn.db2.mytable.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class NativeDBHandler {
	static private NativeDBHandler self_ = new NativeDBHandler();

	String lastError_ = "";

	private NativeDBHandler() {
	}

	static public synchronized NativeDBHandler instance() {
		return self_;
	}

	private synchronized Connection getConnection() {
		Connection conn = NativeConnectionPool.instance().getConnection();
		return conn;
	}

	/*
	 * important!! Pls check the return value !!
	 */
	public ResultSet executeSQL(String sql) {
		Connection conn = this.getConnection();

		try {
			Statement st = conn.createStatement();
			ResultSet res = st.executeQuery(sql);
			return res;
		} catch (Exception e) {
			lastError_ = "Something wrong while excuting the sql statement";
			e.printStackTrace();
			return null;
		} finally {
			NativeConnectionPool.instance().close(conn);
		}
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
		} finally {
			NativeConnectionPool.instance().close(conn);
		}
	}

	String getLastErrorMsg() {
		return lastError_;
	}
}
