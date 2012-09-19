package com.ibm.cn.db2.mytable.persist.excel;

import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import com.ibm.cn.db2.mytable.db.NativePmrDAO;

public class ArrayListToExcel {

	public static void arrayListToExcel( ArrayList al, String file ){
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			
			HSSFSheet sheet = workbook.createSheet();

			workbook.setSheetName(0, "oh~ sheet~!!!", HSSFWorkbook.ENCODING_UTF_16);

			Set keys = ((HashMap)al.get(0)).keySet();
			Iterator keyIter = keys.iterator();
			int k=0;
			while( keyIter.hasNext() ){
				String key = (String)keyIter.next();
				HSSFCell cell = sheet.createRow((short)0).createCell((short) k);
				cell.setEncoding( HSSFCell.ENCODING_UTF_16 );
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell.setCellValue( key );
				k++;
			}
			
			for( int i=0; i<al.size(); i++ ){
				HSSFRow row = sheet.createRow((short) (i+1));
				
				HashMap map = (HashMap)al.get(i);
				
				int j=0;
				//Set keys = map.keySet();
				keyIter = keys.iterator();
				while( keyIter.hasNext() ){
					String key = (String)keyIter.next();
					Object value =  map.get(key);
					
					HSSFCell cell = row.createCell((short) j);
					cell.setEncoding( HSSFCell.ENCODING_UTF_16 );
					
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					if( value instanceof String ){
						cell.setCellValue( value.toString() );
					} else if ( value instanceof Timestamp ){
						cell.setCellValue( value.toString() );
					}
					
					j++;
				}
			}

			FileOutputStream fout = new FileOutputStream(file);
			workbook.write(fout);
			fout.flush();
			fout.close();
			
			System.out.println("文件生成...");
		} catch (Exception e) {
			System.out.println("已运行 xlcreate() : " + e);
		}
	}
	
	public static void main(String[] args) {
		ArrayList al = NativePmrDAO.getInstance().getAllList( "7777777" );
		ArrayListToExcel.arrayListToExcel(al, "c:/111.xls");
	}

}
