package com.lec.yes25.purchase;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lec.common.C;

@RestController
@RequestMapping(value = "/purchase/vendor/*")
public class PurchaseAjaxController {
	// MyBabatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	@RequestMapping(value="/list.ajax")
	public AjaxPublisherList list(int page, int pageRows, String searchType, String keyword) {
		// MyBatis 사용
		PurchaseDAO dao = C.sqlSession.getMapper(PurchaseDAO.class);
		
		AjaxPublisherList AjaxPublisherList = new AjaxPublisherList();
		List<PublisherDTO> list = null;
		
		// Ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";   // 기본 FAIL
		
		// 페이징 관련 세팅값들
		int writePages = 10;  // 한 [페이징] 에 몇개의 '페이지' 를 표시? (디폴트 10)
		int totalCnt = 0;    // 글은 총 몇개인지?
		int totalPage = 0;   // 총 몇 '페이지' 분량인지?
		int count = 0;
		
		String param;
		
		// page 값 : 현재 몇 페이지?
		param = Integer.toString(page);
		if(param != null && param.trim().length() != 0) {
			try {				
				page = Integer.parseInt(param);
			} catch(NumberFormatException e) {
				// 예외 처리 안함
			}
		}
		
		// pageRows 값 : '한 페이지' 에 몇개의 글?
		param = Integer.toString(pageRows);
		if(param != null && param.trim().length() != 0) {
			try {				
				pageRows = Integer.parseInt(param);
			} catch(NumberFormatException e) {
				// 예외 처리 안함
			}
		}
		
		try {
			// 글 전체 개수 구하기
			totalCnt = dao.countAll(searchType, keyword);
			
			// 총 몇 페이지 분량인가?
			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
			
			// 몇번재 row 부터 ?
			int fromRow = (page - 1) * pageRows + 1;  // ORACLE 은 1부터 ROWNUM시작
			
			list = dao.selectFromRow(fromRow, pageRows, searchType, keyword);
			
			if(list == null) {
				message.append("[리스트할 데이터가 없습니다]");
			} else {
				count = list.size();
				status = "OK";
			}
			
		} catch(Exception e) {
			//e.printStackTrace();
			message.append("[트랜잭션 에러:" + e.getMessage()+ "]");
		} // end try
		
		AjaxPublisherList.setCount(count);
		AjaxPublisherList.setStatus(status);
		AjaxPublisherList.setMessage(message.toString());
		AjaxPublisherList.setPage(page);
		AjaxPublisherList.setList(list);
		AjaxPublisherList.setTotalPage(totalPage);
		AjaxPublisherList.setTotalCnt(totalCnt);
		AjaxPublisherList.setWritePages(writePages);
		AjaxPublisherList.setPageRows(pageRows);
		
		return AjaxPublisherList;
	}
	
	@RequestMapping(value = "/pubInsert.ajax", method = RequestMethod.POST)
	public void pubInsert(PublisherDTO dto) {
		PurchaseDAO dao = C.sqlSession.getMapper(PurchaseDAO.class);
		dao.insert(dto);
	}
	
	@RequestMapping(value = "/pubView.ajax")
	public AjaxPublisherList pubView(int pub_uid) {
		// MyBatis 사용
		PurchaseDAO dao = C.sqlSession.getMapper(PurchaseDAO.class);
		
		AjaxPublisherList ajaxMyBoardList = new AjaxPublisherList();
		List<PublisherDTO> list  = null;
		
		// ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";   // 기본 FAIL
		
		String param = Integer.toString(pub_uid);
		
		// 유효성 검사
		if(param == null) {
			message.append("[유효하지 않은 parameter 0 or null]");
		} else {			
			try {
				pub_uid = Integer.parseInt(param);
				
				list = dao.selectByUid(pub_uid); // 읽기
				
				if(list == null) {
					message.append("[해당 데이터가 없습니다]");
				} else {
					status = "OK";
				}
				
			} catch (Exception e) {  
				message.append("[예외발생:" + e.getMessage() + "]");
			}
		}
		
		ajaxMyBoardList.setStatus(status);
		ajaxMyBoardList.setMessage(message.toString());
		ajaxMyBoardList.setList(list);
		
		return ajaxMyBoardList;
	}
	
	@RequestMapping(value="/pubUpdateOk.ajax", method = RequestMethod.POST)
	public AjaxPublisherList pubUpdate(PublisherDTO pub_dto) {
		// MyBatis 사용
		PurchaseDAO dao = C.sqlSession.getMapper(PurchaseDAO.class);
		
		AjaxPublisherList ajaxPublisherList = new AjaxPublisherList();
		
		int count = 0;
		
		// ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";   // 기본 FAIL

		try {			
			count = dao.update(pub_dto);
			status = "OK";
			
			if(count == 0) {
				message.append("[0 update]");
			}
			
		} catch (Exception e) {
			
		}

		ajaxPublisherList.setCount(count);
		ajaxPublisherList.setStatus(status);
		ajaxPublisherList.setMessage(message.toString());
		
		return ajaxPublisherList;
	}
	
	@RequestMapping(value="/pubDeleteOk.ajax", method=RequestMethod.POST)
	public AjaxPublisherList pubDelete(HttpServletRequest request) {
		// MyBatis 사용
		PurchaseDAO dao = C.sqlSession.getMapper(PurchaseDAO.class);
		
		AjaxPublisherList ajaxPublisherList = new AjaxPublisherList();
		
		int count = 0;
		
		// ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";   // 기본 FAIL

		// 유효성 검증
		String[] params = request.getParameterValues("pub_uid");
		int[] pub_uids = null;
		
		if(params == null || params.length == 0) {
			message.append("[유효하지 않은 parameter 0 or null]");
		} else {
			pub_uids = new int[params.length];
			try {			
				for(int i = 0; i < params.length; i++) {
					pub_uids[i] = Integer.parseInt(params[i]);
				}
				count = dao.deleteByUid(pub_uids);
				status = "OK";
				
			} catch (Exception e) {
				message.append("[유효하지 않은 parameter]" + Arrays.toString(params));
			}
		}
		
		ajaxPublisherList.setCount(count);
		ajaxPublisherList.setStatus(status);
		ajaxPublisherList.setMessage(message.toString());
		
		return ajaxPublisherList;
	}
}
