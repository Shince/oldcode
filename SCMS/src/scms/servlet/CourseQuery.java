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

public class CourseQuery extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CourseQuery() {
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
			Course course = new Course();
			CourseVec coursevec = new CourseVec();
			String id = request.getParameter("courseID");
			String name = request.getParameter("courseName");
			String time1 = request.getParameter("time1");
			String time2 = request.getParameter("time2");
			String time = time1 + time2;
			String teacher = request.getParameter("teacher");
			String point = request.getParameter("courseMark");
			String degree = request.getParameter("isDegree");
			Vector vec = new Vector();
			boolean Query = false;
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "Course_table", 
					"(COURSE_NAME LIKE '%"+ name + "%' AND COURSE_ID LIKE '%"+id+"%' AND COURSE_TEACHER LIKE '%"+teacher+"%' AND COURSE_POINT LIKE '%"+point+"%' AND IS_DEGREE LIKE '%"+degree+"%' AND COURSE_TIME LIKE '%"+time+"%'"+")");
			while(rs.next()){
				course.setID(rs.getString("COURSE_ID"));
				course.setNAME(rs.getString("COURSE_NAME"));
				course.setTIME(rs.getString("COURSE_TIME"));
				course.setDEGREE(rs.getInt("IS_DEGREE"));
				course.setPLACE(rs.getString("COURSE_PLACE"));
				course.setPOINT(rs.getString("COURSE_POINT"));
				course.setTEACHER(rs.getString("COURSE_TEACHER"));
				if(course.getDEGREE()==1){
					course.setBOOL("ÊÇ");	
					}
					else{
						course.setBOOL("·ñ");
					}
				Query = true;
				vec.addElement(course.getID());
				vec.addElement(course.getNAME());
				vec.addElement(course.getTIME());
				vec.addElement(course.getPLACE());
				vec.addElement(course.getTEACHER());
				vec.addElement(course.getPOINT());
				vec.addElement(course.getBOOL());
				coursevec.setVEC(vec);
				}
			rs.close();
			MyDAO.closeDB(con);
			if (Query) {
				HttpSession session = request.getSession(true);
				session.setAttribute("course", course);
				session.setAttribute("coursevec", coursevec);
				request.getRequestDispatcher("../CourseQuery.jsp").forward(request,response);
				//PrintWriter out = response.getWriter();
				//out.println(vec.size()+"!!!"+coursevec.getSIZE());
			}
			else{
				//PrintWriter out = response.getWriter();
				//out.println(vec.size()+"???"+coursevec.getSIZE());
				request.getRequestDispatcher("../CourseQuery.jsp").forward(request,response);
			}
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
