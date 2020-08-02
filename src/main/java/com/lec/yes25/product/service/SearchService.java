package com.lec.yes25.product.service;

import java.util.List;

import com.lec.common.C;
import com.lec.yes25.product.dto.AjaxListResult;
import com.lec.yes25.product.dto.BookDTO;
import com.lec.yes25.product.mapper.ProductDAO;

public class SearchService {
	
	public AjaxListResult<BookDTO> execute(int page, int pageRows, String keyword) {
		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);

		int count = dao.selectSearchCount(keyword);
		System.out.println("page" + page);
		System.out.println("pageRows" + pageRows);
		System.out.println("count"+ count);
		List<BookDTO> bookList = dao.selectBySearch(page, pageRows, keyword);

		AjaxListResult<BookDTO> result = new AjaxListResult<>();
		result.setCount(count);
		result.setData(bookList);

		return result;
	}

}
