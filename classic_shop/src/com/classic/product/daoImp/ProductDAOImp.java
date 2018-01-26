package com.classic.product.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.controller.ProductDetail;
import com.classic.product.dao.ProductDAO;
import com.classic.product.dto.ProductDTO;
import com.classic.util.ClassicDBConnection;

public class ProductDAOImp implements ProductDAO{
	
	/*public static void main(String[] args) {
		
		try {
			System.out.println(new ProductDAOImp().selectProduct(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	/*public static void main(String[] args) {
		int param = 3;
		Connection conn=null;
		try {
			conn=ClassicDBConnection.getConnection();
			System.out.println(new ProductDAOImp(conn).selectProductList(param));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	

	private Connection conn=null;
	public ProductDAOImp(Connection conn) throws Exception {
		this.conn=conn;
	}
	@Override
	public List<ProductDTO> selectProductList(PagingDTO pagingDTO, int cate, int num) throws Exception {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		String sql="";
		
		if(cate==0) {
			sql="select * from product "
					+ "where cate_num in"
					+ "(select m.num from mini_cate m, cate c "
					+ "where m.cate_num=c.num and c.num=? and m.state!=0)";
			
			
		}else if(cate==1) {
			sql="SELECT * FROM PRODUCT WHERE cate_num=?";
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setName(rs.getString("name"));
			productDTO.setNum(rs.getInt("num"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setOut_time(rs.getDate("out_time"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
			productList.add(productDTO);
		}
		
		return productList;
		
	}
	@Override
	public ProductDTO selectProduct(int num) throws Exception {
		ProductDTO productDTO = null;
		String sql = "select * from product where num=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			productDTO=new ProductDTO();
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setName(rs.getString("name"));
			productDTO.setNum(rs.getInt("num"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setOut_time(rs.getDate("out_time"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
		}
		return productDTO;
	}
	@Override
	public List<ProductDTO> selectMiniCateProductList(int cate_num) throws Exception {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		String sql="SELECT * FROM PRODUCT WHERE cate_num=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cate_num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setBuy_price(rs.getInt("buy_price"));
			productDTO.setCate_num(rs.getInt("cate_num"));
			productDTO.setCode(rs.getString("code"));
			productDTO.setData_num(rs.getInt("data_num"));
			productDTO.setGuide_num(rs.getInt("guide_num"));
			productDTO.setIndate(rs.getDate("indate"));
			productDTO.setMain_info(rs.getString("main_info"));
			productDTO.setName(rs.getString("name"));
			productDTO.setNum(rs.getInt("num"));
			productDTO.setOut_ox(rs.getInt("out_ox"));
			productDTO.setOut_time(rs.getDate("out_time"));
			productDTO.setPrice(rs.getInt("price"));
			productDTO.setSale(rs.getInt("sale"));
			productDTO.setSell_ox(rs.getInt("sell_ox"));
			productDTO.setSub_info(rs.getString("sub_info"));
			productDTO.setTotal_pcs(rs.getInt("total_pcs"));
			productList.add(productDTO);
		}
		
		return productList;
	}
	@Override
	public int productTotalRecord(int cate, int num) throws Exception { //for Paigination
		int totalRecord = 0;
		String sql="";
		if(cate==0) {
			sql="select COUNT(*) as total from product "
					+ "where cate_num in"
					+ "(select m.num from mini_cate m, cate c "
					+ "where m.cate_num=c.num and c.num=? and m.state!=0)";
			
		}else if(cate==1) {
			sql="SELECT COUNT(*) as total FROM PRODUCT WHERE cate_num=?";
		}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			totalRecord = rs.getInt("total");
		}
		return totalRecord;
	}

/*	@Override
	public List<ProductDTO> searchProduct(ProductDTO productDTO, PagingDTO pagingDTO) throws Exception {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		String sql = "SELECT * FROM product WHERE"+ pagingDTO.getKeyword() +" like ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + pagingDTO.getKeyValue() + "%");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			
		}
		return productList;
	}
*/
	
}
