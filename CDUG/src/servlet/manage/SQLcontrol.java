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

import utility.StringTranslator;

import Bean.User;
import DAO.DAO;
import MD5.MD5;

public class SQLcontrol extends HttpServlet
{
	public void destroy() 
	{
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		process(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		process(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		StringTranslator stringtrans = new StringTranslator();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String useraccess = request.getParameter("useraccess");
		String SQLstatement = request.getParameter("SQLstatement");
		
		if(!(useraccess.equals("2")))
		{
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else
		{	
			String strSql = SQLstatement.trim();
			if(SQLstatement.equals(""))
			{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/SQLcontrol.jsp';alert('请重新输入命令！');\"></body>");	
				return;
			}
			if( !(strSql.substring(0,6).equalsIgnoreCase("update")|| strSql.substring(0,6).equalsIgnoreCase("delete")||strSql.substring(0,6).equalsIgnoreCase("insert")))
			{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/SQLcontrol.jsp';alert('输入的命令不合法，您只能进行更新，插入，删除！');\"></body>");	
				return;
			}
			if(  (SQLstatement.indexOf("cdug_upload_file")== -1) && (SQLstatement.indexOf("cdug_upload_pic") == -1)
					&& (SQLstatement.indexOf("cdug_release_all") == -1) && (SQLstatement.indexOf("cdug_release_comments") == -1))
			{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/SQLcontrol.jsp';alert('请对正确的表进行操作！');\"></body>");	
				return;
			}
			SQLstatement = stringtrans.convertToSqlString(SQLstatement);
			try
			{
				DAO dbctrl = new DAO();
				boolean flag = false; 
				flag = dbctrl.ResultUpdate(strSql);
				if(flag)
				{
					response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/SQLcontrol.jsp';alert('更新成功！');\"></body>");	
				}
				else
				{
					response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/SQLcontrol.jsp';alert('更新失败！命令有误');\"></body>");	
				}
				dbctrl.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG/jsp/AdminManagement/SQLcontrol.jsp';alert('"+e.getMessage()+"');\"></body>");
			}
		}
	}
}
