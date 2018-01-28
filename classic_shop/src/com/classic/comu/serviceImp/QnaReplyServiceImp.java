package com.classic.comu.serviceImp;

import java.sql.Connection;

import com.classic.comu.daoImp.QnaReplyDAOImp;
import com.classic.comu.dto.QnaReplyDTO;
import com.classic.comu.service.QnaReplyService;
import com.classic.util.ClassicDBConnection;

public class QnaReplyServiceImp implements QnaReplyService{
	
	static Connection conn = null;

	@Override
	public QnaReplyDTO readQnaReply(int qna_num) {
		QnaReplyDTO qnaReplyDTO = null;
		try {
			conn = ClassicDBConnection.getConnection();
			qnaReplyDTO = new QnaReplyDAOImp(conn).selectQnaReply(qna_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return qnaReplyDTO;
	}

}
