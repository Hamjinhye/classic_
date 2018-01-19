package com.classic.member.dao;

import java.util.List;

import com.classic.member.dto.AddrBookDTO;


public interface AddrBookDAO {
	public List<AddrBookDTO> addrBookSelect(int mem_num) throws Exception; //테이블 출력
	public int addrBookInsert(AddrBookDTO addrBookDTO) throws Exception; //주소 등록
	public int addrBookDelete(int num, int mem_num) throws Exception; //주소 삭제
	
}
