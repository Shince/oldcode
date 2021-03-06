package scms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import scms.model.Course;
import scms.model.CourseVec;
import scms.dao.MyDAO;
import java.util.Vector;

public class CourseManage extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CourseManage() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("GBK");
		try {
			String reason = new String();
			String c_id = request.getParameter("c_id");
			String s_id = request.getParameter("s_id");
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "Mark_table", "(COURSE_ID= '"+c_id+"' AND STUDENT_ID='"+s_id+"')");
			if(rs.next()){
				MyDAO.delete(con, "Mark_table", "(COURSE_ID= '"+c_id+"' AND STUDENT_ID='"+s_id+"')");
				reason = c_id+"!!!"+s_id;
			}
			else{
				reason = c_id+"???"+s_id;
			}			
			PrintWriter out = response.getWriter();
			out.println(reason);
			request.getRequestDispatcher("../CourseManage.jsp").forward(request,response);			
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occure
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
