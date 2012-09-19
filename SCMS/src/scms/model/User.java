package scms.model;

public class User{
	private String ID;
	private String NAME;
	private String PASSWORD;
	private int CONDITION;
	private String ADDRESS;
	private String PHONE;
	private String GRADE;

	public String getNAME() {
		return NAME;
	}
	public void setNAME(String name) {
		NAME = name;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String password) {
		PASSWORD = password;
	}
	public String getID() {
		return ID;
	}
	public void setID(String id) {
		ID = id;
	}
	public int getCONDITION() {
		return CONDITION;
	}
	public void setCONDITION(int condition) {
		CONDITION = condition;
	}
	public String getPHONE(){
		return PHONE;
	}
	public void setPHONE(String phone) {
		PHONE = phone;
	}
	public String getGRADE(){
		return GRADE;
	}
	public void setGRADE(String grade) {
		GRADE = grade;
	}
	public String getADDRESS(){
		return ADDRESS;
	}
	public void setADDRESS(String address) {
		ADDRESS = address;
	}
	public User()
	{
		setNAME("JavaBean");
		setPASSWORD("");
		setID("");
		setADDRESS("");
		setPHONE("");
		setGRADE("");
	}
}
