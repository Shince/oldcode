package utility;

import java.sql.SQLException;
import java.util.*;

import sun.management.counter.Counter;

import DAO.DAO;

public class TagTool {
	//Tag总集;
	public static String TagSum(String sqlstr , String colname){
		DAO dbctr = new DAO();
		String tagSum = new String("");
		java.sql.ResultSet rs_tag = dbctr.getResultSet(sqlstr);
		try{
		while(rs_tag.next()){
			tagSum += rs_tag.getString(colname).toUpperCase();
		}
		}
		catch(SQLException ex){
			System.out.println("SQLException: " + ex.getMessage());
		}
		return tagSum;
	}
	//没有排序的tagmap key为tag名 value为次数；
	public static Map TagCount(String result){
		Map h_tag = new HashMap<String,Integer>();
		int index;
		for(index=result.indexOf(" ");index!=-1;index=result.indexOf(" ")){
			if(!h_tag.containsKey(result.substring(0, index))){
				h_tag.put(result.substring(0, index), 1);
			}
			else{
				Integer tag_value = ((Integer)h_tag.get(result.substring(0, index))).intValue()+1;
				h_tag.put(result.substring(0, index), tag_value);
			}
			result = result.substring(index+1);
		}
		return h_tag;
	}
	//排序了的tagmap；
	public static Map TagForSortCount(String result){
		Map h_tag = new HashMap<String,Integer>();
		int index;
		Random rand = new Random();
		int temp = 0;
		for(index=result.indexOf(" ");index!=-1;index=result.indexOf(" ")){
			if(!h_tag.containsKey(result.substring(0, index))){
				h_tag.put(result.substring(0, index), 1);
			}
			else{
				Integer tag_value = ((Integer)h_tag.get(result.substring(0, index))).intValue()+1;
				h_tag.put(result.substring(0, index), tag_value);
			}
			result = result.substring(index+1);
		}
		TreeMap sortMap = new TreeMap(Collections.reverseOrder());
		//sortMap.putAll(h_sort_tag);
		Iterator it=h_tag.entrySet().iterator();
		   while(it.hasNext())
		   {
			   Map.Entry entry=(Map.Entry)it.next();
			   String key=(String)entry.getKey();
			   int value=(Integer)entry.getValue();
			   int new_key = value*10000 + rand.nextInt(1000);
			   String new_value = key;
			   sortMap.put(new_key, new_value);
		   }
		return sortMap;
	}
	
	public static void main(String args[]) {
		String result =  TagSum("select * from cdug_upload_file","tag");
		//TagCount(result);
		System.out.println(TagForSortCount(result));
	}
			
	}
