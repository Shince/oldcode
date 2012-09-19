/*
 * 创建日期 Mar 18, 2008
 *
 * 更改所生成文件模板为
 * 窗口 > 首选项 > Java > 代码生成 > 代码和注释
 */
package servlet.manage;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAO;

public class DeleteCommentsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteCommentsServlet() {
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
		String useraccess = request.getParameter("useraccess");
		if(!(useraccess.equals("2"))){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else{	
			String[] id = request.getParameterValues("check");
			
		DAO dbctr = new DAO();
		for(int i=0;i<id.length;i++)
		{
		String strSql = "delete from cdug_release_comments where id = '"+id[i]+"'";

	
	
			boolean flag = false; 
			flag = dbctr.ResultUpdate(strSql);
			if(flag){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/CommentsManagement.jsp';alert('删除成功！');\"></body>");
			}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/CommentsManagement.jsp';alert('删除失败！');\"></body>");
			}
		
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
	}

}