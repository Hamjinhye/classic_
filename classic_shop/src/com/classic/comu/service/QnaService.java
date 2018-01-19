package com.classic.comu.service;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.comu.dto.QnaDTO;


public interface QnaService {
	
	//public List<QnaDTO> listQna();
	public List<QnaDTO> listQna(PagingDTO pagingDTO);
	public List<QnaDTO> readMemQna(int mem_num, PagingDTO pagingDTO);
	public QnaDTO readQna(int num);
	public boolean registerQna(QnaDTO qnaDTO);
	public boolean modifyQna(QnaDTO qnaDTO);
	public boolean removeQna(int num);
	public int recordTotal();
	public int memRecordTotal(int mem_num);
	public int count(int num);
}

