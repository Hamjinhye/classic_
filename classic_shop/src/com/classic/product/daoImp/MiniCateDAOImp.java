package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dao.MiniCateDAO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.util.ClassicDBConnection;

public class MiniCateDAOImp implements MiniCateDAO {
	private Connection conn = null;
	
	public MiniCateDAOImp(Connection conn) {
		this.conn=conn;
		
	}
	@Override
	public List<MiniCateDTO> selectMiniCateList(int num) throws Exception{
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		String sql = "select * from mini_cate where cate_num=? and state=1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			MiniCateDTO miniCateDTO = new MiniCateDTO();
			miniCateDTO.setCate_num(rs.getInt("cate_num"));
			miniCateDTO.setName(rs.getString("name"));
			miniCateDTO.setNum(rs.getInt("num"));
			miniCateDTO.setState(rs.getInt("state"));
			miniCateList.add(miniCateDTO);
		}
		return miniCateList;
	}
	@Override
	public List<MiniCateDTO> selectMiniCateList(PagingDTO pagingDTO, int cate, int num) throws Exception{
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		String sql = "select * from mini_cate where cate_num=? and state=1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			MiniCateDTO miniCateDTO = new MiniCateDTO();
			miniCateDTO.setCate_num(rs.getInt("cate_num"));
			miniCateDTO.setName(rs.getString("name"));
			miniCateDTO.setNum(rs.getInt("num"));
			miniCateDTO.setState(rs.getInt("state"));
			miniCateList.add(miniCateDTO);
		}
		return miniCateList;
	}
	@Override
	public List<MiniCateDTO> selectMiniCateListAll() throws Exception {
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		String sql = "select * from mini_cate where state=1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			MiniCateDTO miniCateDTO = new MiniCateDTO();
			miniCateDTO.setCate_num(rs.getInt("cate_num"));
			miniCateDTO.setName(rs.getString("name"));
			miniCateDTO.setNum(rs.getInt("num"));
			miniCateDTO.setState(rs.getInt("state"));
			miniCateList.add(miniCateDTO);
		}
		return miniCateList;
	}
	
	
/*	public static void main(String[] args) {
		Connection conn = null;
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		int cate_num = 3;
		
		try {
			conn=ClassicDBConnection.getConnection();
			MiniCateDAO miniCateDAO = new MiniCateDAOImp(conn);
			//miniCateList=miniCateDAO.selectMiniCateList(cate_num);
			miniCateList = miniCateDAO.selectMiniCateListAll();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
			
		}
		System.out.println(miniCateList);
		
	}*/

}
