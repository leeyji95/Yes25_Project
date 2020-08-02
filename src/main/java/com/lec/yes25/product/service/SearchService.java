package com.lec.yes25.product.service;

import java.util.List;

import com.lec.common.C;
import com.lec.yes25.product.dto.AjaxListResult;
import com.lec.yes25.product.dto.BookDTO;
import com.lec.yes25.product.mapper.ProductDAO;

public class SearchService {
	
	public AjaxListResult<BookDTO> execute(int page, int pageRows, String keyword, int searchOption) {
		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);

		int count = 0;		
		List<BookDTO> bookList = null;
		
		switch(searchOption) {
		case 1:
			count = dao.selectSearchCount(keyword);
			bookList = dao.selectBySearch(page, pageRows, keyword);
			break;
		case 2:
			count = dao.selectSubjectCount(keyword);
			bookList = dao.selectBySubject(page, pageRows, keyword);
			break;
		case 3:
			count = dao.selectContentCount(keyword);
			bookList = dao.selectByContent(page, pageRows, keyword);
			break;
		case 4:
			count = dao.selectAuthorCount(keyword);
			bookList = dao.selectByAuthor(page, pageRows, keyword);
			break;
		case 5:
			count = dao.selectPublisherCount(keyword);
			bookList = dao.selectByPublisher(page, pageRows, keyword);
			break;
		case 6:
			count = dao.selectCategoryCount(keyword);
			bookList = dao.selectByCategory(page, pageRows, keyword);
			break;
		
		}

		AjaxListResult<BookDTO> result = new AjaxListResult<>();
		result.setCount(count);
		result.setData(bookList);

		return result;
	}

}
