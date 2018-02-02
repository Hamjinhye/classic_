package com.classic.comu.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.comu.dao.QnaReplyDAO;
import com.classic.comu.dto.QnaReplyDTO;

public class QnaReplyDAOImp implements QnaReplyDAO{
	
	private Connection conn;
	public QnaReplyDAOImp(Connection conn) {
		this.conn = conn;
	}

	@Override
	public List<QnaReplyDTO> selectQnaReply(int qna_num) throws Exception {
		List<QnaReplyDTO> replyList = new ArrayList<QnaReplyDTO>();
		String sql = "SELECT r.*, m.id as name FROM qna_reply r, member m WHERE r.mem_num=m.num AND qna_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, qna_num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			QnaReplyDTO qnaReplyDTO = new QnaReplyDTO();
			qnaReplyDTO = new QnaReplyDTO();
			qnaReplyDTO.setNum(rs.getInt("num"));
			qnaReplyDTO.setName(rs.getString("name"));
			qnaReplyDTO.setQna_num(rs.getInt("qna_num"));
			qnaReplyDTO.setMem_num(rs.getInt("mem_num"));
			qnaReplyDTO.setContent(rs.getString("content"));
			qnaReplyDTO.setIndate(rs.getDate("indate"));
			replyList.add(qnaReplyDTO);
		}
		return replyList;
	}

}
