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
import javax.servlet.http.HttpSession;

import utility.StringTranslator;

import Bean.User;
import DAO.DAO;
import MD5.MD5;

public class updateFileInfo  extends HttpServlet
{
	final String savePath = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\source\\Upload\\";
	
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
	
	public   static   boolean   isNormallyString(String   str)  
	{ 
	    if   (  str != null && str.matches( "^[^\\\\<>' '\"\",#·￥…%]+$"))   
	    { 
	    	return   true; 
	    } 
	    return   false; 
	}
	public void process(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		StringTranslator stringtrans = new StringTranslator();
		String useraccess = request.getParameter("useraccess");
		
		String oldFileName = request.getParameter("oldfilename");
		oldFileName = stringtrans.convertToSqlString(oldFileName);
		String newFileDes = request.getParameter("newfiledes");
		newFileDes = stringtrans.convertToSqlString(newFileDes);
		String newFileTag = request.getParameter("newfiletag");
		newFileTag = stringtrans.convertToSqlString(newFileTag);
		String newFileName = request.getParameter("newfilename").toUpperCase();
		newFileName = stringtrans.convertToSqlString(newFileName);
		String tag = new String();
		tag = request.getParameter("tag");
		String path="/CDUG/jsp/AdminManagement/db2resource.jsp";
		if(tag.equals("normal")){
			path="/CDUG/jsp/DB2Resource/DB2Resource.jsp";
		}
		
		if(!(useraccess.equals("2")||(useraccess.equals("1"))))
		{
			response.getWriter().println("<head></head><body onload=\"javascript:parent.location='/CDUG';alert('连接超时,请重新登入！');\"></body>");
		}
		else
		{
			if(!newFileName.equals("") && !isNormallyString(newFileName))
			{
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='"+path+"';alert('文件名中含有非法字符！');\"></body>");	
				return;
			}
			try
			{
				DAO dbctrl = new DAO();
				String strSql1 = "select * from cdug_upload_file where filename = '"+oldFileName+"'";
				boolean flag = false; 
				
				ResultSet rs = dbctrl.getResultSet(strSql1);
				if(rs.next())
				{
					
					String fileName = new String();
					String filedes = new String();
					String filetag = new String();
					
					if( newFileName.equals(""))
						fileName =oldFileName;
					else
					{
						String strSql2 = "select * from cdug_upload_file where filename = '"+newFileName+"';";
						int row = dbctrl.getTableRowCount("cdug_upload_file", strSql2);
						if(row>=1)
						{
							response.getWriter().println("<head></head><body onload=\"javascript:window.history.back(-1);alert('文件名已存在，请换个文件名！');\"></body>");	
							dbctrl.close();
							return;
						}
						fileName = newFileName;
						String date = rs.getString("date");
						String filePath = savePath + date + "\\" + oldFileName;
						File file1 = new File(filePath);
						File file2 = new File(savePath + date +"\\"+ newFileName);
						if(!file1.renameTo(file2))
						{
							response.getWriter().println("<head></head><body onload=\"javascript:parent.location='"+path+"';alert('重命失败！');\"></body>");	
							dbctrl.close();
							return;
						}
					}
					
					if(newFileDes.equals(""))
					{
						if(( filedes = rs.getString("filedes")) == null)
							filedes = "empty";
					}
					else
						filedes = newFileDes;
					
					if(newFileTag.equals(""))
					{
						if( (filetag = rs.getString("tag")) == null)
								filetag = "empty";
					}
					else
						filetag = newFileTag;
					String strSql ="UPDATE cdug_upload_file SET filename = '" +fileName +"', filedes ='"+filedes+"' ,tag ='" +filetag +"' where filename = '" +oldFileName+"'"; 

					flag = dbctrl.ResultUpdate(strSql);
					if(flag)
					{
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='"+path+"';alert('文件信息更新成功！');\"></body>");	
						dbctrl.close();
						return;
					}
					else
					{
						response.getWriter().println("<head></head><body onload=\"javascript:parent.location='"+path+"';alert('文件信息更新失败！');\"></body>");	
						dbctrl.close();
						return;
					}
				}
				else
				{
					response.getWriter().println("<head></head><body onload=\"javascript:parent.location='"+path+"';alert('文件不存在！');\"></body>");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.getWriter().println("<head></head><body onload=\"javascript:parent.location='"+path+"/SQLcontrol.jsp';alert('"+e.getMessage()+"');\"></body>");
			}
		}
	}

}
