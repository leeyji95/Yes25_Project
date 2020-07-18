package com.lec.yes25.financial.ajax;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.lec.yes25.financial.FinancialDTO;

public class AjaxWriteList extends AjaxWriteResult {
	@JsonProperty("data")
	private List<FinancialDTO> lise;	// 데이터 목록
	
	
	// 페이징 관련
	private int page;	// 현재 페이지
	@JsonProperty("totalpage")
	private int totalPage;	// 총 몇 페이지 분량?
	@JsonProperty("totalcnt")
	private int totalCnt;	// 글은 총 몇 개?
	@JsonProperty("writepages")
	private int writePages;	// 한 페이지에 몇 개의 페이지를 표현?
	@JsonProperty("pagerows")
	private int pageRows;	// 한 페이지에 몇개의 글들을 리스트에 보여질 것인가?
	
	
	// getter setter
	public List<FinancialDTO> getLise() {
		return lise;
	}
	public void setLise(List<FinancialDTO> lise) {
		this.lise = lise;
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