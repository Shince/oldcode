package servlet.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.StringTranslator;

import Bean.User;
import DAO.DAO;
import MD5.MD5;

public class accessChange extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public accessChange() {
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
		String user_id = request.getParameter("userid");
		String access = request.getParameter("access").trim();
		String useraccess = request.getParameter("useraccess");
		StringTranslator stringtrans = new StringTranslator();
		user_id = stringtrans.convertToSqlString(user_id);
		
		if(!(useraccess.equals("2"))){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else
		{
			
			if(user_id.equals("cdug_admin"))
			{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('该帐号是系统管理员,您不能更改此帐号的权限！');\"></body>");
			}
		DAO dbctrl = new DAO();
		String strSql = "select * from cdug_members where username = '" + user_id
				+"'";
		String strSql1 = "UPDATE cdug_members SET access = '"+access+"' where username = '"+user_id+"'";
		ResultSet rs = dbctrl.getResultSet(strSql);
		try {
			if (rs.next()) {
				boolean flag = false;
				flag = dbctrl.ResultUpdate(strSql1);
				if(flag){
					//con.commit();
				PrintWriter out = response.getWriter();
				//out.println("更新成功！");
				out.println("<head></head><body onload=\"javascript:window.history.back(-1);alert('更新成功！');\"></body>");
				}
				else{
					PrintWriter out = response.getWriter();
					//out.println("更新失败！");
					out.println("<head></head><body onload=\"javascript:window.history.back(-1);alert('更新失败！');\"></body>");
				}
			} else {
				PrintWriter out = response.getWriter();
				//out.println("用户ID不存在!");
				out.println("<head></head><body onload=\"javascript:window.history.back(-1);alert('用户ID不存在!');\"></body>");
			}
		} catch (SQLException sqle) {
			System.out.println("LoginService:\t" + sqle);
		}
		dbctrl.close();
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
