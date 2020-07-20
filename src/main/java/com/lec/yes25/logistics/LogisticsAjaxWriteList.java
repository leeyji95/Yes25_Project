package com.lec.yes25.logistics;

import java.util.List;

import lombok.Data;

@Data
public class LogisticsAjaxWriteList extends LogisticAjaxWriteResult {
	private List<LogisticsDTO> data;
	private int page;
	private int totalPage;
	private int totalCnt;
	private int writePages;
	private int pageRows;
	
}
