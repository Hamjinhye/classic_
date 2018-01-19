package com.classic.common.dao;

import java.util.List;

import com.classic.common.dto.ImgPathDTO;

public interface ImgPathDAO {
	
	public List<ImgPathDTO> selectQnaImg(int qna_num) throws Exception;
	public int insertQnaImg(ImgPathDTO imgDTO) throws Exception;
	public int deleteQnaImg(int num) throws Exception;
	
}
