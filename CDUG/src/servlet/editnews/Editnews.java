package servlet.editnews;

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

public class Editnews extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Editnews() {
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
			String useraccess = request.getParameter("useraccess");	
			String id = request.getParameter("id");
			String tag = request.getParameter("tag");
			String a_name = request.getParameter("a_name");
			String username = new String("");
			StringTranslator stringtrans = new StringTranslator();
			title = stringtrans.convertToHtmlString(title);
			text = stringtrans.convertToHtmlString(text);
			title_before = stringtrans.convertToSqlString(title_before);
			text_before = stringtrans.convertToSqlString(text_before);
			DAO dbctr = new DAO();
			String strSql = "select username from cdug_release_all where id ="+id+";";
			ResultSet rs = dbctr.getResultSet(strSql);
			try{
			if(rs.next()){
				username = rs.getString("username");
				//System.out.println(username+"!!"+a_name);
			}
			}catch (SQLException sqle) {
			}
			//System.out.println(username+"!!"+a_name);
			if(!((useraccess.equals("2"))||a_name.equals(username))){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
			}
			else{
				String strSql2 = "update cdug_release_all set title='"+title+"',text='"+text+"',title_text='"+title_before+"',text_text='"+text_before+"' where id ="+id+";";
				boolean flag = false; 
				flag = dbctr.ResultUpdate(strSql2);
				if(flag){
					if(tag.equals("news")){
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2news/news.jsp?id="+id+"';alert('新闻编辑成功！');\"></body>");	
					}
					else if(tag.equals("events")){
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/CDUGEvent/news.jsp?id="+id+"';alert('事件编辑成功！');\"></body>");	
					}
					else{
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('内部错误！');\"></body>");	
					}
				}
				else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('编辑失败！');\"></body>");
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
	}

}
