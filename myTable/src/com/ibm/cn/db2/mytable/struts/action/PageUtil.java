package com.ibm.cn.db2.mytable.struts.action;

public class PageUtil {
	
	public static final int PAGESIZE = 15;
	
	public static String BuildPager(int totalRecords, int pageSize, int currentPage, String query) {
		int startPage = 1;
		int totalPages = CalculateTotalPages(totalRecords, pageSize);
		int lastPage = totalPages;

		StringBuilder sb = new StringBuilder();
		
		sb.append( "<div class=\"wrapper\"><div class=\"pagination\">" );
		
		if (currentPage != startPage) {
			sb.append( bulidHref( query, 1, "First") );
			sb.append( bulidHref( query, currentPage-1, "&laquo; Previous") );
		} else {
			sb.append( "<span class=\"disabled\">" + "First" + "</span>" );
			sb.append( "<span class=\"disabled\">" + "&laquo; Previous" + "</span>" );
		}

		//int next = currentPage+1;
        //int pre = currentPage-1;
        startPage=(currentPage+5)>totalPages?totalPages-9:currentPage-4;//中间页起始序号
        int endPage = currentPage<5 ? 10 : currentPage+5;//中间页终止序号
        
        if(startPage<1) {
        	startPage=1; //为了避免输出的时候产生负数，设置如果小于1就从序号1开始
        }
        if(totalPages<endPage){
        	endPage=totalPages;//页码+n的可能性就会产生最终输出序号大于总页码，那么就要将其控制在页码数之内
        }
		
		for (int i = startPage; i <= endPage; i++) {
			if (currentPage == i) {
				sb.append("<span class=\"current\">" + i + "</span>");
			} else {
				sb.append(  bulidHref( query, i, String.valueOf(i) ) );
			}
		}

		if (currentPage != endPage) {
			sb.append( bulidHref( query, currentPage + 1, "Next &raquo;" ) );
			sb.append( bulidHref( query, lastPage, "Last") );
		} else {
			sb.append( "<span class=\"disabled\">" + "Next &raquo;" + "</span>" );
			sb.append( "<span class=\"disabled\">" + "Last" + "</span>" );
		}

		sb.append( "</div></div>" );
		return sb.toString();
	}

	private static int CalculateTotalPages(int totalRecords, int pageSize) {
		int totalPagesAvailable;

		totalPagesAvailable = totalRecords / pageSize;

		if ((totalRecords % pageSize) > 0)
			totalPagesAvailable++;

		return totalPagesAvailable;
	}
	
	private static String bulidHref( String query, int page, String hrefName ){
		String strTemp = "<a href='/myTable/pagination.do?custID=" + query + "&page=" + page + "'>" + hrefName + "</a>";
		//String strTemp = "<input type=\"button\" onclick=\"sendAjax('/myTable/query.do?page=" + page + "&custID=" + query + "');\" value=\"" + hrefName + "\" class=\"submit\" />";
		return strTemp;
	}
	
	public static void main(String args[]){
		System.out.println( PageUtil.BuildPager(2067, 15, 1, "9999999") );		
	}
}
