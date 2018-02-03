package com.classic.comu.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.comu.dao.FaqDAO;
import com.classic.comu.dto.FaqDTO;
import com.classic.util.ClassicDBConnection;

public class FaqDAOImp implements FaqDAO{
	private Connection conn;
	public FaqDAOImp(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public List<FaqDTO> selectFaq() throws Exception {
		List<FaqDTO> faqList = new ArrayList<FaqDTO>();
		String sql = "SELECT num, q_title, a_content FROM faq ORDER BY num DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			FaqDTO faqDTO = new FaqDTO();
			faqDTO.setNum(rs.getInt("num"));
			faqDTO.setQ_title(rs.getString("q_title"));
			faqDTO.setA_content(rs.getString("a_content"));
			faqList.add(faqDTO);
		}
		return faqList;
	}
}
