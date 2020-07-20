package com.lec.yes25.logistics;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.common.C;
import com.lec.common.Command;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt1 = 0;
		int cnt2 = 0;
		int cnt3 = 0;
		
		LogisticsDAO dao = C.sqlSession.getMapper(LogisticsDAO.class);
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		String [] params = request.getParameterValues("order_uid");
		int [] uids = null;
		
		if(params == null || params.length == 0) {
			message.append("[유효하지 않은 parameter 0 or null]");
		} else {
			uids = new int[params.length];
			
			try {
				for (int i = 0; i < params.length; i++) {
					uids[i] = Integer.parseInt(params[i]);
				}
				cnt1 = dao.insertByUidFromOrder(uids);
				cnt2 = dao.updateByUidFromOrder(uids);
				cnt3 = dao.updateByUidFromStock(uids);

					status = "OK";
	
				
				
			} catch (NumberFormatException e) {
				message.append("[유효하지 않은 parameter]"+ Arrays.toString(params));
			} catch (Exception e) {
				message.append("[트렌잭션 에러:"+ e.getMessage() + "]");
			}
		}
		
		
		request.setAttribute("result1", cnt1);
		request.setAttribute("result2", cnt2);
		request.setAttribute("result3", cnt3);
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
		
	} // end execute
 
}// end UpdateCommand
