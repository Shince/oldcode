package com.ibm.cn.db2.mytable.bean;

import java.util.ArrayList;

public class Customer implements java.io.Serializable{
	private String name;
	private String startDate;
	private String stopDate;
	private String comment;
	private ArrayList workerList;
	
	public Customer(){
		this.workerList = new ArrayList();
	}
	
	public ArrayList getWorkerList() {
		return workerList;
	}
	public void addWorkerList(ArrayList workerList) {
		this.workerList.addAll( workerList );
	}
	public void addWorker ( String name ){
		this.workerList.add(name);
	}
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
