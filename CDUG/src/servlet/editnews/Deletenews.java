package servlet.editnews;

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

public class Deletenews extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Deletenews() {
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
		String id = request.getParameter("id");
		String useraccess = request.getParameter("useraccess");
		String tag = request.getParameter("tag");
		String a_name = request.getParameter("a_name");
		String username = new String();
		DAO dbctr = new DAO();
		String str = "select * from cdug_release_all where id = '"+id+"';";
		ResultSet rs1 = dbctr.getResultSet(str);
		try{
			if(rs1.next()){
				username = rs1.getString("username");
			}
		}catch (SQLException sqle) {
			//System.out.println("LoginService:\t" + sqle);
		}
		if(!((useraccess.equals("2")) || a_name.equals(username))){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else{		
		String strSql = "delete from cdug_release_all where id = "+id+";";
		String strSql2 = "delete from cdug_release_comments where newsid = "+id+";";
		String strSql1 = "select * from cdug_release_all where id = '"+id+"';";
		ResultSet rs = dbctr.getResultSet(strSql1);
		try{
		if(rs.next()){
			boolean flag = false; 
			flag = dbctr.ResultUpdate(strSql);
			if(flag){
			if(tag.equals("news")){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2news/DB2news.jsp';alert('删除成功！');\"></body>");
			}
			else if(tag.equals("events")){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/CDUGEvent/CDUGEvent.jsp';alert('删除成功！');\"></body>");
			}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('内部错误！');\"></body>");
			}
			dbctr.ResultUpdate(strSql2);
			}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('删除失败！');\"></body>");
			}
		}
		else{
			if(tag.equals("news")){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/DB2news/DB2news.jsp';alert('此新闻不存在！');\"></body>");
			}
			else if(tag.equals("events")){
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/CDUGEvent/CDUGEvent.jsp';alert('此事件不存在！');\"></body>");
			}
			else{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('内部错误！');\"></body>");
			}
		}
		}catch (SQLException sqle) {
		}
		}
		dbctr.close();
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
