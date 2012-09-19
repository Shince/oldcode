package Bean;

import java.io.Serializable;

public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public User() {
		// TODO Auto-generated constructor stub
		setUser_id("");
		setUser_access(-1);
		setPassword("");
		setUid(0);
	}
	private String user_id;
	private int user_access;
	private String password;
	private int uid;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUser_access() {
		return user_access;
	}
	public void setUser_access(int user_access) {
		this.user_access = user_access;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
}