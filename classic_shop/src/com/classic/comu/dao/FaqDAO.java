package com.classic.comu.dao;


import java.util.List;

import com.classic.comu.dto.FaqDTO;

public interface FaqDAO {
	
	public List<FaqDTO> selectFaq() throws Exception;
	public FaqDTO selectFaq(int num) throws Exception;
	public List<FaqDTO> selectList(FaqDTO faqDTO,int num) throws Exception;
	public int insert(FaqDTO faqDTO) throws Exception;













}