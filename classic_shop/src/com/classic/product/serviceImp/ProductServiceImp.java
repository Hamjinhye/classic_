package com.classic.product.serviceImp;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.CateDTO;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.product.dao.CateDAO;
import com.classic.product.daoImp.CateDAIOImp;
import com.classic.product.daoImp.ColourDAOImp;
import com.classic.product.daoImp.MiniCateDAOImp;
import com.classic.product.daoImp.ProductDAOImp;
import com.classic.product.daoImp.searchDAOImp;
import com.classic.product.dto.ProductDTO;
import com.classic.product.service.ProductService;
import com.classic.util.ClassicDBConnection;

public class ProductServiceImp implements ProductService{

	static Connection conn = null;
	
	@Override
	public List<ProductDTO> searchItems(PagingDTO pagingDTO, String searchField, String searchValue,
			String searchArray) {
		List<ProductDTO> searchItemList = new ArrayList<ProductDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			searchItemList = new searchDAOImp(conn).searchProduct(pagingDTO, searchField, searchValue, searchArray);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			ClassicDBConnection.close(conn);
		}
		return searchItemList;
	}

	@Override
	public int searchTotal(String searchField, String searchValue) {
		int searchCount = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			searchCount = new searchDAOImp(conn).searchCount(searchField, searchValue);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			ClassicDBConnection.close(conn);
		}
		return searchCount;
	}

	@Override
	public List<ProductDTO> listProduct(PagingDTO pagingDTO, int cate, int num) {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			productList = new ProductDAOImp(conn).selectProductList(pagingDTO, cate, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return productList;
	}

	@Override
	public int recordTotal(int cate, int num) {
		int totalRecord = 0;
		try {
			conn = ClassicDBConnection.getConnection();
			conn.setAutoCommit(false);
			conn.commit();
			totalRecord = new ProductDAOImp(conn).productTotalRecord(cate, num); //record 호출
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			ClassicDBConnection.close(conn);
		}
		return totalRecord;
	}

	@Override
	public List<ColourDTO> listColour(PagingDTO pagingDTO, int cate, int num) {
		List<ColourDTO> colourList = new ArrayList<ColourDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			colourList = new ColourDAOImp(conn).selectCateListColours(pagingDTO, cate, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return colourList;
	}

	@Override
	public List<MiniCateDTO> listMiniCate(PagingDTO pagingDTO, int cate, int num) {
		List<MiniCateDTO> miniCateList = new ArrayList<MiniCateDTO>();
		try {
			conn = ClassicDBConnection.getConnection();
			if(cate==0) {
				miniCateList = new MiniCateDAOImp(conn).selectMiniCateList(pagingDTO, cate, num);
			}
			else if(cate==1) {
				int cate_num= new CateDAIOImp(conn).selectCateNum(num);
				miniCateList = new MiniCateDAOImp(conn).selectMiniCateList(pagingDTO, cate, cate_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ClassicDBConnection.close(conn);
		}
		return miniCateList;
	}

	@Override
	public CateDTO cateDTO(PagingDTO pagingDTO, int cate, int num) {
		CateDTO cateDTO = null;
		try {
			conn=ClassicDBConnection.getConnection();
			if(cate==0) {
				cateDTO=new CateDAIOImp(conn).selectCate(num);
			}else if(cate==1) {
				int cate_num=new CateDAIOImp(conn).selectCateNum(num);
				cateDTO=new CateDAIOImp(conn).selectCate(cate_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ClassicDBConnection.close(conn);
		}
		
		
		
		return cateDTO;
	}
	

}
