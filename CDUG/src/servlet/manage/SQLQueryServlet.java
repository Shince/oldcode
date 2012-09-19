/*
 * 创建日期 Mar 13, 2008
 *
 * 更改所生成文件模板为
 * 窗口 > 首选项 > Java > 代码生成 > 代码和注释
 */
package servlet.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DAO;

public class SQLQueryServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SQLQueryServlet() {
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
		// HttpSession session = request.getSession(false);
		// if (session != null) {
		String resultStr = new String("");
		String SQLQueryText = request.getParameter("QueryText");

		DAO dbctr = new DAO();
		ResultSet res = dbctr.getResultSet(SQLQueryText);
		if((!SQLQueryText.startsWith("select"))&&(!SQLQueryText.startsWith("Select"))&&(!SQLQueryText.startsWith("SELECT")))
		{
			resultStr="Invalid Query!";
		}
		else
		{
		try {
			// if(res!=null)
			ResultSetMetaData rsmd = res.getMetaData();
			int ColumnCount;	
			resultStr += "<br><table border=\"0\" cellspacing=\"1\" bgcolor=\"#000000\">";
			ColumnCount = rsmd.getColumnCount();
			resultStr += "<tr bgcolor=\"#FFFFFF\">";
			for (int i = 0; i < ColumnCount; i++) {
				resultStr += "<td align=center>";
				resultStr += rsmd.getColumnName(i+1);
				resultStr += "</td>";
			}
			resultStr += "</tr>";		
			
			while (res.next()) {	
				resultStr += "<tr bgcolor=\"#FFFFFF\">";
				for (int i = 0; i < ColumnCount; i++) {
					resultStr += "<td align=center>";
					resultStr += res.getString(i + 1);
					resultStr += "</td>";
				}
				resultStr += "</tr>";

			}
			resultStr += "</table>";
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		}
		// response.setContentType("text/html;charset=UTF-8");
		// response.getWriter().println(resultStr);
		dbctr.close();

		request.setAttribute("query_result", resultStr);

		this.getServletContext().getRequestDispatcher(
				"/jsp/AdminManagement/SQLQuery.jsp").forward(request, response);

		// }

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

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
