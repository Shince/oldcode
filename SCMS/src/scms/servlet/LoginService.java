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

public class LoginService extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginService() {
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
			User user = new User();
			String id = request.getParameter("id");
			String psw = request.getParameter("psw");
			String reason;
			boolean login = false;
			Connection con = MyDAO.openDB();
			java.sql.ResultSet rs = MyDAO.select(con, "*", "User_table", "ID= '"+ id + "'");
			if (rs.next()) {
				String passwd = rs.getString("PASSWORD");
				if (psw.equals(passwd)) {
					login = true;
					reason = rs.getString("NAME");
					user.setID(id);
					user.setNAME(rs.getString("NAME"));
					user.setPASSWORD(rs.getString("PASSWORD"));
					user.setCONDITION(rs.getInt("CONDITION"));
					user.setADDRESS(rs.getString("ADDRESS"));
					user.setPHONE(rs.getString("PHONE"));
					user.setGRADE(rs.getString("GRADE"));
				} else {
					login = false;
					reason = "����������벻��ȷ��";					
				}
			} else {
				reason = "�ʺŴ���";
			}
			PrintWriter out = response.getWriter();
			out.println(reason);
			rs.close();
			MyDAO.closeDB(con);

			if (login) {
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				switch (user.getCONDITION()) {
				case 1:
					request.getRequestDispatcher(
							"../StudentMain.html").forward(request,
							response);
					break;
				case 2:
					request.getRequestDispatcher(
					"../TeacherMain.html").forward(request,
					response);
					break;
				case 3:
					request.getRequestDispatcher(
					"../ManageMain.html").forward(request,
					response);
					break;
				default:
					;
				}
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
