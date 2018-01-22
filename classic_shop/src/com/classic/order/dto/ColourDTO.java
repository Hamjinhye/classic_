package com.classic.order.dto;

public class ColourDTO {
	/*NUM                                       NOT NULL NUMBER(8)
	PRODUCT_NUM                                        NUMBER(8)
	CODE                                      NOT NULL VARCHAR2(7)
	NAME                                      NOT NULL VARCHAR2(10)*/
	private int num;
	private int productNum;
	private String code;
	private String name;
	
	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}
	public int getProductNum() {return productNum;}
	public void setProductNum(int productNum) {this.productNum = productNum;}
	public String getCode() {return code;}
	public void setCode(String code) {this.code = code;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}

	@Override
	public String toString() {
		return "{ \"num\" : " + num + ", \"productNum\" : " + productNum + ", \"code\" : \"" + code
				+ "\", \"name\" : \"" + name + "\"}";
	}
	
}
