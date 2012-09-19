package com.ibm.cn.db2.mytable.cqdb;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ibm.cn.db2.mytable.util.Util;

public class PmrDAO {

	private static PmrDAO instance_;
	private CQDBHandler db_;

	private PmrDAO() {
		db_ = CQDBHandler.getInstance();
	}

	synchronized public static PmrDAO getInstance() {
		if (instance_ == null) {
			instance_ = new PmrDAO();
		}
		return instance_;
	}

	public int getResultCount(String ownerID) {
		String sql = "SELECT count(*) as count FROM CQDB.PMR_WKLY_HPP_UV where PROB_CUST_ACCT_#='" + ownerID + "'";

		Connection conn = db_.getConnection();
		ResultSet rs = null;
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		int count = 0;
		if (rs != null) {
			try {
				while (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
	
	public ResultSet getAll( String id, String db ){
		ResultSet rs = null;
		
		String sql = "SELECT ";

		try {
			Class pd = Class.forName("com.ibm.cn.db2.mytable.cqdb.PMRDimention");
			Field[] fields = pd.getDeclaredFields();
			for (int i = 0; i < fields.length; i++) {
				sql += fields[i].getName();
				if( fields[i].getName().compareTo("PROB_")==0 ||
						fields[i].getName().compareTo("PROB_BO_")==0 ||
						fields[i].getName().compareTo("PROB_BO_CNTRY_")==0 ||
						fields[i].getName().compareTo("PROB_CUST_ACCT_")==0 ){
					sql += "#";
				}
				sql += ",";
			}
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		sql = sql.substring(0, sql.length()-1);
		if( db.compareTo("archive") == 0 ){
			sql += " from CQDB.PMR_HPP_ARCHIVE_UV WHERE PROB_CUST_ACCT_#='" + id + "'";
		} if( db.compareTo("hist") == 0 ){
			sql += " from CQDB.PMR_HPP_HIST_UV WHERE PROB_CUST_ACCT_#='" + id + "'";
		} else {
			sql += " from CQDB.PMR_WKLY_HPP_UV WHERE PROB_CUST_ACCT_#='" + id + "'";
		}
		
		Util.log( sql );
		
		Connection conn = db_.getConnection();
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

}
