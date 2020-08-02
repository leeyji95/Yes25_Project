package com.lec.yes25.product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lec.common.C;
import com.lec.yes25.product.dto.AjaxListResult;
import com.lec.yes25.product.dto.BookDTO;
import com.lec.yes25.product.dto.CategoryDTO;
import com.lec.yes25.product.dto.PublisherDTO;
import com.lec.yes25.product.mapper.CategoryDAO;
import com.lec.yes25.product.mapper.ProductDAO;
import com.lec.yes25.product.mapper.PublisherDAO;
import com.lec.yes25.product.service.FileDeleteService;
import com.lec.yes25.product.service.ListService;
import com.lec.yes25.product.service.SearchService;
import com.lec.yes25.product.service.UploadService;

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
	public AjaxListResult<BookDTO> list(@RequestParam int page, @RequestParam int pageRows) {
		
		ListService lService = new ListService();
		AjaxListResult<BookDTO> result = lService.execute(page, pageRows);

		return result;
	}
	
	@RequestMapping("/search.ajax")
	public AjaxListResult<BookDTO> search(@RequestParam int page, @RequestParam int pageRows, 
			@RequestParam String keyword, @RequestParam int searchOption) {
		
		SearchService sService = new SearchService();
		AjaxListResult<BookDTO> result = sService.execute(page, pageRows, keyword, searchOption);

		return result;
	}

	@RequestMapping("/categoryList.ajax")
	public AjaxListResult<CategoryDTO> categoryList() {
		CategoryDAO dao = C.sqlSession.getMapper(CategoryDAO.class);

		List<CategoryDTO> list = dao.select();

		AjaxListResult<CategoryDTO> result = new AjaxListResult<>();
		result.setCount(list.size());
		result.setData(list);

		return result;
	}

	@RequestMapping("/publisherList.ajax")
	public AjaxListResult<PublisherDTO> pubList() {
		PublisherDAO dao = C.sqlSession.getMapper(PublisherDAO.class);

		List<PublisherDTO> list = dao.select();

		AjaxListResult<PublisherDTO> result = new AjaxListResult<>();
		result.setCount(list.size());
		result.setData(list);

		return result;
	}

	@RequestMapping("/insert.ajax")
	public int insert(@RequestBody BookDTO dto) {

		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);
		dao.insert(dto);
		return dto.getBookUid();
	}

	@RequestMapping("/upload.ajax")
	public String upload(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("bookuid") int bookUid) {
		
		UploadService upService = new UploadService();		
		upService.execute(file, session, bookUid);

		return "uploadok";

	}
	
	@RequestMapping("/imgupdate.ajax")
	public String imgUpdate(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("bookuid") int bookUid ){
		
		FileDeleteService fdService = new FileDeleteService();
		fdService.Execute(bookUid);

		UploadService upService = new UploadService();		
		upService.execute(file, session, bookUid);
		
		return "updateok";
	}
//	
//	@RequestMapping("/insert.ajax")
//	public void insert(@RequestBody String filterJSON) throws Exception {
//		
//		ObjectMapper objectMapper = new ObjectMapper();
//		
//		BookDTO dto = objectMapper.readValue(filterJSON, BookDTO.class);		
//		
//		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);
//		dao.insert(dto);
//		
//	}

	@RequestMapping("/update.ajax")
	public void update(@RequestBody BookDTO dto) {

		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);
		dao.update(dto);
		System.out.println("업데이트 성공");
	}
	
	

	@RequestMapping("/delete.ajax")
	public void delete(@RequestBody BookDTO dto) {

		int bookUid = dto.getBookUid();
		
		FileDeleteService fdService = new FileDeleteService();
		fdService.Execute(bookUid);

		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);
		dao.deleteByUid(bookUid);

	}

	@RequestMapping("/view.ajax")
	public AjaxListResult<BookDTO> view(@RequestBody BookDTO dto) {

		int bookUid = dto.getBookUid();

		ProductDAO dao = C.sqlSession.getMapper(ProductDAO.class);
		List<BookDTO> bookList = dao.selectByUid(bookUid);

		AjaxListResult<BookDTO> result = new AjaxListResult<>();
		result.setData(bookList);
		result.setCount(1);

		return result;

	}

}
