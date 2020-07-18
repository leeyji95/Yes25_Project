package com.lec.yes25.financial;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.fasterxml.jackson.annotation.JsonProperty;

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
	private int stmt_uid;		// stmt_uid, 전표식별번호
	@JsonProperty("regdate")
	private String regDate;	// stmt_date , 전표 발행일자
	@JsonProperty("accountuid")
	private int account_uid;	// account_uid, 계정과목 번호
	private String summary;	//stmt_summary, 적요
	private int money;		//stmt_sum, 금액
	private int writer;		//stmt_writer, 작성자
	private int manager;	//stmt_manager, 담당자
	private int approver;	//stmt_approver, 결제자
	private int proceed;	//stmt_proceed, 결제진행사항
	
	// 생성자 생성
	public FinancialDTO() {}
	public FinancialDTO(int stmt_uid, String regDate, int account_uid, String summary, int money, 
			int writer, int manager, int approver) {
		super();
		this.stmt_uid = stmt_uid;
		this.regDate = regDate;
		this.account_uid = account_uid;
		this.summary = summary;
		this.money = money;
		this.manager = manager;
		this.approver = approver;
		this.writer = writer;
	}
	
	// getter setter
	public int getStmt_uid() {
		return stmt_uid;
	}
	public void setStmt_uid(int stmt_uid) {
		this.stmt_uid = stmt_uid;
	}
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public int getAccount_uid() {
		return account_uid;
	}
	public void setAccount_uid(int account_uid) {
		this.account_uid = account_uid;
	}
	
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
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
	/*
	//들어오는값찍기위한 셋팅
	public String toStringDefault() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
    }
    public String toStringJson() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
    }    
    public String toStringMultiline() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
    public String toStringNoClass() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.NO_CLASS_NAME_STYLE);
    }    
    public String toStringNoFieldName() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.NO_FIELD_NAMES_STYLE);
    }
    public String toStringShortPrefix() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }    
    public String toStringSimple() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
    }     */   
}