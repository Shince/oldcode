package servlet.comments;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.User;
import DAO.DAO;
import MD5.MD5;
import java.util.*;
import java.io.File;

public class DeleteComments extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteComments() {
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
		String newsid = request.getParameter("newsid");
		String tag = request.getParameter("tag");
		String floder = tag.equals("news")?"DB2news":"CDUGEvent";
		String[] commentsid = request.getParameterValues("check");
		int n = 0;
		if(!(useraccess.equals("2"))){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else{
		if(commentsid==null){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/"+floder+"/news.jsp?id="+newsid+"';alert('至少选择一个评论！');\"></body>");
		}
		else{
			while(n!=commentsid.length)	
			{
				DAO dbctr = new DAO();
				String strSql = "delete from cdug_release_comments where id = '"+commentsid[n]+"';";
				String strSql1 = "select * from cdug_release_comments where id = '"+commentsid[n]+"';";
				ResultSet rs = dbctr.getResultSet(strSql1);
				try {
					if (rs.next()) {
						boolean flag = false;
						flag = dbctr.ResultUpdate(strSql);
						if(flag){ 
							++n;
						}
						else{
							response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/"+floder+"/news.jsp?id="+newsid+"';alert('删除失败！');\"></body>");
						}
					}
				} catch (SQLException sqle) {
					System.out.println("LoginService:\t" + sqle);
				}
				dbctr.close();
			}
		}		
		response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/"+floder+"/news.jsp?id="+newsid+"';alert('成功删除"+n+"个评论！');\"></body>");
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
