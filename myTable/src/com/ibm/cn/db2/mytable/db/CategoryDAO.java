package com.ibm.cn.db2.mytable.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TreeMap;

public class CategoryDAO {
	private static CategoryDAO instance_;
	private ContainerDBHandler db_;
	
	private CategoryDAO(){
		db_ = ContainerDBHandler.getInstance();
	}
	
	public static synchronized CategoryDAO getInstance(){
		if( instance_ == null )instance_ = new CategoryDAO();
		return instance_;
	}
	
	public TreeMap getMainCategory(){
		TreeMap map = new TreeMap();
		
		String sql = "select * from db2inst3.category c order by c.id asc";
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
					String name = rs.getString("category_name");
					int id = rs.getInt("id");
					if( name != null || name.trim().length() > 0 )
						map.put(String.valueOf(id), name);
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
		
		return map;
	}
	
	public TreeMap getSubCategory( int mainId ){
		TreeMap map = new TreeMap();
		
		String sql = "select * from db2inst3.subcategory s where s.category_id=" + mainId + " order by s.id";
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
					String name = rs.getString("subcategory_name");
					int id = rs.getInt("id");
					if( name != null || name.trim().length() > 0 )
						map.put(String.valueOf(id), name);
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
		
		return map;
	}
	
	public TreeMap getSubCategory( String mainName ){
		TreeMap map = new TreeMap();
		
		String sql = "select * from db2inst3.subcategory s where s.category_id in (select id from db2inst3.category c where c.category_name='" + mainName + "')";
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
					String name = rs.getString("subcategory_name");
					int id = rs.getInt("id");
					if( name != null || name.trim().length() > 0 )
						map.put(String.valueOf(id), name);
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
		
		return map;
	}
	
	public void addCategory( String name ){
		String sql = "insert into db2inst3.category(category_name) values('" + name + "')";
		//System.out.println( sql );
		db_.updateSQL(sql);
	}
	
	public void addSubCategory( int id, String name ){
		String sql = "insert into db2inst3.subcategory(category_id,subcategory_name) values(" + id + ",'" + name + "')";
		//System.out.println( sql );
		db_.updateSQL(sql);
	}
	
	public void delCategory( int id ){
		String sql = "delete from db2inst3.category c where c.id=" + id;
		//System.out.println( sql );
		db_.updateSQL(sql);
	}
	
	public void delSubCategory( int id ){
		String sql = "delete from db2inst3.subcategory s where s.id=" + id;
		//System.out.println( sql );
		db_.updateSQL(sql);
	}
	
	public void updateCategory( int id, String name ){
		String sql = "update db2inst3.category c set c.category_name='" + name + "' where c.id=" + id;
		//System.out.println( sql );
		db_.updateSQL(sql);
	}
	
	public void updateSubCategory( int id, String name ){
		String sql = "update db2inst3.subcategory s set s.subcategory_name='" + name + "' where s.id=" + id;
		//System.out.println( sql );
		db_.updateSQL(sql);
	}
}
