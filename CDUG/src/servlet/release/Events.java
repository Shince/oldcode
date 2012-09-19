package servlet.release;

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
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import Bean.User;
import DAO.DAO;
import java.util.*;

import utility.StringTranslator;

public class Events extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	String date = new String();
	public Events() {
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
			String title = request.getParameter("title");
			String text = request.getParameter("text");
			String title_before = request.getParameter("title");
			String text_before = request.getParameter("text");
			String userip = request.getRemoteAddr();
			String username = request.getParameter("username");
			String useraccess = request.getParameter("useraccess");			
			StringTranslator stringtrans = new StringTranslator();
			title = stringtrans.convertToHtmlString_Simple(title);
			text = stringtrans.convertToHtmlString(text);
			title_before = stringtrans.convertToSqlString(title_before);
			text_before = stringtrans.convertToSqlString(text_before);
			username = stringtrans.convertToSqlString(username);
			if(!(useraccess.equals("1")||useraccess.equals("2"))){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('���ӳ�ʱ,�����µ��룡');\"></body>");
			}
			else{
				String strSql2 = "insert into cdug_release_all (title,text,userip,date,tag,username,title_text,text_text) values ('"+title+"','"+text+"','"+userip+"','"+date+"','events','"+username+"','"+title_before+"','"+text_before+"');";
				boolean flag = false; 
				DAO dbctr = new DAO();
				flag = dbctr.ResultUpdate(strSql2);
				if(flag){
					response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/eventsnewsbackRelease.jsp';alert('�¼������ɹ���');\"></body>");	
				}
				else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/backRelease/eventsnewsbackRelease.jsp';alert('�¼�����ʧ�ܣ�');\"></body>");
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
