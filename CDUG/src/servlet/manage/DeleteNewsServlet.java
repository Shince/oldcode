package servlet.manage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAO;

public class DeleteNewsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteNewsServlet() {
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
	}

	public void process(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String useraccess = request.getParameter("useraccess");
		String tag = request.getParameter("tag");
		if(!(useraccess.equals("2"))){
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else{	
			String[] id = request.getParameterValues("chkId");
			if(id==null){
				response.getWriter().println("<head></head><body onload=\"javascript:window.history.back(-1);alert('至少选择一个新闻事件！');\"></body>");
			}
			else{
			DAO dbctr = new DAO();
			for(int i=0;i<id.length;i++)
			{
				String strSql = "delete from cdug_release_all where id = "+id[i]+";";
				String strSql2 = "delete from cdug_release_comments where newsid = "+id[i]+";";
				String strSql1 = "select * from cdug_release_all where id = '"+id[i]+"';";
				ResultSet rs = dbctr.getResultSet(strSql1);
				try{
					if(rs.next()){
						boolean flag = false; 
						flag = dbctr.ResultUpdate(strSql);
						if(flag){
							if(tag.equals("news")){
								response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/NewsManagement.jsp';alert('删除成功！');\"></body>");
							}
							else if(tag.equals("events")){
								response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/EventsManagement.jsp';alert('删除成功！');\"></body>");
							}
							else{
								response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('内部错误！');\"></body>");
							}
							dbctr.ResultUpdate(strSql2);
						}
						else{
							response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('删除失败！');\"></body>");
						}
					}
					else{
						if(tag.equals("news")){
							response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/NewsManagement.jsp';alert('此新闻不存在！');\"></body>");
						}
						else if(tag.equals("events")){
							response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/EventsManagement.jsp';alert('此事件不存在！');\"></body>");
						}
						else{
							response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('内部错误！');\"></body>");
						}
					}
				}catch (SQLException sqle) {
					System.out.println("LoginService:\t" + sqle);
				}
			}
			dbctr.close();
			}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
