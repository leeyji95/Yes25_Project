package com.lec.yes25.product.dto;

import java.util.List;

public class AjaxListResult<T> extends AjaxResult {
	
	List<T> data;
	
	int page;
	int totalPage;
	int totalCnt;
	int writePages;
	int pageRows;
	
	public AjaxListResult() {}
	
	public AjaxListResult(List<T> data, int page, int totalPage, int totalCnt, int writePages, int pageRows) {
		super();
		this.data = data;
		this.page = page;
		this.totalPage = totalPage;
		this.totalCnt = totalCnt;
		this.writePages = writePages;
		this.pageRows = pageRows;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getWritePages() {
		return writePages;
	}
	public void setWritePages(int writePages) {
		this.writePages = writePages;
	}
	public int getPageRows() {
		return pageRows;
	}
	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
	}
	
	
	
}
