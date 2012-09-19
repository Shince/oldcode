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
			if(rs.next()){//���ĳ����Ϊ�գ����ԭ���ݿ������ݸ��������ȫ�����£�
				if(!rs1.next()){//�ж�Ҫ�޸ĳɵĿγ̺źͿγ����Ƿ��Ѵ��������ݿ⣻
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
					//���㷨Ŀ����Ϊ�˷�ֹ�޸ĺ�Ŀγ̳��ָ��ֳ�ͻ�����
					//ǰ�������ǵ��Ѿ��ж��������Ƿ�Ϊ�յ������
					java.sql.ResultSet rs2 = MyDAO.select(con, "*", "Course_table", "(COURSE_TIME = '"+time+"' AND COURSE_PLACE = '"+place+"')");
					java.sql.ResultSet rs3 = MyDAO.select(con, "*", "Course_table", "(COURSE_TIME = '"+time+"' AND COURSE_TEACHER = '"+teacher+"')");
					//��¼��ʱ�䣬�ص㣬��ʦ����������Ŀγ̺ţ�����¼��
					Vector vec2 = new Vector();
					Vector vec3 = new Vector();
					while(rs2.next()){
						vec2.addElement(rs2.getString("COURSE_NAME"));
					}
					while(rs3.next()){
						vec3.addElement(rs3.getString("COURSE_NAME"));
					}
					//���㷨����˼�룺
					//������ݿ���û�м�¼������Ը��£������ͻ��
					if(vec2.size()==0 && vec3.size()==0){
						MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
						MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
						reason = "�����޸ĳɹ���";
					}
					//������ݿ�����������ʱ�䣬��ʦ�ļ�¼���ж��Ƿ�Ϊ�����¼��
					//���SIZE����2����϶���ͻ����ֹ���£�
					//���SIZEΪ1��Ҳ����VEC����ֻ��һ����¼����������¼ID��������ID����˵����ͻ����ֹ���£�
					if(vec2.size()==0 && vec3.size()!=0){
						if(vec3.size()>=2 || !vec3.get(0).equals(id)){
							reason = "�޸ĺ�γ�ʱ�䣬��ʦ��ͻ��";
						}
						else{
							MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
							reason = "�����޸ĳɹ���";
						}
					}
					//�ж�ʱ�䣬�ص��ͻ���㷨ͬ�ϣ�
					if(vec2.size()!=0 && vec3.size()==0){
						if(vec2.size()>=2 || !vec2.get(0).equals(id)){
							reason = "�޸ĺ�γ�ʱ�䣬�ص��ͻ��";
						}
						else{
							MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
							reason = "�����޸ĳɹ���";
						}
					}
					//���ʱ�䣬�ص㣬��ʦ���м�¼���ж��Ƿ�Ϊ����������ǣ����ͻ����ֹ���£�
					if(vec2.size()!=0 && vec3.size()!=0){
						if(vec2.size()>=2 || !vec2.get(0).equals(id)){
							reason = "�޸ĺ�γ�ʱ�䣬�ص��ͻ��";
						}
						else if(vec3.size()>=2 || !vec3.get(0).equals(id)){
							reason = "�޸ĺ�γ�ʱ�䣬��ʦ��ͻ��";
						}
						//���������������Ը��£�
						else{
							MyDAO.update(con, "Course_table", "COURSE_TIME ="+"'"+time+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_PLACE ="+"'"+place+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_TEACHER ="+"'"+teacher+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_POINT ="+"'"+point+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "IS_DEGREE ="+"'"+degree+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_ID ="+"'"+newid+"'", "COURSE_NAME="+"'"+id+"'");
							MyDAO.update(con, "Course_table", "COURSE_NAME ="+"'"+name+"'", "COURSE_NAME="+"'"+id+"'");
							reason="�����޸ĳɹ���";
						}
					}
				}
				else{
					reason = "�޸ĺ�γ̺Ż�γ�����ͻ��";
				}
			}
			else{
				reason="�ÿγ̲����ڣ�";
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