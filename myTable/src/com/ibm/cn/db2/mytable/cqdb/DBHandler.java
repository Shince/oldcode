package com.ibm.cn.db2.mytable.cqdb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBHandler
{
	static private DBHandler self_ = new DBHandler();
	/*String driver = "com.ibm.db2.jcc.DB2Driver";
	String url = "jdbc:db2://9.125.73.41:50001/db2robot";
	String user = "db2inst3";
	String password = "ftpaut00";
	String schema = "DB2INST3";*/
	String lastError_ = "";
	private DBHandler()
	{
	}

	static public synchronized DBHandler instance()
	{
		return self_;
	}

	private synchronized Connection getConnection()
	{
		Connection conn = ConnectionPool.instance().getConnection();
		return conn;
	}

	/*
	 * important!! Pls check the return value !!
	 */
	public ResultSet executeSQL(String sql)
	{
		Connection conn = this.getConnection();
		
		try	{
			Statement st = conn.createStatement();
			ResultSet res = st.executeQuery(sql);
			return res;
		} catch (Exception e){
			lastError_ = "Something wrong while excuting the sql statement";
			e.printStackTrace();
			return null;
		} finally{
			ConnectionPool.instance().close(conn);
		}
	}

	String getLastErrorMsg()
	{
		return lastError_;
	}
}
