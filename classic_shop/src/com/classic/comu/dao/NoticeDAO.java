package com.classic.comu.dao;

import java.util.List;
import com.classic.common.dto.PagingDTO;
import com.classic.comu.dto.NoticeDTO;

public interface NoticeDAO {
	
	public List<NoticeDTO> selectNotice(PagingDTO pagingDTO) throws Exception; //notice list-paging
	public NoticeDTO selectNotice(int num) throws Exception; //notice detail
	public int noticeTotalRecord() throws Exception;//notice total
	public int selectCount(int num) throws Exception; //조회수
	public int deleteNotice(int num) throws Exception; //qna 글 삭제


	
}