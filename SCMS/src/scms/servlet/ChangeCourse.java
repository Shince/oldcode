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

public class ChangeCourse extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeCourse() {
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
			String id = request.getParameter("id").trim();
			String newid = request.getParameter("newid").trim();
			String name = request.getParameter("name").trim();
			String time1 = request.getParameter("time1").trim();
			String time2 = request.getParameter("time2").trim();
			String time = time1 + time2;
			String place = request.getParameter("place").trim();
			String teacher = request.getParameter("teacher").trim();
			String point = request.getParameter("point").trim();
			String degree = request.getParameter("degree");
			String reason=new String();
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "Course_table", "COURSE_NAME= '"+ id+"'");
			java.sql.ResultSet rs1 = MyDAO.select(con, "*", "Course_table", "(COURSE_ID = '"+newid+"' OR COURSE_NAME = '"+name+"')");
			if(rs.next()){//如果某输入为空，则把原数据库中数据赋给此项，再全部更新；
				if(!rs1.next()){//判断要修改成的课程号和课程名是否已存在于数据库；
					if(newid.equals("")){ 
						newid = rs.getString("COURSE_ID");
					}
					if(name.equals("")){ 
						name = rs.getString("COURSE_NAME");
					}
					if(time.equals("")){ 
						time = rs.getString("COURSE_TIME");
					}
					if(place.equals("")){ 
						place = rs.getString("COURSE_PLACE");
					}
					if(teacher.equals("")){ 
						teacher = rs.getString("COURSE_TEACHER");
					}
					if(point.equals("")){ 
						point = rs.getString("COURSE_POINT");
					}
					//此算法目的是为了防止修改后的课程出现各种冲突情况；
					//前置条件是当已经判断了输入是否为空的情况；
					java.sql.ResultSet rs2 = MyDAO.select(con, "*", "Course_table", "(COURSE_TIME = '"+time+"' AND COURSE_PLACE = '"+place+"')");
					java.sql.ResultSet rs3 = MyDAO.select(con, "*", "Course_table", "(COURSE_TIME = '"+time+"' AND COURSE_TEACHER = '"+teacher+"')");
					//记录下时间，地点，教师的搜索结果的课程号，并记录；
					Vector vec2 = new Vector();
					Vector vec3 = new Vector();
					while(rs2.next()){
						vec2.addElement(rs2.getString("COURSE_NAME"));
					}
					while(rs3.next()){
						vec3.addElement(rs3.getString("COURSE_NAME"));
					}
					//此算法核心思想：
					//如果数据库内没有记录，则可以更新，不会冲突；
					if(vec2.size()==0 && vec3.size()==0){
						MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
						reason = "资料修改成功！";
					}
					//如果数据库中有搜索出时间，教师的记录，判断是否为自身记录；
					//如果SIZE大于2，则肯定冲突，禁止更新；
					//如果SIZE为1，也就是VEC里面只有一个记录，如果这个记录ID不是自身ID，则说明冲突，禁止更新；
					if(vec2.size()==0 && vec3.size()!=0){
						if(vec3.size()>=2 || !vec3.get(0).equals(id)){
							reason = "修改后课程时间，教师冲突！";
						}
						else{
							MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
							reason = "资料修改成功！";
						}
					}
					//判断时间，地点冲突，算法同上；
					if(vec2.size()!=0 && vec3.size()==0){
						if(vec2.size()>=2 || !vec2.get(0).equals(id)){
							reason = "修改后课程时间，地点冲突！";
						}
						else{
							MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
							reason = "资料修改成功！";
						}
					}
					//如果时间，地点，教师都有记录，判断是否为自身，如果不是，则冲突，禁止更新；
					if(vec2.size()!=0 && vec3.size()!=0){
						if(vec2.size()>=2 || !vec2.get(0).equals(id)){
							reason = "修改后课程时间，地点冲突！";
						}
						else if(vec3.size()>=2 || !vec3.get(0).equals(id)){
							reason = "修改后课程时间，教师冲突！";
						}
						//如果都是自身，则可以更新；
						else{
							MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
							reason="资料修改成功！";
						}
					}
				}
				else{
					reason = "修改后课程号或课程名冲突！";
				}
			}
			else{
				reason="该课程不存在！";
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