package scms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import scms.model.User;
import scms.dao.MyDAO;
import java.util.Vector;

public class Answer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Answer() {
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

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("GBK");
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
	
		try {
			Connection con = MyDAO.openDB();
			String reason = new String();
			String text = request.getParameter("text");
			String title = request.getParameter("title");
			java.sql.ResultSet rs = MyDAO.select(con, "*", "QA_table", "TITLE= '"+ title +"'");
			if(rs.next()){
				MyDAO.update(con, "QA_table", "CONTENT = '"+text+"'", "TITLE= '"+ title +"'");
				reason = "OK";
			}
			PrintWriter out = response.getWriter();
			out.println(reason);
			MyDAO.closeDB(con);
			request.getRequestDispatcher("../Answer.jsp").forward(request,response);			
	}catch (Exception e) {
		System.out.println(e);
	}
	}
	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
		try {
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}