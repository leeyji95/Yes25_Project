package com.lec.yes25.product.controller;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lec.common.C;
import com.lec.yes25.product.dto.BookDTO;
import com.lec.yes25.product.mapper.ProductDAO;

@RestController
@RequestMapping("/products/ajax")
public class ProductRestController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}



	@RequestMapping("/list.ajax")
	public List<BookDTO> list() {
		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);
		List<BookDTO> bookList = dao.select();
		
		return bookList;
	}
	
	@RequestMapping("/insert.ajax")
	public void insert(BookDTO dto) {
		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);
		int result = dao.insert(dto);
		
	}
	

}
