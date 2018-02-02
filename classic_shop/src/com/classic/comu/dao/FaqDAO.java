package com.classic.comu.dao;

import java.util.List;

import com.classic.comu.dto.FaqDTO;

public interface FaqDAO {
	
	public List<FaqDTO> selectFaq() throws Exception;

}