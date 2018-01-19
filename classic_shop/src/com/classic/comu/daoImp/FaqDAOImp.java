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
																	//git 01-17
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

	@Override
	public FaqDTO selectFaq(int num) throws Exception {
		FaqDTO faqDTO = null;
		String sql = "SELECT num, q_title, a_content FROM faq WHERE num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			faqDTO = new FaqDTO();
			faqDTO.setNum(rs.getInt("num"));
			faqDTO.setQ_title(rs.getString("q_title"));
			faqDTO.setA_content(rs.getString("a_content"));
		}
		return faqDTO;
	}
			
		
	
	@Override   //관리자로 이동예정
	public int insert(FaqDTO faqDTO) throws Exception {
		int insert = 0;
		String sql = "INSERT INTO REVIEWS (num,indate,goods_num,member_num,star,content) VALUES "
				+ "(reviews_seq_num.nextval,systimestamp,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, faqDTO.getNum());
		pstmt.setInt(2, faqDTO.getMem_num());
		pstmt.setString(3, faqDTO.getQ_title());
		pstmt.setString(4, faqDTO.getA_content());
		insert = pstmt.executeUpdate();
		return insert;
	}

//주석으로 빼면 에러 떠서 일단 main을 삭제 못햇는데 나중에 수정할게요 ㅠㅠ
	public static void main(String[] args) {

		Connection conn = null;
		try {
			conn = ClassicDBConnection.getConnection();
			FaqDAO faqDao = new FaqDAOImp(conn);

			for(int i=0; i<300; i++) {
				FaqDTO faqDTO = new FaqDTO();
				faqDTO.setNum(1);
				faqDTO.setMem_num(1);
				
				
				int insert=faqDao.insert(faqDTO);
				System.out.println(insert);
				System.out.println(faqDao.selectList(faqDTO,1));
				
		} }catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
	}

	@Override
	public List<FaqDTO> selectList(FaqDTO faqDTO, int num) throws Exception {

		List<FaqDTO> faqList = new ArrayList<FaqDTO>();
		String sql = "SELECT num,mum_num q_title, a_content FROM faq ORDER BY num DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			faqDTO.setNum(rs.getInt("num"));
			faqDTO.setMem_num(rs.getInt("mem_num"));
			faqDTO.setQ_title(rs.getString("q_title"));
			faqDTO.setA_content(rs.getString("a_content"));
			faqList.add(faqDTO);
		}
		return faqList;

}
	
	
	
	
	
	
	
	
	
	
}
