package com.classic.comu.service;

import java.util.List;

import com.classic.comu.dto.QnaReplyDTO;

public interface QnaReplyService {
	
	public List<QnaReplyDTO> readQnaReply(int qna_num);

}
