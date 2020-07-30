package com.lec.yes25.product.dto;

public class PublisherDTO {
	private int pubUid;
	private String pubName;
	private String pubNum;
	private String pubRep;
	private String pubContact;
	private String pubAddress;	
	
	public PublisherDTO() {}
	

	public PublisherDTO(int pubUid, String pubName, String pubNum, String pubRep, String pubContact,
			String pubAddress) {
		super();
		this.pubUid = pubUid;
		this.pubName = pubName;
		this.pubNum = pubNum;
		this.pubRep = pubRep;
		this.pubContact = pubContact;
		this.pubAddress = pubAddress;
	}



	public int getPubUid() {
		return pubUid;
	}

	public void setPubUid(int pubUid) {
		this.pubUid = pubUid;
	}

	public String getPubName() {
		return pubName;
	}

	public void setPubName(String pubName) {
		this.pubName = pubName;
	}

	public String getPubNum() {
		return pubNum;
	}

	public void setPubNum(String pubNum) {
		this.pubNum = pubNum;
	}

	public String getPubRep() {
		return pubRep;
	}

	public void setPubRep(String pubRep) {
		this.pubRep = pubRep;
	}

	public String getPubContact() {
		return pubContact;
	}

	public void setPubContact(String pubContact) {
		this.pubContact = pubContact;
	}

	public String getPubAddress() {
		return pubAddress;
	}

	public void setPubAddress(String pubAddress) {
		this.pubAddress = pubAddress;
	}
	
		
	
}
