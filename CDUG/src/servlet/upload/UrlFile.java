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

import utility.StringTranslator;

import Bean.User;
import DAO.DAO;
import java.util.*;



public class UrlFile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	String date = new String();

	public UrlFile() {
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
		fileDes = request.getParameter("fileintro");
		String tag = new String();
		tag = request.getParameter("tag");
		String userip = new String();
		userip = request.getRemoteAddr();
		String url = new String();
		url = request.getParameter("url");
		String fileName = new String();
		fileName = url.substring(url.toUpperCase().lastIndexOf("/")+1);
		StringTranslator stringtrans = new StringTranslator();
		fileDes = stringtrans.convertToHtmlString_Simple(fileDes);
		username = stringtrans.convertToSqlString(username);
		tag = stringtrans.convertToSqlString(tag);
		url = stringtrans.convertToSqlString(url);
		if(!(useraccess.equals("1")||useraccess.equals("2"))){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else{
			String fileName_db = new String();
			fileName_db = stringtrans.convertToSqlString(fileName);//存往数据库的文件名
			DAO dbctr = new DAO();
			String strSql = "insert into cdug_upload_file (filedes,username,userip,date,filename,tag,url) values ('"+fileDes+"','"+username+"','"+userip+"','"+date+"','"+fileName_db+"','"+tag+"','"+url+"');";
			boolean flag = false; 
			flag = dbctr.ResultUpdate(strSql);
			if(flag){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('文件上传成功！');\"></body>");	
			}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2Resource/DB2Resource.jsp';alert('文件上传失败！');\"></body>");				
			}
			dbctr.close();
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
	}

}
