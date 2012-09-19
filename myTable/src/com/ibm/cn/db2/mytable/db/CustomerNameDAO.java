package com.ibm.cn.db2.mytable.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import com.ibm.cn.db2.mytable.bean.Customer;
import com.ibm.cn.db2.mytable.bean.Worker;

public class CustomerNameDAO {

	private static CustomerNameDAO instance_;
	private ContainerDBHandler db_;

	private CustomerNameDAO() {
		db_ = ContainerDBHandler.getInstance();
	}

	public static CustomerNameDAO getInstance() {
		if (instance_ == null) {
			instance_ = new CustomerNameDAO();
		}
		return instance_;
	}

	public ArrayList getAllCustomerName() {
		ArrayList all = new ArrayList();

		String sql = "select * from DB2INST3.CUSTOMERNAME";
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
					Customer c = new Customer();
					c.setName(rs.getString("NAME"));
					all.add(c);
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

		return all;
	}
	
	public ArrayList getAllWorker( String custName ){
		ArrayList all = new ArrayList();
		String sql = "select aw.id, aw.name, cn.name custName from db2inst3.assign_work aw, db2inst3.customername cn where aw.cust_id=cn.id and cn.name='" + custName + "'";
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
					Worker w = new Worker();
					w.setId( rs.getInt("id") );
					w.setName( rs.getString("name") );
					w.setCustName(rs.getString("custName"));
					all.add(w);
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
		return all;
	}

	public ArrayList getAllCustomerID(String name) {
		ArrayList all = new ArrayList();

		String sql = "select * from DB2INST3.CUSTOMERNAME as a, DB2INST3.CUSTOMERID as b where "
				+ "a.id=b.CUSTOMERNAME_ID and a.NAME='" + name + "'";
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
					all.add(rs.getString("CUSTOMER_ID"));
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

	public void addID( String name, String id ){
		String sql = "INSERT INTO DB2INST3.CUSTOMERID(CUSTOMERNAME_ID, CUSTOMER_ID) SELECT DISTINCT b.id, '" + id + 
		"' FROM DB2INST3.CUSTOMERNAME AS b WHERE b.NAME='" + name +"'";
		System.out.println( sql );
		db_.updateSQL(sql);
	}
	
	public void addName( String name, String startTime, String stopTime ){
		if( startTime == null || startTime.length()==0 ){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = new GregorianCalendar( 2000, 1, 1);
			startTime = sdf.format(c.getTime());
		}
		if( stopTime == null || stopTime.length()==0 ){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = new GregorianCalendar( );
			c.setTimeInMillis( System.currentTimeMillis() );
			stopTime = sdf.format(c.getTime());
		}
		if( startTime.length() <= 10 ) startTime+= " 00:00:00";
		if( stopTime.length() <= 10 ) stopTime+= " 00:00:00";
		String sql = "INSERT INTO DB2INST3.CUSTOMERNAME(NAME,STARTTIME,STOPTIME) VALUES('" + name + "','" + startTime + "','" + stopTime + "')";
		System.out.println( sql );
		db_.updateSQL(sql);
	}
	
	public Customer getCustomer( String name ){
		Customer cust = new Customer();
		
		String sql = "select * from DB2INST3.CUSTOMERNAME where NAME='" + name +"'";
		
		Connection conn = db_.getConnection();
		
		ResultSet rs = null;
		try {
			Statement st = conn.createStatement();
			rs = st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int count = 0;
		if (rs != null) {
			try {
				while (rs.next()) {
					count ++;
					cust.setName(rs.getString("NAME"));
					cust.setComment(rs.getString("COMMENT"));
					cust.setStartDate( (rs.getTimestamp("STARTTIME")==null)?"":sdf.format( rs.getTimestamp("STARTTIME")) + " 00:00:00");
					cust.setStopDate((rs.getTimestamp("STOPTIME")==null)?"":sdf.format( rs.getTimestamp("STOPTIME")) + " 00:00:00" );
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
		
		if( count > 1 )System.out.println( "Warnning:duplicate customer info in db" );
		
		return cust;
	}
	
	public void updateCustomer( String name, String startTime, String stopTime, String[] idList ){
		if( startTime == null || startTime.length()==0 ){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = new GregorianCalendar( 2000, 1, 1);
			startTime = sdf.format(c.getTime());
		}
		if( stopTime == null || stopTime.length()==0 ){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = new GregorianCalendar( );
			c.setTimeInMillis( System.currentTimeMillis() );
			stopTime = sdf.format(c.getTime());
		}
		
		if( startTime.length() <= 10 ) startTime+= " 00:00:00";
		if( stopTime.length() <= 10 ) stopTime+= " 00:00:00";
		String sql = "update DB2INST3.CUSTOMERNAME as a set a.starttime='" + startTime + "', a.stoptime='" + stopTime + "' where a.name='" + name + "'";
		
		String sql2 = "delete from db2inst3.customerid where customername_id in (select id from db2inst3.customername a where a.name='" + name +"')";
		
		System.out.println( sql );
		db_.updateSQL(sql);
		
		System.out.println( sql2 );
		db_.updateSQL(sql2);
		
		if( idList != null )
		for( int i=0; i<idList.length; i++ ){
			CustomerNameDAO.getInstance().addID(name, idList[i]);
		}
	}
	
	public boolean isNameExist(String name){
		String sql = "select count(*) as count from DB2INST3.CUSTOMERNAME where name='" + name + "'";
		
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
		
		if( count == 1) return true;
		return false;
	}
	
	public void delCust( String name ){
		String sql = "delete from db2inst3.customername a where a.name='" + name + "'";
		System.out.println( sql );
		db_.updateSQL(sql);
	}
}
