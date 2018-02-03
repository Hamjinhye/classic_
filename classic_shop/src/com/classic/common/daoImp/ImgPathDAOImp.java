package com.classic.common.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.classic.common.dao.ImgPathDAO;
import com.classic.common.dto.ImgPathDTO;

public class ImgPathDAOImp implements ImgPathDAO{
	private Connection conn;
	public ImgPathDAOImp(Connection conn) {
		this.conn = conn;
	}

}
