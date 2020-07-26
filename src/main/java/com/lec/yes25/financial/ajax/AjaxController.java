package com.lec.yes25.financial.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lec.yes25.financial.FinancialDTO;


@RestController
@RequestMapping("/financial/*.ajax")
public class AjaxController {

	@RequestMapping("financial/list.ajax")
	public AjaxWriteList List(HttpServletRequest request, HttpServletResponse response) {
		new AjaxListCommand().execute(request, response);
		return buildList(request);
	}
	
	
	public AjaxWriteResult buildResult(HttpServletRequest request) { 
		AjaxWriteResult result = new AjaxWriteResult(); 
		
		result.setStatus((String)request.getAttribute("status")); 
		result.setMessage((String)request.getAttribute("message")); 
		result.setCount((Integer)request.getAttribute("result")); 
		return result; 
	} // end buildResult()

	public AjaxWriteList buildList(HttpServletRequest request) { 
		List<FinancialDTO> list = (List<FinancialDTO>) request.getAttribute("list");
		
		AjaxWriteList result = new AjaxWriteList(); 
		result.setStatus((String)request.getAttribute("status")); 
		result.setMessage((String)request.getAttribute("message")); 
		
		if(list != null) { 
			result.setCount(list.size());
			result.setLise(list);
		}
		
		// 페이징 할때만 필요한 것들.
		try { 
			result.setPage((Integer)request.getAttribute("page")); 
			result.setTotalPage((Integer)request.getAttribute("totalPage")); 
			result.setWritePages((Integer)request.getAttribute("writePages")); 
			result.setPageRows((Integer)request.getAttribute("pageRows")); 
			result.setTotalCnt((Integer)request.getAttribute("totalCnt")); 
		} catch(Exception e) { 
			//e.printStackTrace(); 
		} return result; 
	} // end buildList()
	
}