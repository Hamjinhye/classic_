package com.classic.member.dto;

import java.sql.Date;

import java.sql.Date;

public class CouponLogDTO {
/*
		 Name                                      Null?    Type
		 ----------------------------------------- -------- ------------------
		 NUM                                       NOT NULL NUMBER(8)
		 GRADE                                              NUMBER(1)
		 STATE                                              NUMBER(1)
		 ISSUE                                              NUMBER(1)
		 NAME                                               VARCHAR2(50)
		 SALE                                      NOT NULL NUMBER(2)
		 CONTENT                                            VARCHAR2(200)
		 START_DATE                                NOT NULL DATE
		 END_DATE                                  NOT NULL DATE
		 TOTAL                                     NOT NULL NUMBER(4)
		 COUNT                                              NUMBER(4)
*/
	private int num;
	private int grade;
	private int state;
	private int issue;
	private int sale;
	private int total;
	private int count;
	private String name;
	private String content;
	private Date start_date;
	private Date end_date;
	
	private int c_num;
	private int c_state;
		
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getC_state() {
		return c_state;
	}
	public void setC_state(int c_state) {
		this.c_state = c_state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getIssue() {
		return issue;
	}
	public void setIssue(int issue) {
		this.issue = issue;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "{\"num\":\"" + num + "\", \"grade\":\"" + grade + "\", \"state\":\"" + state + "\", \"issue\":\""
				+ issue + "\", \"sale\":\"" + sale + "\", \"total\":\"" + total + "\", \"count\":\"" + count
				+ "\", \"name\":\"" + name + "\", \"content\":\"" + content + "\", \"start_date\":\"" + start_date
				+ "\", \"end_date\":\"" + end_date + "\", \"c_num\":\"" + c_num + "\", \"c_state\":\"" + c_state
				+ "\"}";
	}
}
