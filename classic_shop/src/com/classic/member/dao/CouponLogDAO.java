package com.classic.member.dao;

import java.util.List;

import com.classic.member.dto.CouponDTO;
import com.classic.member.dto.CouponLogDTO;

public interface CouponLogDAO {
	public List<CouponLogDTO> couponLogSelect(int mem_num) throws Exception; //리스트 출력
}

