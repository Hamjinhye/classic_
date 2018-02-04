package com.classic.product.service;

import java.util.List;

import com.classic.common.dto.PagingDTO;
import com.classic.product.dto.CateDTO;
import com.classic.product.dto.ColourDTO;
import com.classic.product.dto.MiniCateDTO;
import com.classic.product.dto.ProductDTO;

public interface ProductService {
	public List<ProductDTO> listProduct(PagingDTO pagingDTO, int cate, int num);
	public List<ColourDTO> listColour(PagingDTO pagingDTO, int cate, int num);
	public List<MiniCateDTO> listMiniCate(PagingDTO pagingDTO, int cate, int num);
	public int recordTotal(int cate, int num);
	public CateDTO cateDTO(PagingDTO pagingDTO, int cate, int num);
	
	//product search
	public List<MiniCateDTO> forSearchCateRead();
	public List<ProductDTO> searchProduct(String name, String cate_num, int priceHigh, int priceLow, PagingDTO pagingDTO);
	public int searchCount(String name, String cate_num, int priceHigh, int priceLow);
	public List<ColourDTO> readColor();
	
	//main
	public List<ProductDTO> listNew();
	public List<ProductDTO> listBest();
}
