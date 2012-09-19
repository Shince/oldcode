package servlet.upload;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DefaultFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import utility.StringCut;
import utility.StringTranslator;

import Bean.User;
import DAO.DAO;
import java.util.*;



public class Upload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	File tmpSourceDir = null;//��ʼ���ϴ��ļ�����ʱ���Ŀ¼
	File SourceDir = null;//��ʼ���ϴ��ļ���ı���Ŀ¼
	String date = new String();
	
	public Upload() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String username = new String();
		username = request.getParameter("username");
		String useraccess = new String();
		useraccess = request.getParameter("useraccess");
		String fileDes = new String();
		fileDes = request.getParameter("fileDes");
		String tag = new String();
		tag = request.getParameter("tag");
		String userip = new String();
		userip = request.getRemoteAddr();
		String fname = new String();
		fname = request.getParameter("fname");
		StringTranslator stringtrans = new StringTranslator();
		fileDes = stringtrans.convertToHtmlString_Simple(fileDes);
		username = stringtrans.convertToSqlString(username);
		tag = stringtrans.convertToSqlString(tag);
		StringCut strcut = new StringCut();
		tag = strcut.stringshuffle(tag);
		long sizeInBytes = 0;
		//Date date = new Date();	
		//response.getWriter().println(useraccess+"!"+userip+"!"+username+"!"+fileDes+"!"+date);
		if(!(useraccess.equals("1")||useraccess.equals("2"))){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('���ӳ�ʱ,�����µ��룡');\"></body>");
		}
		else{
		try{
			/*�ж��Ƿ�����ȫһ����FILE(����);
			 * ʹ�ñ�����������(����);
			 * 
			 * 
			 * 
			 * 
			 */

			if(ServletFileUpload.isMultipartContent(request)){
			DiskFileItemFactory dff = new DiskFileItemFactory();//�����ö���
			dff.setRepository(tmpSourceDir);//ָ���ϴ��ļ�����ʱĿ¼
			dff.setSizeThreshold(1048576);//ָ�����ڴ��л������ݴ�С,��λΪbyte
			ServletFileUpload sfu = new ServletFileUpload(dff);//�����ö���
			sfu.setFileSizeMax(52428800);//ָ�������ϴ��ļ������ߴ�
			FileItemIterator fii = sfu.getItemIterator(request);//����request ����,������FileItemIterator����	
			//List items = sfu.parseRequest(request);
			while(fii.hasNext()){
			FileItemStream fis = fii.next();//�Ӽ����л��һ���ļ���
			if(!fis.isFormField() && fis.getName().length()>0){//���˵����з��ļ���
			String fileName = new String();
			if(fname.lastIndexOf("\\")==-1){
				fileName = fname;
			}
			else{
				fileName = fname.substring(fname.lastIndexOf("\\")+1);//����ϴ��ļ����ļ���
			}
			String fileName_db = new String();
			fileName_db = stringtrans.convertToSqlString(fileName);//�������ݿ���ļ���
			DAO dbctr = new DAO();
			String strSql = "insert into cdug_upload_file (filedes,username,userip,date,filename,tag,url) values ('"+fileDes+"','"+username+"','"+userip+"','"+date+"','"+fileName_db+"','"+tag+"','');";
			String strSql1 = "select * from cdug_upload_file where filename = '"+fileName_db+"';";
			int row = dbctr.getTableRowCount("cdug_upload_file", strSql1);
			if(row>=1){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('�ϴ��ļ����Ѵ���,�����������ļ���');\"></body>");	
			}
			else{
			BufferedInputStream in = new BufferedInputStream(fis.openStream());//����ļ�������
			BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(SourceDir+"\\"+fileName)));//����ļ������
			Streams.copy(in, out, true);
			boolean flag = false; 
			flag = dbctr.ResultUpdate(strSql);
			if(flag){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('�ļ��ϴ��ɹ���');\"></body>");	
			}
			/*
			 * ǰ̨���ƿͻ��ϴ��ļ��Ĵ�С(δ���);
			*/
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('�ļ��ϴ�ʧ�ܣ�');\"></body>");				
			}
			dbctr.close();
			}
			}
			}
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('�ļ��ϴ�ʧ��1��');\"></body>");
			}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('�ļ��ϴ�ʧ�ܣ�');\"></body>");
			}
			}catch(Exception e){
			e.printStackTrace();
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('������ļ���ַ���ļ��ϴ�ʧ�ܣ�');\"></body>");
			}
		}
		}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		super.init();
		int year;
		int month;
		int day;
		GregorianCalendar calendar = new GregorianCalendar();
		year = calendar.get(calendar.YEAR);
		month = calendar.get(calendar.MONTH) + 1;
		day = calendar.get(calendar.DAY_OF_MONTH);
		date = year+"-"+month+"-"+day;
		String tmpPath = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\source\\Upload\\temp";
		String savePath = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\source\\Upload\\"+date;
		tmpSourceDir = new File(tmpPath);
		SourceDir = new File(savePath);
		if(!tmpSourceDir.isDirectory())
		tmpSourceDir.mkdir();
		if(!SourceDir.isDirectory())
			SourceDir.mkdir();
	}

}
