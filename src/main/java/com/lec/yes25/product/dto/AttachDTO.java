package com.lec.yes25.product.dto;

import java.util.Date;

public class AttachDTO {
	
	private int attachUid;
	private String oriName;
	private String serName;
	private String fileType;
	private String uri;
	private Date regdate;
	private int fileSize;
	private int bookUid;
	
	public AttachDTO() {}	

	public AttachDTO(String oriName, String serName, String fileType, String uri, int fileSize, int bookUid) {
		super();
		this.oriName = oriName;
		this.serName = serName;
		this.fileType = fileType;
		this.uri = uri;
		this.fileSize = fileSize;
		this.bookUid = bookUid;
	}



	public int getAttachUid() {
		return attachUid;
	}

	public void setAttachUid(int attachUid) {
		this.attachUid = attachUid;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSerName() {
		return serName;
	}

	public void setSerName(String serName) {
		this.serName = serName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public int getBookUid() {
		return bookUid;
	}

	public void setBookUid(int bookUid) {
		this.bookUid = bookUid;
	}
	

}
