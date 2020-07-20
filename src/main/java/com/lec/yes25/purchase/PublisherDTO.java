package com.lec.yes25.purchase;

public class PublisherDTO {
	private int pub_uid;
	private String pub_name;
	private String pub_num;
	private String pub_rep;
	private String pub_contact;
	private String pub_address;
	
	public PublisherDTO() {
		super();
	}

	public PublisherDTO(int pub_uid, String pub_name, String pub_num, String pub_rep, String pub_contact,
			String pub_address) {
		super();
		this.pub_uid = pub_uid;
		this.pub_name = pub_name;
		this.pub_num = pub_num;
		this.pub_rep = pub_rep;
		this.pub_contact = pub_contact;
		this.pub_address = pub_address;
	}
	
	// getter & setter
	public int getPub_uid() {
		return pub_uid;
	}
	public void setPub_uid(int pub_uid) {
		this.pub_uid = pub_uid;
	}
	public String getPub_name() {
		return pub_name;
	}
	public void setPub_name(String pub_name) {
		this.pub_name = pub_name;
	}
	public String getPub_num() {
		return pub_num;
	}
	public void setPub_num(String pub_num) {
		this.pub_num = pub_num;
	}
	public String getPub_rep() {
		return pub_rep;
	}
	public void setPub_rep(String pub_rep) {
		this.pub_rep = pub_rep;
	}
	public String getPub_contact() {
		return pub_contact;
	}
	public void setPub_contact(String pub_contact) {
		this.pub_contact = pub_contact;
	}
	public String getPub_address() {
		return pub_address;
	}
	public void setPub_address(String pub_address) {
		this.pub_address = pub_address;
	}
}
