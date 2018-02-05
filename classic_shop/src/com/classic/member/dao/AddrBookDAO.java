package com.classic.member.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.member.dto.AddrBookDTO;


public interface AddrBookDAO {
	public List<AddrBookDTO> selectAddr(int mem_num,PagingDTO pagingDTO) throws Exception; //페이징
	public int addrBookInsert(AddrBookDTO addrBookDTO) throws Exception; //주소 등록
	public int addrBookDelete(int num, int mem_num) throws Exception; //주소 삭제
	public int addrTotalRecord(int mem_num) throws Exception;
}
