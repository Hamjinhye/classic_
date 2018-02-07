package com.classic.order.service;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.order.dto.PaidDTO;

public interface OrderService {
	public int recordTotal(int mem_num);
	public List<PaidDTO> orderList(int mem_num, PagingDTO pagingDTO);
	public boolean cancelUpdate(PaidDTO paidDTO);
}
