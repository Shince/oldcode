package com.ibm.cn.db2.mytable.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.ibm.cn.db2.mytable.db.CategoryDAO;

public class Util {
	
	private static Logger logger = Logger.getLogger(Util.class.getName());

	public static String genCategory(HashMap cust, TreeMap categories){
		StringBuffer sb = new StringBuffer();
		
		sb.append("<select name=\"prob_category_" + cust.get("pmrID") + "\" onchange=\"updatePMR('" + cust.get("pmrID") + "','category',this.value);\" >" );
		
		//TreeMap categories = CategoryDAO.getInstance().getMainCategory();
		Set keys = categories.keySet();
		Iterator iter = keys.iterator();
		while( iter.hasNext() ){
			String id = (String)iter.next();
			String name = (String)categories.get(id);
			sb.append( "<option value=\"" + name + "\" " );
			sb.append( (name.compareTo(cust.get("category"))==0)?"selected":"" );
			sb.append( " >" );
			sb.append( name );
			sb.append( "</option>" );
		}
		
		sb.append("</select>");
		
		//System.out.println( sb.toString() );
		return sb.toString();
	}
	
	public static String genSubCategory( HashMap cust/*, TreeMap subCategories*/ ){
		StringBuffer sb = new StringBuffer();
		
		sb.append("<select name=\"prob_category_" + cust.get("pmrID") + "\" onchange=\"updatePMR('" + cust.get("pmrID") + "','subcategory',this.value);\" >"  );
		
		TreeMap subCategories = CategoryDAO.getInstance().getSubCategory( (String)cust.get("category") );
		Set keys = subCategories.keySet();
		Iterator iter = keys.iterator();
		while( iter.hasNext() ){
			String id = (String)iter.next();
			String name = (String)subCategories.get(id);
			sb.append( "<option value=\"" + name + "\" " );
			sb.append( (name.compareTo(cust.get("subcategory"))==0)?"selected":"" );
			sb.append( " >" );
			sb.append( name );
			sb.append( "</option>" );
		}
		
		sb.append("</select>");
		
		//System.out.println( sb.toString() );
		return sb.toString();
	}
	
	public static void log(String s) {
		logger.info(s);
	}
	
	public static void log(String s, HttpServletRequest request) {
		logger.info("Action: " + s + "(" + request.getRequestURL() + ")" + "<--" + request.getRemoteAddr() + " by " + request.getRemoteUser());
	}
	
}
