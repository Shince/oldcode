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

public class ChangeData extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeData() {
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
			String psw = request.getParameter("psw").trim();
			String reason=new String();
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "User_table", "ID= '"+ id+"'");
			java.sql.ResultSet rs1 = MyDAO.select(con, "*", "User_table", "ID= '"+ newid+"'");
			if(rs.next()){//判断要修改用户是否存在；
				if(!rs1.next()){//判断修改成的帐户是否冲突；
					//如有空输入，则赋成数据库中原有值；
					if (newid.equals("")){
						newid = rs.getString("ID");
					}
					if(name.equals("")){
						name = rs.getString("NAME");
					}
					if(psw.equals("")){
						psw = rs.getString("PASSWORD");
					}
					if(newid.equals("") && name.equals("") && psw.equals("")){
						reason = "资料未做修改！";
					}
					else{
					MyDAO.update(con, "User_table", "PASSWORD ="+"'"+psw+"'", "ID="+"'"+id+"'");
					MyDAO.update(con, "User_table", "NAME ="+"'"+name+"'", "ID="+"'"+id+"'");
					MyDAO.update(con, "User_table", "ID ="+"'"+newid+"'", "ID="+"'"+id+"'");
					reason = "资料修改成功！";	
					}
				}
				else{
					reason = "修改后帐户名冲突！";
				}
			}
			else{
				reason="该用户不存在！";
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