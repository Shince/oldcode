package servlet.log;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Bean.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.SessionListener;
import utility.StringTranslator;
import DAO.DAO;
import MD5.MD5;

public class login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public login() {
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
			String password1 = request.getParameter("password");
			StringTranslator stringtrans = new StringTranslator();
			user_id = stringtrans.convertToSqlString(user_id);
			//System.out.println(password1);
			String password = MD5.Md5(password1);
			//System.out.println(password1);
			DAO dbctrl = new DAO();
			String strSql = "select * from cdug_members where username = '" + user_id
					+ "' and password = '" + password + "'";
			ResultSet rs = dbctrl.getResultSet(strSql);
			try {
				if (rs.next()) {
					User user = new User();
					user.setUser_id(rs.getString("username"));
					user.setUid(rs.getInt("uid"));
					user.setUser_access(rs.getInt("access"));
					user.setPassword(rs.getString("password"));
					HttpSession session = request.getSession(true);
					session.setAttribute("user_session", user);	
					//session.setMaxInactiveInterval(30);
					//out.println(rs.getInt("access"));	
					SessionListener.isAlreadyEnter(session, user.getUser_id());
					response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/index.jsp';alert('登录成功！');\"></body>");	
				} else {
					PrintWriter out = response.getWriter();
					//out.println("..");
					out.println("<head></head><body onload=\"javascript:window.history.back(-1);alert('用户名或密码错误!');\"></body>");
				}
			} catch (SQLException sqle) {
				//System.out.println("LoginService:\t" + sqle);
			}
			dbctrl.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
