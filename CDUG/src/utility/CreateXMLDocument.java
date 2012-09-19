//just a example;

package utility;

import java.io.File; 
import java.io.FileOutputStream; 
import java.sql.SQLException;

import javax.xml.parsers.DocumentBuilder; 
import javax.xml.parsers.DocumentBuilderFactory; 
import javax.xml.parsers.ParserConfigurationException; 
import javax.xml.transform.Source; 
import javax.xml.transform.Transformer; 
import javax.xml.transform.TransformerFactory; 
import javax.xml.transform.dom.DOMSource; 
import javax.xml.transform.stream.StreamResult; 

import org.w3c.dom.Document; 
import org.w3c.dom.Element; 

import DAO.DAO;

public class CreateXMLDocument{ 
	private static String inFile = "d:\\rss.xml"; 
	private static String outFile = "d:\\rss.xml"; 
public static void main(String args[]) throws ParserConfigurationException, Exception{ 
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
	link.appendChild(doc.createTextNode("http://127.0.0.1/CDUG/index.jsp")); 
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
			link_item.appendChild(doc.createTextNode("http://127.0.0.1/CDUG/jsp/"+folder+"/news.jsp?id="+news_id)); 
			item.appendChild(link_item);
				
			channel.appendChild(item);
		}
		
	}catch (java.sql.SQLException sqle) {
		System.out.println("error!");
	}
	
	if(false){
		
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
	} 
	}