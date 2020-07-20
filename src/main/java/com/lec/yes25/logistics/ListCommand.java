package com.lec.yes25.logistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.common.C;
import com.lec.common.Command;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		LogisticsDAO dao = C.sqlSession.getMapper(LogisticsDAO.class);
		List<LogisticsDTO> arr = null;
		
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
	
		int page =1;
		int pageRows = 5;
		int writePages = 5;
		int totalCnt = 0;
		int totalPage = 0;
		
		String param;
		
		param = request.getParameter("page");
		if(param != null && param.trim().length() != 0) {
			try {
				page = Integer.parseInt(param);
			} catch(NumberFormatException e) {
				
			}
		}
				
		param = request.getParameter("pagerows");
		if(param != null && param.trim().length() != 0) {
			try {
				pageRows = Integer.parseInt(param);
			} catch(NumberFormatException e) {
				
			}
		}
		
		try {
			
			totalCnt = dao.countAll();
			
			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
			
			int fromRow = (page -1) * pageRows + 1;
			
			arr =dao.selectFromRow(fromRow, pageRows);
			
			if(arr == null) {
				message.append("[리스트할 데이터가 없습니다]");
			} else { 
				status = "OK";
			}
			
		} catch(Exception e) {
			message.append("[트랜잭션 에러:" + e.getMessage()+ "]");
		} // end try
		
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
		request.setAttribute("data", arr);
		
		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("writePages", writePages);
		request.setAttribute("pageRows", pageRows);
		request.setAttribute("totalCnt", totalCnt);
		
		
		
		
		
		
		
		
		
		
	} // end execute

	
	
	
	
	
	
	
	
	
} // end ListCommand
