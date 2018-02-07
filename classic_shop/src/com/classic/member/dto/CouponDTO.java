package com.classic.member.dto;

import java.sql.Date;

public class CouponDTO {
/*
 		 Name                                      Null?    Type
		 ----------------------------------------- -------- -------------
		 NUM                                       NOT NULL NUMBER(8)
		 MEM_NUM                                            NUMBER(8)
		 LOG_NUM                                            NUMBER(8)
		 STATE                                              NUMBER(1)
		 INDATE                                             DATE
*/
	private int num;
	private int mem_num;
	private int log_num;
	private int state;
	private Date indate;
	
	//경미 필요 DTO
	private int total;
	private int count;
	private int allcount;
	private String name;
	
	//혜진 필요 DTO
	private String coupon_name;
	private double sale;
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public double getSale() {
		return sale;
	}
	public void setSale(double sale) {
		this.sale = sale;
	}

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

	public int getLog_num() {
		return log_num;
	}

	public void setLog_num(int log_num) {
		this.log_num = log_num;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
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

	public int getAllcount() {
		return allcount;
	}

	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}
	@Override
	public String toString() {
		return "{\"num\" : \"" + num + "\", \"mem_num\" : \"" + mem_num + "\", \"log_num\" : \"" + log_num
				+ "\", \"state\" : \"" + state + "\", \"indate\" : \"" + indate + "\", \"total\" : \"" + total
				+ "\", \"count\" : \"" + count + "\", \"allcount\" : \"" + allcount + "\", \"name\" : \"" + name
				+ "\", \"coupon_name\" : \"" + coupon_name + "\", \"sale\" : \"" + sale + "\"}";
	}

	
}
