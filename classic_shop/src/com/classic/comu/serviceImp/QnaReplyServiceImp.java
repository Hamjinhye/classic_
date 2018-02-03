package com.classic.comu.serviceImp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.classic.comu.daoImp.QnaReplyDAOImp;
import com.classic.comu.dto.QnaReplyDTO;
import com.classic.comu.service.QnaReplyService;
import com.classic.util.ClassicDBConnection;

public class QnaReplyServiceImp implements QnaReplyService{
	
	static Connection conn = null;

	@Override
	public List<QnaReplyDTO> readQnaReply(int qna_num) {
		List<QnaReplyDTO> replyList = new ArrayList<QnaReplyDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			replyList = new QnaReplyDAOImp(conn).selectQnaReply(qna_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return replyList;
	}

}
