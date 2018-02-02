package com.classic.comu.dao;

import java.util.List;

import com.classic.comu.dto.QnaReplyDTO;

public interface QnaReplyDAO {
	
	public List<QnaReplyDTO> selectQnaReply(int qna_num) throws Exception;

}
