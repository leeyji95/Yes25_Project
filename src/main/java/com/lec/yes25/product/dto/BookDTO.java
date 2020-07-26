package com.lec.yes25.product.dto;

import java.util.Date;

public class BookDTO {
	
	private int bookUid;
	private String subject;
	private String author;
	private String content;
	private int price;
	private Date pubdate;
	private Date regdate;
	private int isbn;
	private int categoryUid;
	private String categoryName;
	private int pubUid;
	private String pubName;
	private int attachUid;
	private String serName;
	private String uri;
	
	public BookDTO() {}
	
	
	
	public BookDTO(String subject, String author, String content, int price, Date pubdate, Date regdate, int isbn, int categoryUid,
			int pubUid) {
		super();
		this.subject = subject;
		this.author = author;
		this.content = content;
		this.price = price;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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

	public String getSerName() {
		return "http://localhost:8109/yes25_project/upload/book/" + serName;
	}

	public void setSerName(String serName) {
		this.serName = serName;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getPubName() {
		return pubName;
	}


	public void setPubName(String pubName) {
		this.pubName = pubName;
	}
	
	

}
