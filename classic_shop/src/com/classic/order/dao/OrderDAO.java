package com.classic.order.dao;

import java.util.List;

import com.classic.order.dto.PaidDTO;

public interface OrderDAO {
	public List<PaidDTO> ListSelect(int mem_num) throws Exception; //주문내역
	public PaidDTO DetailSelect(int mem_num, String order_num) throws Exception; //주문상세
	public int cancelUpdate(PaidDTO paidDto) throws Exception; //주문취소시 상태업데이트
	public int shippingUpdate(String order_num) throws Exception; //수취확인시 상태업데이트
	
	
	


}
