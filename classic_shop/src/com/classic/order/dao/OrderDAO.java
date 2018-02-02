package com.classic.order.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.order.dto.CancelDTO;
import com.classic.order.dto.PaidDTO;
import com.classic.order.dto.RefundDTO;
import com.classic.order.dto.TradeDTO;

public interface OrderDAO {
	public List<PaidDTO> ListSelect(int mem_num,PagingDTO pagingDto) throws Exception; //주문내역
	public PaidDTO DetailSelect(int mem_num, String order_num) throws Exception; //주문상세
	public int cancelUpdate(PaidDTO paidDto) throws Exception; //주문취소시 상태업데이트
	public int shippingUpdate(String order_num) throws Exception; //수취확인시 상태업데이트
	public int tradeReturnUpdate(PaidDTO paidDto) throws Exception; //교환반품시 상태업데이트
	public int selectCount(int mem_num) throws Exception;//특정 회원의 주문 수
	


}
