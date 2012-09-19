package com.ibm.cn.db2.mytable.db;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.ibm.cn.db2.mytable.bean.Customer;
import com.ibm.cn.db2.mytable.cqdb.PMRDimention;
import com.ibm.cn.db2.mytable.util.Util;

public class NativePmrDAO {

	private static NativePmrDAO instance_;
	private ContainerDBHandler db_;

	private NativePmrDAO() {
		db_ = ContainerDBHandler.getInstance();
	}

	synchronized public static NativePmrDAO getInstance() {
		if (instance_ == null) {
			instance_ = new NativePmrDAO();
		}
		return instance_;
	}

	public int getResultCount(String ownerID) {
		String sql = /*"SELECT count(*) as count FROM DB2INST3.CALLCURRENT where ownerid="*/
			"SELECT count(*) as count FROM PMR_RETRIEVAL where PROB_CUST_ACCT_#='"
				+ ownerID + "'";

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
			} finally{
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return count;
	}
	
	public int getCustNameQueryResultCount(String custName, boolean visible) {
		ArrayList idList = CustomerNameDAO.getInstance().getAllCustomerID(custName);
		if( idList==null || idList.size()<1 ) return 0;
		
		Customer cust = CustomerNameDAO.getInstance().getCustomer(custName);
		
		String sql = /*"SELECT count(*) as count FROM DB2INST3.CALLCURRENT where ownerid="*/
			"SELECT count(*) as count FROM PMR_RETRIEVAL where (PROB_CUST_ACCT_#='"
				+ idList.get(0) + "' ";

		for( int i=1; i<idList.size(); i++ ){
			sql += "or PROB_CUST_ACCT_#='" + idList.get(i) + "'";
		}
		
		sql += ")";
		
		sql += " and pmr_open_dt>'" + cust.getStartDate() + "'";
		
		sql += " and pmr_open_dt<'" + cust.getStopDate() + "'";
		
		if( visible ){
			sql += " and visible='1'";
		}
		
		Util.log( sql );
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
			}finally{
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
	
	public int insert( ResultSet rs ){
		int i=0;
		if( rs != null ){
				try {
					while( rs.next() ){
						i++;
						String PROB_ = rs.getString("PROB_#");
						String PROB_BO_ = rs.getString("PROB_BO_#");
						String PROB_BO_CNTRY_ = rs.getString("PROB_BO_CNTRY_#");
						
						String COMPONENT_ID = rs.getString("COMPONENT_ID");
						String PRODUCT_ID = rs.getString("PRODUCT_ID");
						String PMR_COMPONENT_ID = rs.getString("PMR_COMPONENT_ID");
						Date PMR_OPEN_DT = rs.getDate("PMR_OPEN_DT");
						Date PROB_CLOSED_DT = rs.getDate("PROB_CLOSED_DT");
						String PROB_CUR_SEV_CD = rs.getString("PROB_CUR_SEV_CD");
						String PROB_CUST_ACCT_ = rs.getString("PROB_CUST_ACCT_#");
						double TOTAL_HRS = rs.getDouble("TOTAL_HRS");
						String sql = "INSERT INTO DB2INST3.PMR_RETRIEVAL(" +
								"PROB_#," +
								"PROB_BO_#," +
								"PROB_BO_CNTRY_#," +
								"COMPONENT_ID," +
								"PRODUCT_ID," +
								"PMR_COMPONENT_ID," +
								((PMR_OPEN_DT==null)?"":"PMR_OPEN_DT,") +
								((PROB_CLOSED_DT==null)?"":"PROB_CLOSED_DT,") +
								"PROB_CUR_SEV_CD," +
								"PROB_CUST_ACCT_#," +
								"TOTAL_HRS) " +
								"VALUES('"
								+ PROB_ + "','"
								+ PROB_BO_ + "','"
								+ PROB_BO_CNTRY_ + "','"
								+ COMPONENT_ID + "','" + PRODUCT_ID + "','" + PMR_COMPONENT_ID + "'," 
								+ ((PMR_OPEN_DT==null)?"":("'" + PMR_OPEN_DT.toString() + "',"))
								 + ((PROB_CLOSED_DT==null)?"":("'" + PROB_CLOSED_DT.toString() + "',")) 
								 + "'" + PROB_CUR_SEV_CD + "','" + PROB_CUST_ACCT_ + "'," + TOTAL_HRS + ")";
						Util.log( sql );
						db_.updateSQL(sql);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
		}
		return i;
	}

	public ArrayList getAllList( String id ){
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
		sql += " from DB2INST3.PMR_RETRIEVAL WHERE PROB_CUST_ACCT_#='" + id + "'";
		Util.log(sql);
		Connection conn = db_.getConnection();
		
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		ArrayList pmrList = new ArrayList();
		if (rs != null) {
			try {
				while (rs.next()) {
					HashMap pmrMap = new HashMap();

					String pmrid = rs.getString("PROB_#");
					String branch = rs.getString("PROB_BO_#");
					String centry =  rs.getString("PROB_BO_CNTRY_#");
					String COMPONENT_ID = rs.getString("COMPONENT_ID");
					String PRODUCT_ID = rs.getString("PRODUCT_ID");
					Timestamp PMR_OPEN_DT = rs.getTimestamp("PMR_OPEN_DT");
					Timestamp PROB_CLOSED_DT = rs.getTimestamp("PROB_CLOSED_DT");
		
					pmrMap.put(PMRDimention.PROB_, pmrid);
					pmrMap.put(PMRDimention.PROB_BO_, branch);
					pmrMap.put(PMRDimention.PROB_BO_CNTRY_, centry);
					pmrMap.put(PMRDimention.COMPONENT_ID, COMPONENT_ID);
					pmrMap.put(PMRDimention.PRODUCT_ID, PRODUCT_ID);
					pmrMap.put(PMRDimention.PMR_OPEN_DT, PMR_OPEN_DT);
					pmrMap.put(PMRDimention.PROB_CLOSED_DT, PROB_CLOSED_DT);

					pmrList.add(pmrMap);
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
		return pmrList;
	}
	
	public ArrayList getAllByPage(String ownerID, int from, int to,	String orderBy, boolean asc, boolean showVisible) {
		String sql = "SELECT * FROM (SELECT ";

		try {
			Class pd = Class.forName("com.ibm.cn.db2.mytable.cqdb.PMRDimention");
			Field[] fields = pd.getDeclaredFields();
			for (int i = 0; i < fields.length; i++) {
				sql += fields[i].getName();
				if( fields[i].getName().compareTo("PROB_")==0 ||
						fields[i].getName().compareTo("PROB_BO_")==0 ||
						fields[i].getName().compareTo("PROB_BO_CNTRY_")==0 ||
						fields[i].getName().compareTo("PROB_CUST_ACCT_")==0){
					sql += "#";
				}
				
				sql += ",";
			}
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		sql += "category,subcategory,mycomment,visible,";
		sql += "rownumber() ";

		if (orderBy != null || orderBy.trim().length() > 0) {
			String ascOrDesc = (asc) ? "asc" : "desc";
			sql += "over (order by " + orderBy + " " + ascOrDesc + ") ";
		}

		sql += "as rn from DB2INST3.PMR_RETRIEVAL WHERE PROB_CUST_ACCT_# = '" + ownerID + "'" + ((showVisible)?" and visible='1'":"") + ") AS a1 WHERE a1.rn BETWEEN " + from + " AND " + to;
		
		Util.log(sql);

		Connection conn = db_.getConnection();
		
		ResultSet rs = null;
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		ArrayList pmrList = new ArrayList();
		if (rs != null) {
			try {
				while (rs.next()) {
					HashMap pmrMap = new HashMap();

					String pmrid = rs.getString("PROB_#");
					String branch = rs.getString("PROB_BO_#");
					String centry =  rs.getString("PROB_BO_CNTRY_#");
					String pri = rs.getString("PROB_CUR_SEV_CD");
					//String COMPONENT_ID = rs.getString("COMPONENT_ID");
					//String PRODUCT_ID = rs.getString("PRODUCT_ID");
					Timestamp PMR_OPEN_DT = rs.getTimestamp("PMR_OPEN_DT");
					Timestamp PROB_CLOSED_DT = rs.getTimestamp("PROB_CLOSED_DT");
					String category = rs.getString("category");
					String subcategory = rs.getString("subcategory");
					String mycomment = rs.getString("mycomment");
					String visible = rs.getString("visible");
					/*pmrMap.put(PMRDimention.PROB_, pmrid);
					pmrMap.put(PMRDimention.PROB_BO_, branch);
					pmrMap.put(PMRDimention.PROB_BO_CNTRY_, centry);*/
					
					pmrMap.put("pmrID", pmrid+","+branch+","+centry);
					//pmrMap.put(PMRDimention.COMPONENT_ID, COMPONENT_ID);
					//pmrMap.put(PMRDimention.PRODUCT_ID, PRODUCT_ID);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					pmrMap.put(PMRDimention.PMR_OPEN_DT, PMR_OPEN_DT==null?"":sdf.format( PMR_OPEN_DT ));
					pmrMap.put(PMRDimention.PROB_CLOSED_DT, PROB_CLOSED_DT==null?"":sdf.format( PROB_CLOSED_DT ));
					
					//System.out.println( sdf.format( PMR_OPEN_DT ) );
					//pmrMap.put(PMRDimention.PMR_OPEN_DT,  PMR_OPEN_DT );
					//pmrMap.put(PMRDimention.PROB_CLOSED_DT,  PROB_CLOSED_DT );
					pmrMap.put(PMRDimention.PROB_CUR_SEV_CD, pri);
					pmrMap.put("category", category);
					pmrMap.put("subcategory", subcategory);
					pmrMap.put("mycomment", mycomment);
					pmrMap.put("visible", visible);
					//pmrMap.put("text", "blah, blah, blah .....");
					
					long dur = 0;
					if( PROB_CLOSED_DT != null ){
						dur = PROB_CLOSED_DT.getTime() - PMR_OPEN_DT.getTime();
					}else{
						dur = (System.currentTimeMillis() - PMR_OPEN_DT.getTime());
					}
					
					int day = (int) (dur/( 1*24*60*60*1000 ));
					pmrMap.put("dur", new Integer(day) );
					pmrList.add(pmrMap);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return pmrList;
	}
	
	public ArrayList getDistinctCustID(){
		ArrayList all = new ArrayList();
		
		String sql = "SELECT DISTINCT PROB_CUST_ACCT_# FROM PMR_RETRIEVAL";
		
		Connection conn = db_.getConnection();
		
		ResultSet rs = null;
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		if (rs != null) {
			try {
				while (rs.next()) {
					all.add(rs.getString("PROB_CUST_ACCT_#"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return all;
	}
	
	public ArrayList getAllByCustomerName( String name){
		ArrayList pmrList = new ArrayList();
		ArrayList idList = CustomerNameDAO.getInstance().getAllCustomerID(name);
		if( idList==null || idList.size()<1 ) return pmrList;
		Customer cust = CustomerNameDAO.getInstance().getCustomer(name);
				
		String sql = "SELECT * FROM DB2INST3.PMR_RETRIEVAL a WHERE (a.PROB_CUST_ACCT_#='" + idList.get(0) + "' ";
		for( int i=1; i<idList.size(); i++ )
			sql += "or a.PROB_CUST_ACCT_#='" + idList.get(i) + "' ";
		
		sql += ")";
		
		sql += " and PMR_OPEN_DT>'" + cust.getStartDate() + "'";
		
		sql += " and pmr_open_dt<'" + cust.getStopDate() + "'";
		Util.log( sql );
		
		Connection conn = db_.getConnection();
		
		ResultSet rs = null;
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		if (rs != null) {
			try {
				while (rs.next()) {
					HashMap pmrMap = new HashMap();

					String pmrid = rs.getString("PROB_#");
					String branch = rs.getString("PROB_BO_#");
					String centry =  rs.getString("PROB_BO_CNTRY_#");
					String pri = rs.getString("PROB_CUR_SEV_CD");
					String custID = rs.getString("PROB_CUST_ACCT_#");
					Timestamp PMR_OPEN_DT = rs.getTimestamp("PMR_OPEN_DT");
					Timestamp PROB_CLOSED_DT = rs.getTimestamp("PROB_CLOSED_DT");
					
					String category = rs.getString("category");
					String subcategory = rs.getString("subcategory");
					String mycomment = rs.getString("mycomment");
					String visible = rs.getString("visible");
					
					pmrMap.put("pmrID", pmrid+","+branch+","+centry);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					pmrMap.put(PMRDimention.PMR_OPEN_DT, PMR_OPEN_DT==null?"":sdf.format( PMR_OPEN_DT ));
					pmrMap.put(PMRDimention.PROB_CLOSED_DT, PROB_CLOSED_DT==null?"":sdf.format( PROB_CLOSED_DT ));
					pmrMap.put(PMRDimention.PROB_CUR_SEV_CD, pri);
					pmrMap.put("id", custID);
					pmrMap.put("category", category);
					pmrMap.put("subcategory", subcategory);
					pmrMap.put("mycomment", mycomment);
					pmrMap.put("visible", visible);
					long dur = 0;
					if( PROB_CLOSED_DT != null ){
						dur = PROB_CLOSED_DT.getTime() - PMR_OPEN_DT.getTime();
					}else{
						dur = (System.currentTimeMillis() - PMR_OPEN_DT.getTime());
					}
					int day = (int) (dur/( 1*24*60*60*1000 ));
					pmrMap.put("dur", new Integer(day) );
					pmrList.add(pmrMap);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return pmrList;
	}
	
	public ArrayList queryByCustomerName( String name, int from, int to, String orderBy, boolean asc, boolean showVisible ){
		ArrayList idList = CustomerNameDAO.getInstance().getAllCustomerID(name);
		if( idList==null || idList.size()<1 ) return new ArrayList();
		
		Customer cust = CustomerNameDAO.getInstance().getCustomer(name);
		
		String sql = "SELECT * FROM (SELECT ";

		try {
			Class pd = Class.forName("com.ibm.cn.db2.mytable.cqdb.PMRDimention");
			Field[] fields = pd.getDeclaredFields();
			for (int i = 0; i < fields.length; i++) {
				sql += fields[i].getName();
				if( fields[i].getName().compareTo("PROB_")==0 ||
						fields[i].getName().compareTo("PROB_BO_")==0 ||
						fields[i].getName().compareTo("PROB_BO_CNTRY_")==0 ||
						fields[i].getName().compareTo("PROB_CUST_ACCT_")==0){
					sql += "#";
				}
				
				sql += ",";
			}
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		sql += "category,subcategory,mycomment,visible,";
		
		sql += "rownumber() ";

		if (orderBy != null || orderBy.trim().length() > 0) {
			String ascOrDesc = (asc) ? "asc" : "desc";
			sql += "over (order by " + orderBy + " " + ascOrDesc + ") ";
		}

		sql += "as rn from DB2INST3.PMR_RETRIEVAL WHERE (PROB_CUST_ACCT_# = '" + idList.get(0) + "' " + ((showVisible)?"and visible='1'":"");
		
		for( int i=1; i<idList.size();i++ ){
			sql += "or PROB_CUST_ACCT_# = '" + idList.get(i) + "' ";
		}
		
		sql +=")";
		
		sql += " and pmr_open_dt>'" + cust.getStartDate() + "'";
		
		sql += " and pmr_open_dt<'" + cust.getStopDate() + "'";
		
		sql += ") AS a1 WHERE a1.rn BETWEEN " + from + " AND " + to;

		Util.log(sql);

		Connection conn = db_.getConnection();
		
		ResultSet rs = null;
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		ArrayList pmrList = new ArrayList();
		if (rs != null) {
			try {
				while (rs.next()) {
					HashMap pmrMap = new HashMap();

					String pmrid = rs.getString("PROB_#");
					String branch = rs.getString("PROB_BO_#");
					String centry =  rs.getString("PROB_BO_CNTRY_#");
					String pri = rs.getString("PROB_CUR_SEV_CD");
					String custID = rs.getString("PROB_CUST_ACCT_#");
					//String COMPONENT_ID = rs.getString("COMPONENT_ID");
					//String PRODUCT_ID = rs.getString("PRODUCT_ID");
					Timestamp PMR_OPEN_DT = rs.getTimestamp("PMR_OPEN_DT");
					Timestamp PROB_CLOSED_DT = rs.getTimestamp("PROB_CLOSED_DT");
					
					String category = rs.getString("category");
					String subcategory = rs.getString("subcategory");
					String mycomment = rs.getString("mycomment");
					String visible = rs.getString("visible");
					String version = rs.getString("DB_VER");
					
					/*pmrMap.put(PMRDimention.PROB_, pmrid);
					pmrMap.put(PMRDimention.PROB_BO_, branch);
					pmrMap.put(PMRDimention.PROB_BO_CNTRY_, centry);*/
					
					pmrMap.put("pmrID", pmrid+","+branch+","+centry);
					pmrMap.put("pID", pmrid);
					pmrMap.put("pBranch", branch);
					pmrMap.put("pCentry", centry);
					String[] s = PMR_OPEN_DT.toString().split("-");
					//System.out.println( s[0].substring(2) + "/" + s[1] + "/" + s[2].substring(0,2) );
					pmrMap.put("data", "O" + s[0].substring(2) + "/" + s[1] + "/" + s[2].substring(0,2) );
					
					//pmrMap.put(PMRDimention.COMPONENT_ID, COMPONENT_ID);
					//pmrMap.put(PMRDimention.PRODUCT_ID, PRODUCT_ID);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					pmrMap.put(PMRDimention.PMR_OPEN_DT, PMR_OPEN_DT==null?"":sdf.format( PMR_OPEN_DT ));
					pmrMap.put(PMRDimention.PROB_CLOSED_DT, PROB_CLOSED_DT==null?"":sdf.format( PROB_CLOSED_DT ));
					
					//System.out.println( sdf.format( PMR_OPEN_DT ) );
					//pmrMap.put(PMRDimention.PMR_OPEN_DT,  PMR_OPEN_DT );
					//pmrMap.put(PMRDimention.PROB_CLOSED_DT,  PROB_CLOSED_DT );
					pmrMap.put(PMRDimention.PROB_CUR_SEV_CD, pri);
					
					//pmrMap.put("text", "blah, blah, blah .....");
					pmrMap.put("id", custID);
					
					pmrMap.put("category", category);
					pmrMap.put("subcategory", subcategory);
					pmrMap.put("mycomment", mycomment);
					pmrMap.put("visible", visible);
					pmrMap.put("db_ver", version);
					
					long dur = 0;
					if( PROB_CLOSED_DT != null ){
						dur = PROB_CLOSED_DT.getTime() - PMR_OPEN_DT.getTime();
					}else{
						dur = (System.currentTimeMillis() - PMR_OPEN_DT.getTime());
					}
					
					int day = (int) (dur/( 1*24*60*60*1000 ));
					pmrMap.put("dur", new Integer(day) );
					pmrList.add(pmrMap);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return pmrList;
	}
	
	public void updatePmrDAO( String pmrID, String column, String value ){
		if( pmrID == null || pmrID.length() != 13 )return;
		
		String[] id = pmrID.split(",");
		
		String sql = "update db2inst3.pmr_retrieval a set a." + column + "='" + value + "' where prob_#='" + 
				id[0] + "' and prob_bo_#='" + id[1] + "' and prob_bo_cntry_#='" + id[2] + "'";
		
		Util.log( sql );
		
		db_.updateSQL(sql);
	}
	
	public void selectAll(String[] pmrIDs, boolean v){
		String sql = "update db2inst3.pmr_retrieval a set a.visible='" + (v?"1":"0") + "' where ";
		for( int i=0; i<pmrIDs.length; i++ ){
			String[] id = pmrIDs[i].split(",");
			sql += "(prob_#='" + id[0] + "' and prob_bo_#='" + id[1] + "' and prob_bo_cntry_#='" + id[2] + "') ";
			if( i != pmrIDs.length-1 ) sql += "or";
		}
		Util.log(sql);
		db_.updateSQL(sql);
	}
	
	public void updateSql(String sql){
		db_.updateSQL(sql);
	}
}
