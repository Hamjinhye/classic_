package com.classic.comu.dto;

import java.util.Date;

public class QnaDTO {
/*
			Name					Null?			Type
			--------------		-------- 	-------
			NUM                  NOT NULL 	NUMBER(8)
			MEM_NUM							NUMBER(8)
			SUBJECT				NOT NULL 	NUMBER(1)
			CONTENT			NOT NULL 	VARCHAR2(4000)
			COUNT				NOT NULL 	NUMBER(8)
			SECURE				NOT NULL 	NUMBER(1)
			PWD									VARCHAR2(30)
			INDATE				NOT NULL 	DATE
	*/

	
	private int num;
	private int mem_num;
	private int subject;
	private String content;
	private int count;
	private int secure;
	private String pwd;
	private Date indate;
	
	private String name;
	private int img_num;
	private String img_name;
	private int row_num;
	
	private int reply_count;

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

	public int getSubject() {
		return subject;
	}

	public void setSubject(int subject) {
		this.subject = subject;
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

	public int getSecure() {
		return secure;
	}

	public void setSecure(int secure) {
		this.secure = secure;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public int getImg_num() {
		return img_num;
	}

	public void setImg_num(int img_num) {
		this.img_num = img_num;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	@Override
	public String toString() {
		return "{\"num\":\"" + num + "\", \"mem_num\":\"" + mem_num + "\", \"subject\":\"" + subject
				+ "\", \"content\":\"" + content + "\", \"count\":\"" + count + "\", \"secure\":\"" + secure
				+ "\", \"pwd\":\"" + pwd + "\", \"indate\":\"" + indate + "\", \"name\":\"" + name
				+ "\", \"img_num\":\"" + img_num + "\", \"img_name\":\"" + img_name + "\", \"row_num\":\"" + row_num
				+ "\", \"reply_count\":\"" + reply_count + "\"} ";
	}
	
}
