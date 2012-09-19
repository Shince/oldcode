package Bean;
//没有被使用过的bean
public class News {
	public News() {
		setTitle("");
		setText("");
		setUseraccess(0);
	}
	private String title;
	private String text;
	private int useraccess;
	public int getUseraccess() {
		return useraccess;
	}
	public void setUseraccess(int useraccess) {
		this.useraccess = useraccess;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}
