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

public class NewCourse extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewCourse() {
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
			String name=request.getParameter("name");
			String time1 = request.getParameter("time1");
			String time2 = request.getParameter("time2");
			String time = time1 + time2;
			String id = request.getParameter("id");
			String place = request.getParameter("place");
			String point = request.getParameter("point");
			String teacher = request.getParameter("teacher");
			String degree = request.getParameter("degree");
			String reason=new String();
			boolean Insert = false;		
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "Course_table", "(COURSE_ID= '"+ id + "' OR COURSE_NAME = '"+name+"')");
			java.sql.ResultSet rs1 = MyDAO.select(con, "*", "Course_table", "(COURSE_TIME = '"+time+"' AND COURSE_PLACE = '"+place+"')");
			java.sql.ResultSet rs2 = MyDAO.select(con, "*", "Course_table", "(COURSE_TIME = '"+time+"' AND COURSE_TEACHER = '"+teacher+"')");
			if(!rs.next()){
				if(!rs1.next()){
					if(!rs2.next()){
						Insert = MyDAO.insert(con, "Course_table", "COURSE_ID,COURSE_NAME,COURSE_TIME,COURSE_PLACE,COURSE_TEACHER,COURSE_POINT,IS_DEGREE", "'"+id+"'"+","+"'"+name+"'"+","+"'"+time+"'"+","+"'"+place+"'"+","+"'"+teacher+"'"+","+"'"+point+"'"+","+degree);
						if (Insert){
							reason="新课程录入成功！";
						}
						else{
							reason="新课程录入失败！";
						}
					}
					else{
						reason="授课教师冲突，请重新输入！";
					}
				}
				else{					
					reason="课程地点冲突，请重新输入！";
				}
				}
			else{
				reason="课程号或课程名已存在，请重新输入！";
			}
			PrintWriter out = response.getWriter();
			out.println(reason);
			MyDAO.closeDB(con);
	}catch (Exception e) {
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
