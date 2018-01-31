package com.classic.comu.dao;

import java.util.List;




import com.classic.common.dto.PagingDTO;

import com.classic.comu.dto.NoticeDTO;

public interface NoticeDAO {
	
	/*public List<NoticeDTO> select(Connection conn) throws Exception; //1
	public NoticeDTO select(Connection conn, int deptno) throws Exception; //2
*/	
	//public List<NoticeDTO> selectNotice() throws Exception; //notice list
	public List<NoticeDTO> selectList(PagingDTO pagingDTO) throws Exception; //notice list-paging
	//public NoticeDTO selectNotice(int num) throws Exception; //페이징 전 리스트? notice detail
	public NoticeDTO detailNotice(int num) throws Exception; //글 읽기
	public int noticeTotalRecord() throws Exception;//notice total
	public int selectCount(int num) throws Exception; //조회수

	
}