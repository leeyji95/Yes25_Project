package com.lec.yes25.product.dto;

public class CategoryDTO {
	private int rootUid;
	private String rootName;
	private int down1Uid;
	private String down1Name;
	private int down2Uid;
	private String down2Name;	
	
	public CategoryDTO() {}
	
	public CategoryDTO(int rootUid, String rootName, int down1Uid, String down1Name, int down2Uid, String down2Name) {
		super();
		this.rootUid = rootUid;
		this.rootName = rootName;
		this.down1Uid = down1Uid;
		this.down1Name = down1Name;
		this.down2Uid = down2Uid;
		this.down2Name = down2Name;
	}

	public int getRootUid() {
		return rootUid;
	}	

	public void setRootUid(int rootUid) {
		this.rootUid = rootUid;
	}
	public String getRootName() {
		return rootName;
	}
	public void setRootName(String rootName) {
		this.rootName = rootName;
	}
	public int getDown1Uid() {
		return down1Uid;
	}
	public void setDown1Uid(int down1Uid) {
		this.down1Uid = down1Uid;
	}
	public String getDown1Name() {
		return down1Name;
	}
	public void setDown1Name(String down1Name) {
		this.down1Name = down1Name;
	}
	public int getDown2Uid() {
		return down2Uid;
	}
	public void setDown2Uid(int down2Uid) {
		this.down2Uid = down2Uid;
	}
	public String getDown2Name() {
		return down2Name;
	}
	public void setDown2Name(String down2Name) {
		this.down2Name = down2Name;
	}
	
	
}
