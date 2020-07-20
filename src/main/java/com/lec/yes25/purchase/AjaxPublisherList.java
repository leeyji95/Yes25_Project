package com.lec.yes25.purchase;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AjaxPublisherList extends AjaxPurchaseResult {
	@JsonProperty("data")
	private List<PublisherDTO> list;  // 데이터 목록
	
	private int page; // 현재 페이지 #
	
	@JsonProperty("totalpage")
	private int totalPage; // 총 몇 '페이지' 분량?
	
	@JsonProperty("totalcnt")
	private int totalCnt; // 데이터(글)은 총 몇개?
	
	@JsonProperty("writepages")
	private int writePages; // 한[페이징]에 몇개의 '페이지'를 표현할 것인가
	
	@JsonProperty("pagerows")
	private int pageRows; // 한 '페이지' 에 몇개의 글을 리스트 할것인가

	// getter & setter
	public List<PublisherDTO> getList() {
		return list;
	}
	public void setList(List<PublisherDTO> list) {
		this.list = list;
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
