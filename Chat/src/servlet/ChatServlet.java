package servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.io.IOException;

public class ChatServlet  extends HttpServlet
{
    public void service(HttpServletRequest request,HttpServletResponse response)
        throws IOException,ServletException
	{
        request.setCharacterEncoding("UTF-8");
        String msg = request.getParameter("chatMsg");
        if ( msg != null && !msg.equals(""))
        {
            String user = (String)request.getSession(true).getAttribute("user");
            ChatService.instance().addMsg(user , msg);
        }
        //����������
        response.setContentType("text/html;charset=GBK");
        PrintWriter out =  response.getWriter();
        out.println(ChatService.instance().getMsg());
	}
}