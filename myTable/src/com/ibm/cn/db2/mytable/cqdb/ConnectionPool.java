package com.ibm.cn.db2.mytable.cqdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Vector;

class ConnectionVector {
	private Vector connections_ = new Vector();
	public synchronized int size()
	{
		return connections_.size();
	}
	
	public synchronized Connection pop()
	{
		if(size() == 0)
		{
			return null;
		}
		
		Connection con = (Connection)connections_.get(0);
		connections_.remove(0);
		return con;
	}
	
	public synchronized void push(Connection con)
	{
		connections_.add(con);
	}
	
	public synchronized Connection get(int index)
	{
		if(index<0 || index >= size())
		{
			return null;
		}
		return (Connection)connections_.get(index);
		
	}
	
	public synchronized void remove(int index)
	{
		if(index > 0 && index < size())
		{
			connections_.remove(index);
		}
	}
	
	public void remove(Connection con)
	{
		connections_.remove(con);
	}
}

public class ConnectionPool {
	
	static private int MAX_ALLOWED_CONNECTIONS = 5;
	static private ConnectionPool self_ = new ConnectionPool();
	static private boolean isInit_ = false;
	
	int total_ = 0;
	
	String lastError_ = new String();
	String driver_ = "com.ibm.db2.jcc.DB2Driver";
	String url_ = "jdbc:db2://9.17.210.102:446/DSN2SSDF"/*"jdbc:db2://9.125.73.41:50001/db2robot"*/;
	String user_ = "P917623"/*"db2inst3"*/;
	String password = "ftp2ssgg"/*"ftpaut00"*/;
	String schema = "CQDB"/*"DB2INST3"*/;
	
	private Connection getOneConnection()
	{
		try
		{
			Class.forName(driver_);
			Connection con = DriverManager.getConnection(url_, user_, password);

			PreparedStatement stmt = null;
			con.setAutoCommit(true);
			String SET_SCHEMA = "SET CURRENT_SCHEMA = '" + schema + "'";
			stmt = con.prepareStatement(SET_SCHEMA);
			stmt.execute();

			return con;
		} 
		catch (Exception e)
		{
			lastError_ = "Something wrong while connecting to the database.";
			e.printStackTrace();
			return null;
		}
	}
	
	private ConnectionVector inUse_ = new ConnectionVector();
	private ConnectionVector idle_ = new ConnectionVector();
	
	private ConnectionPool()
	{
	}

	static public synchronized ConnectionPool instance()
	{
		if(isInit_)
		{
			return self_;
		}
		
		if(self_.initialize())
		{
			return self_;
		}
		else
		{
			return null;
		}
	}
	
	public boolean initialize()
	{
		for(int i = 0; i< MAX_ALLOWED_CONNECTIONS; i++)
		{
			Connection con = this.getOneConnection();
			if(con != null)
			{
				total_ ++;
				idle_.push(con);
			}
		}
		
		isInit_ = true;
		return true;
	}

	public synchronized Connection getConnection()
	{
		while(true)
		{
			if(idle_.size() != 0)
			{
				Connection conn = idle_.pop();
				inUse_.push(conn);
				return conn; 
			}
			
			if(total_ < MAX_ALLOWED_CONNECTIONS)
			{
				Connection conn = getOneConnection();
				if(conn != null)
				{
					total_ ++;
					inUse_.push(conn);
					return conn;
				}
			}
			
			try{
				Thread.sleep(100);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	
	public synchronized boolean close(Connection conn)
	{
		inUse_.remove(conn);
		idle_.push(conn);
		return false;
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
