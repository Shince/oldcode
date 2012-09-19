package com.ibm.cn.db2.mytable.persist.excel;

import java.io.FileOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		String outputfile= "C:/test.xls"; 
		
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			
			HSSFSheet sheet = workbook.createSheet();

			workbook.setSheetName(0, "sheet �� name", HSSFWorkbook.ENCODING_UTF_16);

			HSSFRow row = sheet.createRow((short) 0);

			HSSFCell cell = row.createCell((short) 0);
			cell.setEncoding( HSSFCell.ENCODING_UTF_16 );
			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue("����ֵ");
			
			FileOutputStream fout = new FileOutputStream(outputfile);
			workbook.write(fout);
			fout.flush();
			fout.close();
			
			System.out.println("�ļ�����...");
		} catch (Exception e) {
			System.out.println("������ xlcreate() : " + e);
		}
	}

}
