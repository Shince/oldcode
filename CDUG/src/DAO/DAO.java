
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DAO
{
	String strDbUrl="jdbc:mysql://127.0.0.1:3306/discuz";
	String strDbUserName = "root";
	String strDbUserPassword = "sue520";
	
	private Connection conn = null;

	public DAO()
	{
		try
		{
		    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    conn = DriverManager.getConnection(strDbUrl, strDbUserName, strDbUserPassword);
			if (conn != null)
			{
				//System.out.println("@@@ Db Connected Successfully! @@@");
			}
			else
			{
			//System.out.println("@@@ Db Connected failed! @@@");				
			}
		}
		catch(Exception e)
		{
			//System.out.println("@@@ Db Connected failed! @@@");
			//System.out.println(e.getMessage());
		}
		
		
	}

	public int close() 
	{
		if ( conn != null )
		{
			try
			{
				conn.close();
				conn = null;
				//System.out.println("@@@ Db Closed Successfully! @@@");
				return 0;
			}
			catch(Exception e)
			{
				//System.out.println(e.getMessage());
				return -1;
			}
		}

		return 0;
	}
	
	public Statement getNewStatement()
	{
		try
		{
			Statement stmt = conn.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			return stmt;
		}
		catch(SQLException ex)
		{
			//System.out.println("SQLException: " + ex.getMessage());
			return null;
		}	
	}

	
	public ResultSet getResultSet(String strSqlString)
	{
		ResultSet rs;
		
		try
		{
			Statement stmt = conn.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			//System.out.println("@@@ Begin to execute sql string... @@@");
			//System.out.println("\t" + strSqlString);
			rs = stmt.executeQuery(strSqlString);
			//System.out.println("@@@ Execute success! @@@");
			
		}
		catch(SQLException ex)
		{
			//System.out.println("@@@ Execute failed! @@@");
			//System.out.println("SQLException: " + ex.getMessage());
			
			return null;	
		}
	
		return rs;		
	}
	
	
	public boolean ResultUpdate(String strSqlString)
	{
		
		try
		{
			Statement stmt = conn.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);	
			//System.out.println("@@@ Begin to update sql string... @@@");
			//System.out.println("\t" + strSqlString);
			stmt.executeUpdate(strSqlString);
			//System.out.println("@@@ Update success! @@@");	
			return true;
		}
		catch(SQLException ex)
		{
			//System.out.println("@@@ Update failed! @@@");
			//System.out.println("SQLException: " + ex.getMessage());
			
			return false;	
		}
	}

	
	public int getTableRowCount(String strTableName, String strSqlSelectString)
	{
		int iRow = 0;

		try
		{
				Statement stmt = conn.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = stmt.executeQuery(strSqlSelectString);
					
				while ( rs.next() )
				{
					iRow++;
				}
		
				rs.close();
				stmt.close();
		}
		catch(SQLException ex)
		{			
			//System.out.println("SQLException: " + ex.getMessage());
			return -1;
		}

		return iRow;
	}



	public int getTableRowCount(String strTableName)
	{
		String strSQL;
		strSQL = "select * from " + strTableName;
		
		return getTableRowCount(strTableName, strSQL);
	}



	public int ExecuteSQL(String strSqlString)
	{
		int iRet = 0;

		try
		{
			Statement stmt = conn.createStatement();
			//System.out.println("@@@ Begin to execute sql string... @@@");
			//System.out.println("\t" + strSqlString);
			stmt.execute(strSqlString);
			//System.out.println("@@@ Execute success! @@@");
			stmt.close();			
		}
		catch(SQLException ex)
		{
			//System.out.println("SQLException: " + ex.getMessage());
			return -1;
		}

		return iRet;
	}

	
	

	public int getCurrentNewID(String strTableName, String strPrimaryKey)
	{
		int iNew = 0;

		String strSQL;

		strSQL = "select " + strPrimaryKey + " from " + strTableName;

		try
		{
				Statement stmt = conn.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = stmt.executeQuery(strSQL);
					
				while ( rs.next() )
				{
					if ( iNew <= rs.getInt(1) )
					{
						iNew = rs.getInt(1);
					}
				}
		
				rs.close();
				stmt.close();
		}
		catch(SQLException ex)
		{
			
			//System.out.println("SQLException: " + ex.getMessage());
			return -1;
		}

		return ( iNew + 1 );
	}
	public Connection getConn(){
		return conn;
	}
}


