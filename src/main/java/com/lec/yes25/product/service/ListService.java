package com.lec.yes25.product.service;

import java.util.List;

import com.lec.common.C;
import com.lec.yes25.product.dto.AjaxListResult;
import com.lec.yes25.product.dto.BookDTO;
import com.lec.yes25.product.mapper.ProductDAO;

public class ListService {
	
	public AjaxListResult<BookDTO> execute(int page, int pageRows) {
		System.out.println(page);
		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);

		int count = dao.selectCount();
		List<BookDTO> bookList = dao.select(page, pageRows);

		AjaxListResult<BookDTO> result = new AjaxListResult<>();
		result.setCount(count);
		result.setData(bookList);

		return result;
	}

}
