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

public class ChangeInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeInfo() {
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
			HttpSession session = request.getSession();
			User user= (User)session.getAttribute("user");
			String id=user.getID();
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String grade = request.getParameter("grade");
			String reason=new String();
			boolean Update1 = false;
			boolean Update2 = false;
			boolean Update3 = false;
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "User_table", "ID= '"+ id+ "'");
			if(rs.next()){
				if (!address.equals("") && !phone.equals("") && !grade.equals("")){
				Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
				Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
				Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
				reason = "全部资料修改成功！";			
				}
				if (address.equals("") && !phone.equals("") && !grade.equals("")){
					//Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
					Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
					Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
					reason = "号码和时间修改成功！";			
				}
				if (!address.equals("") && phone.equals("") && !grade.equals("")){
					Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
					//Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
					Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
					reason = "地址和时间修改成功！";			
				}
				if (!address.equals("") && !phone.equals("") && grade.equals("")){
					Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
					Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
					//Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
					reason = "地址和号码修改成功！";			
				}
				if (address.equals("") && phone.equals("") && !grade.equals("")){
					//Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
					//Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
					Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
					reason = "时间修改成功！";			
				}
				if (address.equals("") && !phone.equals("") && grade.equals("")){
					//Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
					Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
					//Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
					reason = "号码修改成功！";			
				}
				if (!address.equals("") && phone.equals("") && grade.equals("")){
					Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
					//Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
					//Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
					reason = "地址修改成功！";			
				}
				if (address.equals("") && phone.equals("") && grade.equals("")){
					Update1 =MyDAO.update(con, "User_table", "ADDRESS = '"+address+"'", "ID="+"'"+id+"'");
					Update2 =MyDAO.update(con, "User_table", "PHONE = "+phone, "ID="+"'"+id+"'");
					Update3 =MyDAO.update(con, "User_table", "GRADE = "+grade, "ID="+"'"+id+"'");
					reason = "资料未修改！";			
				}
			}
			else{
				reason = "系统错误！";
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