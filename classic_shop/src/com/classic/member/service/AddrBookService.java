package com.classic.member.service;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.member.dto.AddrBookDTO;

public interface AddrBookService {
	public List<AddrBookDTO> listAddr(int mem_num, PagingDTO pagingDTO);
	public boolean registerAddr(AddrBookDTO addrDTO);
	public int memRecordTotal(int mem_num);
}
