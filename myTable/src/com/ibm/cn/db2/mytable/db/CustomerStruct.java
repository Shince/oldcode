package com.ibm.cn.db2.mytable.db;

public class CustomerStruct {
	private String name;
	private String startDate;
	private String stopDate;
	private String comment;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStopDate() {
		return stopDate;
	}
	public void setStopDate(String stopDate) {
		this.stopDate = stopDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
