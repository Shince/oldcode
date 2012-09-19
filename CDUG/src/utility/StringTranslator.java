
package utility;

public class StringTranslator
{
	public int StringBufferToInt(StringBuffer Buffer)
	{

		String strTemp = new String(Buffer);
		Integer iTemp = new Integer(strTemp);
		return iTemp.intValue();

	}

	public int StringToInt(String Buffer)
	{
		Integer iTemp = new Integer(Buffer);
		return iTemp.intValue();
	}

	/*
	 * To change the template for this generated type comment go to
	 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
	 */
	
	//处理一般字符
	public String replaceString(String strOriginal, String old_str, String new_str)
	{
		String result = new String(strOriginal);
		int idx = result.indexOf(old_str);
		while (idx > -1)
		{
			result = result.substring(0, idx) + new_str
					+ result.substring(idx + old_str.length(), result.length());
			idx = result.indexOf(old_str, idx + new_str.length());
			//System.out.println(idx);
		}
		return result;
	}
	//处理匹配标签(无过滤字符)
	public String replaceString(String strOriginal,String label_beg, String label_end,String new_label_beg,String new_label_end)
	{
		String result = new String(strOriginal);
		int idx_beg = result.indexOf(label_beg);
		int idx_end = result.indexOf(label_end);
		while (idx_end > idx_beg && idx_beg >-1)
			{
			result = result.substring(0, idx_beg) + new_label_beg
						+ result.substring(idx_beg + label_beg.length(), result.length());
			idx_end = result.indexOf(label_end);
			result = result.substring(0, idx_end) + new_label_end
						+ result.substring(idx_end+label_end.length(), result.length());
			idx_beg = result.indexOf(label_beg);
			idx_end = result.indexOf(label_end);				
			//System.out.println(result+"无过滤字符");
			}
		return result;
	}
	//处理带元素的标签(condition只是为了函数重载)
	public String replaceString(String strOriginal,String label_beg, String label_end,String new_label_beg,String new_label_end,String condition)
	{
		String result = new String(strOriginal);
		int idx_beg = result.indexOf(label_beg);
		int idx_end = result.indexOf(label_end);
		while (idx_end > idx_beg && idx_beg >-1)
			{
			condition = result.substring(result.indexOf(label_beg));
			condition = condition.substring(label_beg.length(), condition.indexOf("]"));
			//System.out.println(condition);
			label_beg = label_beg + condition +"]";
			new_label_beg = new_label_beg+condition+">";
			//System.out.println(label_beg+"!!"+new_label_beg);
			result = result.substring(0, idx_beg) + new_label_beg
						+ result.substring(idx_beg + label_beg.length(), result.length());
			idx_end = result.indexOf(label_end);
			if(idx_end > -1){
			result = result.substring(0, idx_end) + new_label_end
						+ result.substring(idx_end+label_end.length(), result.length());
			idx_beg = result.indexOf(label_beg);
			idx_end = result.indexOf(label_end);
			}
			else{
				result = result.substring(0, result.indexOf(new_label_beg)) + label_beg
				+ result.substring(result.indexOf(new_label_beg) + new_label_beg.length(), result.length());
			}
			}
		return result;
	}
	//处理匹配标签(有1个过滤字符)
	public String replaceString(String strOriginal,String label_beg, String label_end,String new_label_beg,String new_label_end,String filter,String filterto)
	{
		String result = new String(strOriginal);
		int idx_beg = result.indexOf(label_beg);
		int idx_end = result.indexOf(label_end);
		while (idx_end > idx_beg && idx_beg >-1)
			{
			result = result.substring(0, idx_beg) + new_label_beg
						+ result.substring(idx_beg + label_beg.length(), result.length());
			idx_end = result.indexOf(label_end);
			result = result.substring(0, idx_end) + new_label_end
						+ result.substring(idx_end+label_end.length(), result.length());
			
			result = result.substring(0, result.indexOf(new_label_beg)+new_label_beg.length())
						+ replaceString(result.substring(result.indexOf(new_label_beg)+new_label_beg.length(), result.indexOf(new_label_end)),filter,filterto)
						+result.substring(result.indexOf(new_label_end));
			idx_beg = result.indexOf(label_beg);
			idx_end = result.indexOf(label_end);				
			}
		return result;
	}
	//处理匹配标签(有2个过滤字符)
	public String replaceString(String strOriginal,String label_beg, String label_end,String new_label_beg,String new_label_end,String filter,String filterto,String filter2,String filterto2)
	{
		String result = new String(strOriginal);
		int cursor_beg = result.indexOf(label_beg);
		int cursor_end = result.indexOf(label_end);
		int flag = 0;
		int length;
		//处理过滤
		while(cursor_beg < cursor_end && cursor_beg > -1 && flag > -1){
			length = result.length();
			result = result.substring(0, cursor_beg+label_beg.length())
			+ replaceString(replaceString(result.substring(cursor_beg+label_beg.length(), cursor_end),filter,filterto),filter2,filterto2)
			+result.substring(cursor_end);
			cursor_end = cursor_end - (length-result.length());
			//System.out.println(cursor_beg+"&"+cursor_end+"&"+result);
			flag = result.substring(cursor_end).indexOf(label_beg);
			cursor_beg = result.substring(cursor_end).indexOf(label_beg)+cursor_end;
			cursor_end = result.substring(cursor_end+label_end.length()).indexOf(label_end)+cursor_end+label_end.length();			
			//System.out.println(cursor_beg+"&"+cursor_end+"&"+flag);
		}
		int idx_beg = result.indexOf(label_beg);
		int idx_end = result.indexOf(label_end);
		while (idx_end > idx_beg && idx_beg > -1)
			{
			//转换头标签
			result = result.substring(0, idx_beg) + new_label_beg
						+ result.substring(idx_beg + label_beg.length(), result.length());
			idx_end = result.indexOf(label_end);
			//转换尾标签
			result = result.substring(0, idx_end) + new_label_end
						+ result.substring(idx_end+label_end.length(), result.length());
			idx_beg = result.indexOf(label_beg);
			idx_end = result.indexOf(label_end);
			}
		return result;
	}
	//处理过滤字符
	public String filterString(String strOriginal,String label_beg, String label_end,String filter,String filterto)
	{
		String result = new String(strOriginal);
		int cursor_beg = result.indexOf(label_beg);
		int cursor_end = result.indexOf(label_end);
		int flag = 0;
		int length;
		//处理过滤
		while(cursor_beg < cursor_end && cursor_beg > -1 && flag > -1){
			length = result.length();
			result = result.substring(0, cursor_beg+label_beg.length())
			+ replaceString(result.substring(cursor_beg+label_beg.length(), cursor_end),filter,filterto)
			+result.substring(cursor_end);
			cursor_end = cursor_end - (length-result.length());
			//System.out.println(cursor_beg+"&"+cursor_end+"&"+result);
			flag = result.substring(cursor_end).indexOf(label_beg);
			cursor_beg = result.substring(cursor_end).indexOf(label_beg)+cursor_end;
			cursor_end = result.substring(cursor_end+label_end.length()).indexOf(label_end)+cursor_end+label_end.length();			
			//System.out.println(cursor_beg+"&"+cursor_end+"&"+flag);
		}
		return result;
	}
	public String convertToHtmlString(String strOriginalString)
	{
		strOriginalString = replaceString(strOriginalString, "&", "&amp;");
		strOriginalString = replaceString(strOriginalString, "\"", "&quot;");
		strOriginalString = replaceString(strOriginalString, " ", "&nbsp;");
		strOriginalString = replaceString(strOriginalString, "<", "&lt;");
		strOriginalString = replaceString(strOriginalString, ">", "&gt;");
		strOriginalString = replaceString(strOriginalString, "\r\n", "<br>");
		strOriginalString = replaceString(strOriginalString, "\r", "<br>");
		strOriginalString = replaceString(strOriginalString, "\n", "<br>");
		strOriginalString = replaceString(strOriginalString, "'", "''");
		strOriginalString = filterString(strOriginalString,"[","]","<br>","");
		strOriginalString = filterString(strOriginalString,"[","]","&nbsp;","");
		/*
		strOriginalString = replaceString(strOriginalString, "%", "[%]");
		strOriginalString = replaceString(strOriginalString, "-", "[-]");
		strOriginalString = replaceString(strOriginalString, "_", "[_]");
		*/
		//处理插入图片
		strOriginalString = replaceString(strOriginalString,"[img]","[/img]","<br><img src=\"","\" onload=\"javascript:if(this.clientWidth>625)this.width=625\"><br>","<br>","","&nbsp;","");
		//处理文字链接
		strOriginalString = replaceString(strOriginalString,"[url=","[/url]","<a target=_blank href=","</a>","url");
		strOriginalString = replaceString(strOriginalString,"[email=","[/email]","<a href=mailto:","</a>","email");
		//处理字体控制
		strOriginalString = replaceString(strOriginalString,"[b]","[/b]","<b>","</b>");
		strOriginalString = replaceString(strOriginalString,"[i]","[/i]","<i>","</i>");
		strOriginalString = replaceString(strOriginalString,"[u]","[/u]","<u>","</u>");
		//处理带元素的字体控制
		strOriginalString = replaceString(strOriginalString,"[color=","[/color]","<font color=","</font>","color");
		strOriginalString = replaceString(strOriginalString,"[size=","[/size]","<font size=","</font>","size");
		strOriginalString = replaceString(strOriginalString,"[align=","[/align]","<div align=","</div>","align");
		strOriginalString = replaceString(strOriginalString,"[font=","[/font]","<font face=","</font>","face");
		
		return strOriginalString;
	}
	public String convertToHtmlString_Simple(String strOriginalString)
	{
		strOriginalString = replaceString(strOriginalString, "&", "&amp;");
		strOriginalString = replaceString(strOriginalString, "\"", "&quot;");
		strOriginalString = replaceString(strOriginalString, " ", "&nbsp;");
		strOriginalString = replaceString(strOriginalString, "<", "&lt;");
		strOriginalString = replaceString(strOriginalString, ">", "&gt;");
		strOriginalString = replaceString(strOriginalString, "\r\n", "<br>");
		strOriginalString = replaceString(strOriginalString, "\r", "<br>");
		strOriginalString = replaceString(strOriginalString, "\n", "<br>");	
		strOriginalString = replaceString(strOriginalString, "'", "''");
		//strOriginalString = replaceString(strOriginalString, "[", "[[]");
		
		/*
		strOriginalString = replaceString(strOriginalString, "%", "[%]");
		strOriginalString = replaceString(strOriginalString, "-", "[-]");
		strOriginalString = replaceString(strOriginalString, "_", "[_]");
		*/
		return strOriginalString;
	}
	public String convertToSqlString(String strOriginalString)
	{
			// string = 'xxx'

			strOriginalString = replaceString(strOriginalString, "'", "''");

			return strOriginalString;
	}

}