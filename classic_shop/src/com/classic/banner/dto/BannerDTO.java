package com.classic.banner.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

public class BannerDTO {

	/*
		 이름      		널?       			유형             
	----------		-------- 		-------------- 
	NUM        		NOT NULL 		NUMBER(8)      
	MEM_NUM             				NUMBER(8)      
	NAME       		NOT NULL 		VARCHAR2(50)   
	CONTENT             				VARCHAR2(4000) 
	START_DATE 	NOT NULL 		DATE           
	END_DATE            				DATE           
	STATE               					NUMBER(1)
	IMG_PATH							VARCHAR2(200)     
	 */

	private int num;
	private int mem_num;
	private String name;
	private String content;
	private Date start_date;
	private Date end_date;
	private int state;
	private String img_path;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		try {
			this.img_path = URLEncoder.encode(img_path, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		this.img_path = img_path;
	}
	@Override
	public String toString() {
		return "{\"num\":\"" + num + "\", \"mem_num\":\"" + mem_num + "\", \"name\":\"" + name + "\", \"content\":\""
				+ content + "\", \"start_date\":\"" + start_date + "\", \"end_date\":\"" + end_date + "\", \"state\":\""
				+ state + "\", \"img_path\":\"" + img_path + "\"} ";
	}
	
}