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
import scms.model.Mark;
import java.util.Vector;;

public class NewResult extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewResult() {
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
		try {//本项目中最怪异的算法，不过好象满有效的；
			String reason = new String();
			Connection con = MyDAO.openDB();
			Vector id_vec = new Vector();
			Vector mark_vec = new Vector();
			String course_name = request.getParameter("course_name");
			for(int i=0;i!=200;++i){//200个数应该够多了吧；
			id_vec.addElement(request.getParameter("student_id_"+i));//把JSP里的值都拿出来；
			mark_vec.addElement(request.getParameter("course_mark_"+i));//同上；
			//把VECTOR里面多余的（为NULL）值都扔掉，只用有值的；
			java.sql.ResultSet rs = MyDAO.select(con, "*", "Mark_table", "COURSE_NAME= '"+ course_name +"' AND STUDENT_ID = '"+id_vec.get(i)+"'");
			if(rs.next()){
				MyDAO.update(con, "Mark_table", "COURSE_MARK = '"+mark_vec.get(i)+"'", "COURSE_NAME= '"+ course_name +"' AND STUDENT_ID = '"+id_vec.get(i)+"'");
			}
			}	
			reason = "成绩录入成功！";
			PrintWriter out = response.getWriter();
			out.println(reason);
			MyDAO.closeDB(con);
	}catch (Exception e) {
		System.out.println(e);
	}
	}
	/**
	 * Initialization of the servlet. 
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
