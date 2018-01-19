package com.classic.common.dto;

public class ImgPathDTO {

	/*
		이름          			널?       		유형            
		----------- 		-------- 	------------- 
		NUM         			NOT NULL 	NUMBER(8)     
		DATA_NUM             				NUMBER(8)     
		GUIDE_NUM            				NUMBER(8)     
		ICON_NUM             				NUMBER(8)     
		PRODUCT_NUM         			NUMBER(8)     
		REVIEW_NUM           			NUMBER(8)     
		QNA_NUM              				NUMBER(8)     
		NOTICE_NUM           			NUMBER(8)     
		BANNER_NUM           			NUMBER(8)     
		NAME        			NOT NULL 	VARCHAR2(100)
	 */
	
	private int num;
	private int data_num;
	private int guide_num;
	private int icon_num;
	private int product_num;
	private int qna_num;
	private int notice_num;
	private int banner_num;
	private String name;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getData_num() {
		return data_num;
	}
	public void setData_num(int data_num) {
		this.data_num = data_num;
	}
	public int getGuide_num() {
		return guide_num;
	}
	public void setGuide_num(int guide_num) {
		this.guide_num = guide_num;
	}
	public int getIcon_num() {
		return icon_num;
	}
	public void setIcon_num(int icon_num) {
		this.icon_num = icon_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public int getBanner_num() {
		return banner_num;
	}
	public void setBanner_num(int banner_num) {
		this.banner_num = banner_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "{\"num\" : \"" + num + "\", \"data_num\" : \"" + data_num + "\", \"guide_num\" : \"" + guide_num
				+ "\", \"icon_num\" : \"" + icon_num + "\", \"product_num\" : \"" + product_num + "\", \"qna_num\" : \""
				+ qna_num + "\", \"notice_num\" : \"" + notice_num + "\", \"banner_num\" : \"" + banner_num
				+ "\", \"name\" : \"" + name + "\"}";
	}
	
}
