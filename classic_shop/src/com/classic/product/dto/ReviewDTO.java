package com.classic.product.dto;

public class ReviewDTO {
	/*
	 Name                                      Null?    Type
	----------------------------------------- -------- ----------------
	NUM                                       NOT NULL NUMBER(8)
	PAID_NUM                                           NUMBER(8)
	MEM_NUM                                            NUMBER(8)
	BODY_SIZE                                          VARCHAR2(10)
	CONTENT                                   NOT NULL VARCHAR2(4000)
	STAR                                      NOT NULL NUMBER(1)
	INDATE                                             DATE
	 */
	
	
	
	private int num;
	private int paid_num;
	private String body_size;
	private String content;
	private int star;
	private String indate;
	private String id;
	private String product_name;
	private String product_size;
	private String colour_name;
	private String img_path; 
	
	
	
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getColour_name() {
		return colour_name;
	}
	public void setColour_name(String colour_name) {
		this.colour_name = colour_name;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPaid_num() {
		return paid_num;
	}
	public void setPaid_num(int paid_num) {
		this.paid_num = paid_num;
	}
	
	public String getBody_size() {
		return body_size;
	}
	public void setBody_size(String body_size) {
		this.body_size = body_size;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "{\"num\":\"" + num + "\", \"paid_num\":\"" + paid_num + "\", \"body_size\":\"" + body_size
				+ "\", \"content\":\"" + content + "\", \"star\":\"" + star + "\", \"indate\":\"" + indate
				+ "\", \"id\":\"" + id + "\", \"product_name\":\"" + product_name
				+ "\", \"product_size\":\"" + product_size + "\", \"colour_name\":\"" + colour_name
				+ "\", \"img_path\":\"" + img_path + "\"}";
	}
	
	
	
	
	
	
	
}
