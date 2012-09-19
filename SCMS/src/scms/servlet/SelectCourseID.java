package scms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import scms.model.User;
import scms.dao.MyDAO;

public class SelectCourseID extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelectCourseID() {
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
			String s_id = request.getParameter("s_id");
			String s_name = request.getParameter("s_name");
			String id = request.getParameter("id");
			Vector time_vec = new Vector();
			String reason=new String();
			boolean Insert = false;		
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "Course_table", "COURSE_ID= '"+ id + "'");
			java.sql.ResultSet rs1 = MyDAO.select(con, "*", "Mark_table", "(COURSE_ID= '"+ id + "' AND STUDENT_ID= '"+s_id+"')");
			boolean check_time = false;
			if(rs.next()){//�ж�����γ��Ƿ���ڣ�
				java.sql.ResultSet rs3 = MyDAO.select(con, "*", "Mark_table", "STUDENT_ID= '"+s_id+"'");
				java.sql.ResultSet rs4 = MyDAO.select(con, "*", "Course_table", "COURSE_ID= '"+ id + "'");
				while(rs3.next()){//����ѡ�γ�ʱ�䶼����time_vec�У�
					time_vec.addElement(rs3.getString("COURSE_TIME"));
				}
				while(rs4.next()){//����ѡ�γ�ʱ�����time_vec�У�
					time_vec.addElement(rs4.getString("COURSE_TIME"));
				}
				String str = "";
				for(int i =0 ; i!=time_vec.size(); ++i){
					if(!time_vec.get(i).equals(str)){//�Ƚ�time_vec���Ƿ������ͬ��Ԫ�أ�
						str = (String)time_vec.get(i);
					}
					else{
						check_time = true;
					}
				}
				if(!rs1.next()){//�жϿγ��Ƿ��ͻ��
					if(!check_time){				
						String name = rs.getString("COURSE_NAME");
						String point = rs.getString("COURSE_POINT");
						String teacher = rs.getString("COURSE_TEACHER");
						String time = rs.getString("COURSE_TIME");
						String place = rs.getString("COURSE_PLACE");
						int degree = rs.getInt("IS_DEGREE");
						Insert = MyDAO.insert(con, "Mark_table", "STUDENT_ID,STUDENT_NAME,COURSE_ID,COURSE_NAME,COURSE_TIME,COURSE_PLACE,COURSE_POINT,COURSE_TEACHER,COURSE_MARK,IS_DEGREE", "'"+s_id+"'"+","+"'"+s_name+"'"+","+"'"+id+"'"+","+"'"+name+"'"+","+"'"+time+"'"+","+"'"+place+"'"+","+"'"+point+"'"+","+"'"+teacher+"'"+",0,"+degree);
						if(Insert){
							reason = "ѡ�γɹ���";
						}
						else{
							reason = "ѡ��ʧ�ܣ�";
						}
					}
					else{
						reason = "��ѡ������ѡ��ʱ���ͻ��";
					}
				}
				else{
					reason = "�������ظ�ѡ�Σ�";
				}
			}
			else{
				reason="�˿γ̲����ڣ�";
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
