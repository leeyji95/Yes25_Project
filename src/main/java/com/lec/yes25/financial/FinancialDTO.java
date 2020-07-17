package com.lec.yes25.financial;

//stmt_uid         NUMBER    NOT NULL, 전표식별번호
//stmt_date        DATE      NOT NULL, 전표 발행일자
//account_uid      NUMBER    NOT NULL, 계정과목 번호
//stmt_summary     CLOB      NOT NULL, 적요
//stmt_sum         NUMBER    NOT NULL, 금액
//stmt_writer      NUMBER    NOT NULL, 작성자
//stmt_manager     NUMBER    NOT NULL, 담당자
//stmt_approver    NUMBER    NOT NULL, 결제자
//stmt_proceed     NUMBER    DEFAULT 1 NOT NULL, 결제프로세서


public class FinancialDTO {
	private int uid;		// stmt_uid, 전표식별번호
	private String date;	// stmt_date , 전표 발행일자
	private int accountUid;	// account_uid, 계정과목 번호
	private String summary;	//stmt_summary, 적요
	private int sum;		//stmt_sum, 금액
	private int writer;		//stmt_writer, 작성자
	private int manager;	//stmt_manager, 담당자
	private int approver;	//stmt_approver, 결제자
	private int proceed;	//stmt_proceed, 결제진행사항
	
	// 생성자 생성
	public FinancialDTO() {}
	public FinancialDTO(int uid, String date, int accountUid, String summary, int sum, 
			int writer, int manager, int approver) {
		super();
		this.uid = uid;
		this.date = date;
		this.accountUid = accountUid;
		this.summary = summary;
		this.sum = sum;
		this.manager = manager;
		this.approver = approver;
		this.writer = writer;
	}
	
	// getter setter
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getAccountUid() {
		return accountUid;
	}
	public void setAccountUid(int accountUid) {
		this.accountUid = accountUid;
	}
	
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	
	public int getApprover() {
		return approver;
	}
	public void setApprover(int approver) {
		this.approver = approver;
	}
	
	public int getProceed() {
		return proceed;
	}
	public void setProceed(int proceed) {
		this.proceed = proceed;
	}
	
}