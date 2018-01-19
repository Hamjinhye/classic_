package com.classic.comu.dao;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.comu.dto.QnaDTO;


public interface QnaDAO {
	
	//public List<QnaDTO> selectQna() throws Exception; //페이징 전 qna 리스트
	public List<QnaDTO> selectQna(PagingDTO pagingDTO) throws Exception; //페이징 후 qna 리스트
	public List<QnaDTO> searchQna(int subject, String name, PagingDTO pagingDTO) throws Exception; //qna 검색
	public List<QnaDTO> selectMemQna(int mem_num, PagingDTO pagingDTO)throws Exception; //특정회원이 쓴 qna 글
	public QnaDTO detailQna(int num) throws Exception; //qna 글 읽기
	public int insertQna(QnaDTO qnaDTO) throws Exception; //qna 글 등록
	public int updateQna(QnaDTO qnaDTO) throws Exception; //qna 글 수정
	public int deleteQna(int num) throws Exception; //qna 글 삭제
	public int qnaTotalRecord() throws Exception; //qna 게시글수
	public int qnaMemTotalRecord(int mem_num) throws Exception; //특정회원의 qna 글 수
	public int count(int num) throws Exception; //qna 조회수
	
	
	

}
