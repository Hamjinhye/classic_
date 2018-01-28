package com.classic.comu.dao;

import com.classic.comu.dto.QnaReplyDTO;

public interface QnaReplyDAO {
	
	public QnaReplyDTO selectQnaReply(int qna_num) throws Exception;

}
