package com.lec.yes25.product.controller;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
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
		
		
		int result = dao.insert(new BookDTO("자바의 신", "유동근", "전설적인 자바의 신", new Date(), new Date(), 12521, 1, 1));
		result = dao.insert(new BookDTO("자바의 신", "유동근", "전설적인 자바의 신", new Date(), new Date(), 12521, 1, 1));
		result = dao.insert(new BookDTO("자바의 신", "유동근", "전설적인 자바의 신", new Date(), new Date(), 12521, 1, 1));
		result = dao.insert(new BookDTO("자바의 신", "유동근", "전설적인 자바의 신", new Date(), new Date(), 12521, 1, 1));
		System.out.println("삽입성공? " + result);
		
		result = dao.update(2, new BookDTO("신과 자바", "유동근", "전설적인 자바의 신", new Date(), new Date(), 12521, 1, 1));
		System.out.println("수정성공? " + result);
		
		List<BookDTO> bookList = dao.select();
		
		return bookList;
	}
	

}
