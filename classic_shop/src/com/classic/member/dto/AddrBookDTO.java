package com.classic.member.dto;

import java.util.Date;

public class AddrBookDTO {
/*
		 Name                                      Null?    Type
		 ----------------------------------------- -------- -------------------------
		 NUM                                       NOT NULL NUMBER(8)
		 MEM_NUM                                            NUMBER(8)
		 ZIP_CODE                                  NOT NULL VARCHAR2(21)
		 BASE_ADDR                                 NOT NULL VARCHAR2(200)
		 DETAIL_ADDR                               NOT NULL VARCHAR2(200)
*/
	private int num;
	private int mem_num;
	private String zip_code;
	private String base_addr;
	private String detail_addr;
	
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

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getBase_addr() {
		return base_addr;
	}

	public void setBase_addr(String base_addr) {
		this.base_addr = base_addr;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	@Override
	public String toString() {
		return "{\"num\":\"" + num + "\", \"mem_num\":\"" + mem_num + "\", \"zip_code\":\"" + zip_code
				+ "\", \"base_addr\":\"" + base_addr + "\", \"detail_addr\":\"" + detail_addr + "\", \"row_num\":\""
				+ row_num + "\"}";
	}
}