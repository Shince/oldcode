package scms.model;

public class Course{
	private String ID;
	private String NAME;
	private String TIME;
	private String PLACE;
	private String TEACHER;
	private String POINT;
	private int DEGREE;
	private String BOOL;

	public String getNAME() {
		return NAME;
	}
	public void setNAME(String name) {
		NAME = name;
	}
	public String getTIME() {
		return TIME;
	}
	public void setTIME(String time) {
		TIME = time;
	}
	public String getID() {
		return ID;
	}
	public void setID(String id) {
		ID = id;
	}
	public int getDEGREE() {
		return DEGREE;
	}
	public void setDEGREE(int degree) {
		DEGREE = degree;
	}
	public String getTEACHER(){
		return TEACHER;
	}
	public void setTEACHER(String teacher) {
		TEACHER = teacher;
	}
	public String getPOINT(){
		return POINT;
	}
	public void setPOINT(String point) {
		POINT = point;
	}
	public String getPLACE(){
		return PLACE;
	}
	public void setPLACE(String place) {
		PLACE = place;
	}
	public String getBOOL(){
		return BOOL;
	}
	public void setBOOL(String bool) {
		BOOL = bool;
	}
	public Course()
	{
		setNAME("");
		setTIME("");
		setID("");
		setPLACE("");
		setTEACHER("");
		setPOINT("");
		setBOOL("");
	}
}
