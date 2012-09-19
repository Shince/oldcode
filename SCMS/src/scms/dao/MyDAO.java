package scms.dao;

public class MyDAO {

	private static final String url = "jdbc:microsoft:sqlserver://";

	private static final String serverName = "localhost";

	private static final String portNumber = "1433";

	private static String databaseName = "SCMS";

	private static String userName = "sa";

	private static String password = "";

	private final static String selectMethod = "cursor";

	private static String getConnectionUrl() {
		return url + serverName + ":" + portNumber + ";databaseName="
				+ databaseName + ";selectMethod=" + selectMethod + ";";
	}

	private static java.sql.Connection getConnection() {
		try {
			java.sql.Connection con;
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			con = java.sql.DriverManager.getConnection(getConnectionUrl(),
					userName, password);
			if (con != null)
				System.out.println("SCMS Connection Successful!");
			return con;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error Trace in getConnection() : "
					+ e.getMessage());
			return null;
		}
	}

	public static java.sql.Connection openDB() {
		java.sql.Connection con;
		con=getConnection();
		try {
			con.setAutoCommit(false);// 设置是否自动commit
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public static void closeDB(java.sql.Connection con) {

		try {
			if (con != null)
				con.close();
			con = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static  java.sql.ResultSet select(java.sql.Connection con, String select, String from) {
		try {
			java.sql.Statement stmt = con.createStatement();
			java.sql.ResultSet rs;
			rs = stmt.executeQuery("SELECT " + select + " FROM " + from + ";");
			return rs;
		} catch (Exception sqle) {
			System.out.println(sqle);
			return null;
		}
	}

	public static  java.sql.ResultSet select(java.sql.Connection con, String select, String from,String where) {
		try {
			java.sql.Statement stmt = con.createStatement();
			java.sql.ResultSet rs;
			rs = stmt.executeQuery("SELECT " + select + " FROM " + from
					+ " WHERE " + where + ";");
			return rs;
		} catch (Exception sqle) {
			System.out.println(sqle);
			return null;
		}
	}

	public static boolean update(java.sql.Connection con, String tname, String set,String where) {
		try {
			java.sql.Statement stmt = con.createStatement();
			String strUpdate = "UPDATE " + tname + " SET " + set
			+ " WHERE " + where + ";";
			if (stmt.executeUpdate(strUpdate) != 0)
			{
				con.commit();
				return true;
			}
			else
				return false;
		} catch (Exception sqle) {
			System.out.println(sqle);
			return false;
		}
	}
    public static boolean insert(java.sql.Connection con, String tname, String attri, String val){
    	try{
    		java.sql.Statement stmt = con.createStatement();
			String strInsert = "INSERT INTO " + tname +" ("+ attri +") VALUES ("+val+")" + ";";
			if (stmt.executeUpdate(strInsert) == 1)
			{
				con.commit();
				return true;
			}
			else
				return false;
    	}catch (Exception sqle) { 
			System.out.println(sqle);
			return false;
		}
    }
    public static boolean delete(java.sql.Connection con, String from, String where)
    {
    	try{
    	java.sql.Statement stmt = con.createStatement();
    	String strDelete = "DELETE FROM "+from+" WHERE "+where+";";
    	if(stmt.executeUpdate(strDelete)!=0)
    	{
    		con.commit();
    		return true;
    	}
    	else
    		return true;
    	}catch(Exception e)
    	{
    		System.out.println(e);
    		return false;
    	}
    	}
}











