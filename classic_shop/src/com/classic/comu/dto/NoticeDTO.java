package com.classic.comu.dto;

import java.sql.Date;

public class NoticeDTO {

	private int num;
	private int mem_num;
	private String title;
	private String content;
	private int count;
	private Date indate;
	private String name;
	private int row_num;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRow_num() {
		return row_num;
	}
	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}
	@Override
	public String toString() {
		return "{\"num\":\"" + num + "\", \"mem_num\":\"" + mem_num + "\", \"title\":\"" + title + "\", \"content\":\""
				+ content + "\", \"count\":\"" + count + "\", \"indate\":\"" + indate + "\", \"name\":\"" + name
				+ "\", \"row_num\":\"" + row_num + "\"} ";
	}
}
