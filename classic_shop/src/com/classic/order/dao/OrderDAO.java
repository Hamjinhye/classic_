package com.classic.order.dao;

import java.util.List;

import com.classic.member.dto.CouponDTO;
import com.classic.order.dto.PaidDTO;

public interface OrderDAO {
	public List<PaidDTO> ListSelect(int mem_num) throws Exception; //주문내역
	public PaidDTO DetailSelect(int mem_num, String order_num) throws Exception; //주문상세
	public int cancelUpdate(PaidDTO paidDto) throws Exception; //주문취소시 상태업데이트
	public int shippingUpdate(String order_num) throws Exception; //수취확인시 상태업데이트
	
	
	//혜진DAO
	public int couponCount(int mem_num) throws Exception;
	public List<CouponDTO> selectCoupon(int mem_num) throws Exception;
	public int insert(PaidDTO paidDTO)  throws Exception;
}
