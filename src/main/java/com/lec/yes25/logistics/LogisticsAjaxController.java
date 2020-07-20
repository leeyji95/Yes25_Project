package com.lec.yes25.logistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/logistics/*.ajax")
public class LogisticsAjaxController {

	@RequestMapping("/logistics/inventory.ajax")
	public LogisticsAjaxWriteList inventory(HttpServletRequest request, HttpServletResponse response) { // TODO

		return null;
	}
	
	@RequestMapping("/logistics/list.ajax")
	public LogisticsAjaxWriteList list(HttpServletRequest request, HttpServletResponse response) { // TODO
		new ListCommand().execute(request, response);
		return bulidList(request);
	}
	
	@RequestMapping("/logistics/update.ajax")
	public LogisticAjaxWriteResult update(HttpServletRequest request, HttpServletResponse response) { // TODO
		new UpdateCommand().execute(request, response);
		return buildResult(request);
	}
	
	public LogisticAjaxWriteResult buildResult(HttpServletRequest request) {
		LogisticAjaxWriteResult result = new LogisticAjaxWriteResult();
		
		result.setStatus((String)request.getAttribute("sattus"));
		result.setMessage((String)request.getAttribute("message"));
		result.setCount((Integer)request.getAttribute("result1"));
		
		return result;
	} // end buildResult
	
	@SuppressWarnings("unchecked")
	public LogisticsAjaxWriteList bulidList(HttpServletRequest request) {
		List<LogisticsDTO> data = (List<LogisticsDTO>)request.getAttribute("data");
		LogisticsAjaxWriteList result = new LogisticsAjaxWriteList();
		result.setStatus((String)request.getAttribute("status"));
		result.setMessage((String)request.getAttribute("message"));
		
		if(data != null) {
			result.setCount(data.size());
			result.setData(data);
		}
		
		try {
			result.setPage((Integer)request.getAttribute("page"));
			result.setTotalPage((Integer)request.getAttribute("totalPage"));
			result.setWritePages((Integer)request.getAttribute("writePages"));
			result.setPageRows((Integer)request.getAttribute("pageRows"));
			result.setTotalCnt((Integer)request.getAttribute("totalCnt"));
		} catch(Exception e) {
			
		}
		
		return result;
	} // end bulidList;
		
	
	
	
	
	
	
	
	
} // end LogisticsAjaxController
