package com.lec.yes25.product.dto;

import java.util.Date;

public class BookDTO {
	
	private int bookUid;
	private String subject;
	private String author;
	private String content;
	private Date pubdate;
	private Date regdate;
	private int isbn;
	private int categoryUid;
	private int pubUid;
	private int attachUid;
	
	public BookDTO() {}
	
	
	
	public BookDTO(String subject, String author, String content, Date pubdate, Date regdate, int isbn, int categoryUid,
			int pubUid) {
		super();
		this.subject = subject;
		this.author = author;
		this.content = content;
		this.pubdate = pubdate;
		this.regdate = regdate;
		this.isbn = isbn;
		this.categoryUid = categoryUid;
		this.pubUid = pubUid;
	}



	public int getBookUid() {
		return bookUid;
	}
	public void setBookUid(int bookUid) {
		this.bookUid = bookUid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPubdate() {
		return pubdate;
	}
	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public int getCategoryUid() {
		return categoryUid;
	}
	public void setCategoryUid(int categoryUid) {
		this.categoryUid = categoryUid;
	}
	public int getPubUid() {
		return pubUid;
	}
	public void setPubUid(int pubUid) {
		this.pubUid = pubUid;
	}
	public int getAttachUid() {
		return attachUid;
	}
	public void setAttachUid(int attachUid) {
		this.attachUid = attachUid;
	}
	
	
	

}
