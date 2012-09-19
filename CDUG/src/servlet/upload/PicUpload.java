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

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import DAO.DAO;

import java.util.*;
import utility.StringTranslator;

public class PicUpload extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	File tmpSourceDir = null;//��ʼ���ϴ��ļ�����ʱ���Ŀ¼
	File SourceDir = null;//��ʼ���ϴ��ļ���ı���Ŀ¼
	String date = new String();
	public PicUpload() {
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
			StringTranslator stringtrans = new StringTranslator();
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			String title = request.getParameter("title");
			String text = request.getParameter("text");
			String userip = request.getRemoteAddr();
			String username = request.getParameter("username");
			String useraccess = request.getParameter("useraccess");
			String fname = request.getParameter("fname");
			String fileName = new String();
			if(fname.lastIndexOf("\\")==-1){
				fileName = fname;
			}
			else{
				fileName = fname.substring(fname.lastIndexOf("\\")+1);//����ϴ��ļ����ļ���
			}
			//String fileName = fname.substring(fname.lastIndexOf("\\")+1);
			String fileName_db = new String();
			fileName_db = stringtrans.convertToSqlString(fileName);//�������ݿ���ļ���
			if(!(useraccess.equals("1")||useraccess.equals("2"))){
				response.getWriter().println("<head></head><body onload=\"javascript:window.close();alert('���ӳ�ʱ,�����µ��룡');\"></body>");
			}
			else
			{
				if(!fname.equals("")){
				try{
					if(ServletFileUpload.isMultipartContent(request)){
					DiskFileItemFactory dff = new DiskFileItemFactory();//�����ö���
					dff.setRepository(tmpSourceDir);//ָ���ϴ��ļ�����ʱĿ¼
					dff.setSizeThreshold(1048576);//ָ�����ڴ��л������ݴ�С,��λΪbyte
					ServletFileUpload sfu = new ServletFileUpload(dff);//�����ö���
					sfu.setFileSizeMax(52428800);//ָ�������ϴ��ļ������ߴ�
					FileItemIterator fii = sfu.getItemIterator(request);//����request ����,������FileItemIterator����	
					while(fii.hasNext()){
					FileItemStream fis = fii.next();//�Ӽ����л��һ���ļ���
					if(!fis.isFormField() && fis.getName().length()>0){//���˵����з��ļ���
					DAO dbctr = new DAO();
					String strSql2 = "insert into cdug_upload_pic (date,picname) values ('"+date+"','"+fileName_db+"');";
					String strSql1 = "select * from cdug_upload_pic where picname = '"+fileName_db+"' and date = '"+date+"';";
					int row = dbctr.getTableRowCount("cdug_upload_pic", strSql1);
					if(row>=1){
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/upload.jsp';alert('�ϴ��������Ѵ���,����������������');\"></body>");	
					}
					else{
					BufferedInputStream in = new BufferedInputStream(fis.openStream());//����ļ�������
					BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(SourceDir+"\\"+fileName)));//����ļ������
					Streams.copy(in, out, true);
					boolean flag = false; 
					flag = dbctr.ResultUpdate(strSql2);
					if(flag){
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/upload.jsp';window.open('/CDUG/jsp/backRelease/picUpload.jsp?fileName="+fileName+"&date="+date+"','picUpload','height=220,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');\"></body>");				
					}
					else{
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/upload.jsp';alert('�����ϴ�ʧ�ܣ�');\"></body>");				
					}
					dbctr.close();
					}
					}
					}
					response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/upload.jsp';alert('�����ϴ�ʧ��');\"></body>");
					}
					else{
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/upload.jsp';alert('����ĸ�����ַ��');\"></body>");
					}
					}catch(Exception e){
					e.printStackTrace();
					response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/upload.jsp';alert('����ĸ�����ַ��');\"></body>");
					}
				}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/upload.jsp';alert('����ĸ�����ַ��');\"></body>");
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
		String tmpPath = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\source\\Release\\temp";
		String savePath = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\source\\Release\\"+date;
		tmpSourceDir = new File(tmpPath);
		SourceDir = new File(savePath);
		if(!tmpSourceDir.isDirectory())
		tmpSourceDir.mkdir();
		if(!SourceDir.isDirectory())
			SourceDir.mkdir();
	}

}
