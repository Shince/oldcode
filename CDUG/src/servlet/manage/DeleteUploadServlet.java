/*
 * 创建日期 Mar 24, 2008
 *
 * 更改所生成文件模板为
 * 窗口 > 首选项 > Java > 代码生成 > 代码和注释
 */
package servlet.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.User;
import DAO.DAO;
import MD5.MD5;
import java.util.*;
import java.io.File;

public class DeleteUploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteUploadServlet() {
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
		//final String savePath = "C:\\1\\";
		//String savePath = "\\CDUG\\source\\Upload\\";
		String savePath = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\source\\Release\\";
		String useraccess = request.getParameter("useraccess");
		String[] filename = request.getParameterValues("checkfile");
		int n = 0;
		if(!(useraccess.equals("2")))
		{
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else
		{
			if(filename==null)
			{
				PrintWriter out = response.getWriter();
				out.println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/UploadManagement.jsp';alert('至少选择一个文件.');\"></body>");
			}
			else
			{
				while(n!=filename.length)	
				{
					DAO dbctr = new DAO();
					String strSql = "delete from cdug_upload_pic where picname = '"+filename[n]+"';";
					String strSql1 = "select * from cdug_upload_pic where picname = '"+filename[n]+"';";
					ResultSet rs = dbctr.getResultSet(strSql1);
					try
					{
						if (rs.next())
						{
							String date = rs.getString("date");
							String filePath = savePath + date + "\\" + filename[n];
							File deleteFile = new File(filePath);
							boolean flag = false;
							flag = dbctr.ResultUpdate(strSql);
							if(flag)
							{
								try
								{ 
									deleteFile.delete(); 
								}
								catch(Exception e)
								{
									PrintWriter out = response.getWriter();
									out.println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/UploadManagement.jsp';alert('删除失败!');\"></body>");
								} 
								++n;
							}
							else
							{
								PrintWriter out = response.getWriter();
								out.println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/UploadManagement.jsp';alert('删除失败!');\"></body>");
							}
						}
					}
					catch (SQLException sqle) 
					{
						System.out.println("LoginService:\t" + sqle);
					}
					dbctr.close();
				}
			}
		PrintWriter out = response.getWriter();
		out.println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/UploadManagement.jsp';alert('成功删除"+n+"个文件!');\"></body>");
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
