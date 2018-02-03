package com.classic.product.dto;

public class MiniCateDTO {
	private int num;
	private int cate_num;
	private String name;
	private int state;
	
	//cate name
	private String cate_name;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	@Override
	public String toString() {
		return "{\"num\":\"" + num + "\", \"cate_num\":\"" + cate_num + "\", \"name\":\"" + name + "\", \"state\":\""
				+ state + "\", \"cate_name\":\"" + cate_name + "\"} ";
	}
	
	
}
