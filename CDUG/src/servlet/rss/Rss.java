package servlet.rss;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import utility.StringTranslator;
import DAO.DAO;

public class Rss extends HttpServlet {
	static String inFile = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\rss\\rss.xml"; 
	static String outFile = "C:\\Apache Software Foundation\\Tomcat 5.5\\webapps\\CDUG\\rss\\rss.xml"; 

	/**
	 * Constructor of the object.
	 */
	public Rss() {
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
			try 
			{ 
			javax.xml.parsers.DocumentBuilder builder = 
			javax.xml.parsers.DocumentBuilderFactory.newInstance().newDocumentBuilder(); 
			org.w3c.dom.Document doc = builder.newDocument(); 
			
			//头标签;
			org.w3c.dom.Element rss = doc.createElement("rss"); 
			rss.setAttribute("session", "2.0"); 	
			org.w3c.dom.Element channel = doc.createElement("channel");
			
			org.w3c.dom.Element title = doc.createElement("title");
			title.appendChild(doc.createTextNode("China DB2 Users Group / 中国DB2用户组")); 
			channel.appendChild(title);
			
			org.w3c.dom.Element description = doc.createElement("description");
			description.appendChild(doc.createTextNode("")); 
			channel.appendChild(description);
			
			org.w3c.dom.Element link = doc.createElement("link");
			link.appendChild(doc.createTextNode("http://www.db2china.org/CDUG/index.jsp")); 
			channel.appendChild(link);
			

			//ITEM;
			DAO dbctr = new DAO();
			java.sql.ResultSet rs = dbctr.getResultSet("select * from cdug_release_all order by id desc");
			try{
				while(rs.next()){
					String news_title = rs.getString("title_text");
					String news_id = rs.getString("id");
					String tag = rs.getString("tag");
					String folder = new String();
					folder = (tag.equals("news"))?("DB2news"):("CDUGEvent");
					org.w3c.dom.Element item = doc.createElement("item");

					org.w3c.dom.Element title_item = doc.createElement("title");
					title_item.appendChild(doc.createTextNode(news_title)); 
					item.appendChild(title_item);
						
					org.w3c.dom.Element description_item = doc.createElement("description");
					description_item.appendChild(doc.createTextNode("")); 
					item.appendChild(description_item);
						
					org.w3c.dom.Element link_item = doc.createElement("link");
					link_item.appendChild(doc.createTextNode("http://www.db2china.org/CDUG/jsp/"+folder+"/news.jsp?id="+news_id)); 
					item.appendChild(link_item);
						
					channel.appendChild(item);
				}
				dbctr.close();
			}catch (java.sql.SQLException sqle) {
				System.out.println("error!");
			}
			
			//尾标签;
			rss.appendChild(channel); 
			doc.appendChild(rss); 
			javax.xml.transform.Transformer transformer = 
			javax.xml.transform.TransformerFactory.newInstance().newTransformer(); 
			transformer.setOutputProperty(javax.xml.transform.OutputKeys.ENCODING, "UTF-8"); 
			transformer.setOutputProperty(javax.xml.transform.OutputKeys.INDENT, "yes"); 
			transformer.transform(new javax.xml.transform.dom.DOMSource(doc), 
			new javax.xml.transform.stream.StreamResult(outFile)); 
			} 
			catch (Exception e) 
			{
			System.out.println (e.getMessage()); 
			}
			request.getRequestDispatcher("/rss/rss.xml").forward(request,response);
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
