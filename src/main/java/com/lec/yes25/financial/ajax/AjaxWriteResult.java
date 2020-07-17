package com.lec.yes25.financial.ajax;

public class AjaxWriteResult {
	private int count;		// 테이터 개수
	private String status;	// 처리결과
	private String message;	// 결과 메시지
	/* 
	 { 
	 	count : ○○○, 
	 	status : ○○○, 
	 	message : ○○○ 
	 } 
	 */
	public AjaxWriteResult() {}

	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}