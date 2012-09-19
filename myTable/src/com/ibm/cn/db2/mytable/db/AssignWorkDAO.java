package com.ibm.cn.db2.mytable.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ibm.cn.db2.mytable.bean.Worker;

public class AssignWorkDAO {
	private static AssignWorkDAO instance_;
	private ContainerDBHandler db_;
	
	private AssignWorkDAO(){
		db_ = ContainerDBHandler.getInstance();
	}
	
	public static synchronized AssignWorkDAO getInstance(){
		if( instance_ == null )instance_ = new AssignWorkDAO();
		return instance_;
	}
	
	public ArrayList getWorkers( String custName ){
		ArrayList all = new ArrayList();
		
		String sql = "select aw.name worker_name, aw.id awID, cn.name custName from db2inst3.assign_work aw, db2inst3.customername cn where cn.id=aw.cust_id and cn.name='" + custName + "'";
		
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
					w.setId( rs.getInt("awID") );
					w.setName( rs.getString("worker_name") );
					w.setCustName( rs.getString("custName") );
					all.add( w );					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return all;
	}
	
	public void addWorker(String name, String custName){
		String sql = "insert into db2inst3.assign_work( name, cust_id ) values('" + name 
			+ "', (select cn.id from db2inst3.customername cn where cn.name='" + custName + "'))";
		db_.updateSQL(sql);
	}
	
	public void delWorker(int id){
		String sql = "delete from db2inst3.assign_work aw where aw.id=" + id;
		db_.updateSQL(sql);
	}
}
