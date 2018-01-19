package com.classic.order.dto;

public class PaidDTO {
	/*NUM              NOT NULL NUMBER(8)
	MEM_NUM                     NUMBER(8)
	PRODUCT_NUM                 NUMBER(8)
	COUPON_NUM                  NUMBER(8)
	ORDER_NUM          NOT NULL NUMBER(16)
	NAME               NOT NULL VARCHAR2(20)
	PHONE              NOT NULL NUMBER(11)
	ZIP_CODE           NOT NULL VARCHAR2(21)
	BASE_ADDR          NOT NULL VARCHAR2(200)
	DETAIL_ADDR        NOT NULL VARCHAR2(200)
	MEMO                        VARCHAR2(300)
	PAID_DATE                   DATE
	PAY_WITH           NOT NULL NUMBER(1)
	ORDER_MONEY        NOT NULL NUMBER(12)
	PAYMENT            NOT NULL NUMBER(12)
	ORDER_DATE         NOT NULL DATE
	ORDER_STATE        NOT NULL NUMBER(1)    
	-3:취소/-2:환불반품/-1:교환/0:결제대기 / 1:결제완료 / 2:주문확인 / 3:주문완료
	DEPOSIT_NAME       NOT NULL VARCHAR2(20)
	0:배송준비 / 1:배송중 /2:배송완료 /3:수취확인
	*/
	private int num;
	private int mem_num;
	private int product_num;
	private int coupon_num;
	private String order_num; //int 자리수때문에 String으로 받는다
	private String name;
	private int phone;
	private String zip_code;
	private String base_addr;
	private String detail_addr;
	private String memo;
	private String paid_date;
	private int pay_with;
	private int order_money;
	private int payment;
	private String order_date;
	private int order_state;
	private String deposit_name;
	
	//다혜 필요 DTO
	int g_num;
	String g_name;
	String g_color;
	String g_size;
	int deliv_state;
	String deliv_num;
	
	
	public String getDeliv_num() {
		return deliv_num;
	}
	public void setDeliv_num(String deliv_num) {
		this.deliv_num = deliv_num;
	}
	public int getDeliv_state() {
		return deliv_state;
	}
	public void setDeliv_state(int deliv_state) {
		this.deliv_state = deliv_state;
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
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPaid_date() {
		return paid_date;
	}
	public void setPaid_date(String paid_date) {
		this.paid_date = paid_date;
	}
	public int getPay_with() {
		return pay_with;
	}
	public void setPay_with(int pay_with) {
		this.pay_with = pay_with;
	}
	public int getOrder_money() {
		return order_money;
	}
	public void setOrder_money(int order_money) {
		this.order_money = order_money;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public String getDeposit_name() {
		return deposit_name;
	}
	public void setDeposit_name(String deposit_name) {
		this.deposit_name = deposit_name;
	}
	public int getG_num() {
		return g_num;
	}
	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_color() {
		return g_color;
	}
	public void setG_color(String g_color) {
		this.g_color = g_color;
	}
	public String getG_size() {
		return g_size;
	}
	public void setG_size(String g_size) {
		this.g_size = g_size;
	}
	@Override
	public String toString() {
		return "{ \"num\":" + num + ", \"mem_num\":" + mem_num + ", \"product_num\":" + product_num
				+ ", \"coupon_num\":" + coupon_num + ", \"order_num\":\"" + order_num + "\", \"name\":\"" + name
				+ "\", \"phone\":" + phone + ", \"zip_code\":\"" + zip_code + "\", \"base_addr\":\"" + base_addr
				+ "\", \"detail_addr\":\"" + detail_addr + "\", \"memo\":\"" + memo + "\", \"paid_date\":\"" + paid_date
				+ "\", \"pay_with\":" + pay_with + ", \"order_money\":" + order_money + ", \"payment\":"
				+ payment + ", \"order_date\":\"" + order_date + "\", \"order_state\":" + order_state
				+ ", \"deposit_name\":\"" + deposit_name + "\", \"g_num\":" + g_num + ", \"g_name\":\"" + g_name
				+ "\", \"g_color\":\"" + g_color + "\", \"g_size\":\"" + g_size + "\", \"deliv_num\":\"" + deliv_num + "\", \"deliv_state\":" + deliv_state + "}";
	}
	
	
	
	
}
