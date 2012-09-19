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
	File tmpSourceDir = null;//初始化上传文件的临时存放目录
	File SourceDir = null;//初始化上传文件后的保存目录
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
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else{
		try{
			/*判断是否有完全一样的FILE(后期);
			 * 使用本地搜索工具(后期);
			 * 
			 * 
			 * 
			 * 
			 */

			if(ServletFileUpload.isMultipartContent(request)){
			DiskFileItemFactory dff = new DiskFileItemFactory();//创建该对象
			dff.setRepository(tmpSourceDir);//指定上传文件的临时目录
			dff.setSizeThreshold(1048576);//指定在内存中缓存数据大小,单位为byte
			ServletFileUpload sfu = new ServletFileUpload(dff);//创建该对象
			sfu.setFileSizeMax(52428800);//指定单个上传文件的最大尺寸
			FileItemIterator fii = sfu.getItemIterator(request);//解析request 请求,并返回FileItemIterator集合	
			//List items = sfu.parseRequest(request);
			while(fii.hasNext()){
			FileItemStream fis = fii.next();//从集合中获得一个文件流
			if(!fis.isFormField() && fis.getName().length()>0){//过滤掉表单中非文件域
			String fileName = new String();
			if(fname.lastIndexOf("\\")==-1){
				fileName = fname;
			}
			else{
				fileName = fname.substring(fname.lastIndexOf("\\")+1);//获得上传文件的文件名
			}
			String fileName_db = new String();
			fileName_db = stringtrans.convertToSqlString(fileName);//存往数据库的文件名
			DAO dbctr = new DAO();
			String strSql = "insert into cdug_upload_file (filedes,username,userip,date,filename,tag,url) values ('"+fileDes+"','"+username+"','"+userip+"','"+date+"','"+fileName_db+"','"+tag+"','');";
			String strSql1 = "select * from cdug_upload_file where filename = '"+fileName_db+"';";
			int row = dbctr.getTableRowCount("cdug_upload_file", strSql1);
			if(row>=1){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('上传文件名已存在,请重新命名文件！');\"></body>");	
			}
			else{
			BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流
			BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(SourceDir+"\\"+fileName)));//获得文件输出流
			Streams.copy(in, out, true);
			boolean flag = false; 
			flag = dbctr.ResultUpdate(strSql);
			if(flag){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('文件上传成功！');\"></body>");	
			}
			/*
			 * 前台控制客户上传文件的大小(未解决);
			*/
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('文件上传失败！');\"></body>");				
			}
			dbctr.close();
			}
			}
			}
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('文件上传失败1！');\"></body>");
			}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('文件上传失败！');\"></body>");
			}
			}catch(Exception e){
			e.printStackTrace();
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('错误的文件地址，文件上传失败！');\"></body>");
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
