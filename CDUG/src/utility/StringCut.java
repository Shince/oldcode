package utility;

public class StringCut {
	//重新排列字符串为单空格相连；
	public String stringshuffle(String forsearch){
		char[] c_arr = forsearch.toCharArray();
		int str_index=0;
		String word = new String();
		while(str_index != c_arr.length){
			while((c_arr[str_index]==' ')
					|| (c_arr[str_index]=='\t')
					|| (c_arr[str_index]=='\r')
					|| (c_arr[str_index]=='\n')){
				++str_index;
				//System.out.println(str_index);
			}
			while((str_index != c_arr.length)
					&& ((c_arr[str_index]!=' ')
					&& (c_arr[str_index]!='\t')
					&& (c_arr[str_index]!='\r')
					&& (c_arr[str_index]!='\n')
					)){
				word += c_arr[str_index];
				++str_index;
				//System.out.print(str_index);
			}
			word += " ";
		}
		return word;
		//System.out.println(temp_word);
	}
	//查找到的标题高亮显示;
	public String RedColorKeyTitle(String title,String forsearch){
		StringTranslator stringtrans = new StringTranslator();
		String search = forsearch.trim(); 
		search = stringshuffle(search);
		String key = new String();
		int index=0;
		while(search.length()!=0){
			key = search.substring(index,search.substring(index).indexOf(" ")).toLowerCase();
			title = stringtrans.replaceString(title, key, "<font color=red>"+key+"</font>");
			key = search.substring(index,search.substring(index).indexOf(" ")).toUpperCase();
			title = stringtrans.replaceString(title, key, "<font color=red>"+key+"</font>");
			search = search.substring(search.substring(index).indexOf(" ")+1);
		}
		return title;
	}
}
