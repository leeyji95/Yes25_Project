package com.lec.yes25.financial.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.common.C;
import com.lec.common.Command;

public class AjaxWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		AjaxFinancialDAO dao = C.sqlSession.getMapper(AjaxFinancialDAO.class);
		
		// ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";   // 기본 FAIL
		
		// 매개변수 받아오기
		String regDate = request.getParameter("regDate");
		int account_uid = Integer.parseInt(request.getParameter("account_uid"));
		String summary = request.getParameter("summary");
		int money = Integer.parseInt(request.getParameter("money"));
		int writer = Integer.parseInt(request.getParameter("writer"));
		int manager = Integer.parseInt(request.getParameter("manager"));
		int approver = Integer.parseInt(request.getParameter("approver"));
		
		// 유효성 체크
		//if(summary == null || summary.trim().length() == 0) {
		//	message.append("[유효하지 않은 parameter : 작성자 필수]");
		//} else if (account_uid == null || account_uid.trim().length() == 0) {
		//	message.append("[유효하지 않은 parameter : 글제목 필수]");
		//} else {
			try {
				System.out.println("실행하니??");
				cnt = dao.insert(regDate, account_uid, summary,
						money, writer, manager, approver);
				if(cnt == 0) {
					message.append("[트랙잰셕 실패: 0 insert");
				} else {
					status = "OK";
				}
				
			} catch(Exception e) {
				//e.printStackTrace();
				message.append("[트랜잭션 에러:" + e.getMessage() + "]");
			}
			
		//} // end if
		
		request.setAttribute("result", cnt);
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
		
	} // end execute()

} // end Command