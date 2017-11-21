package com.model;

import java.sql.Blob;


public class Menu {
	int index;
	int srNo;/*
	String cafeteriaName;*/
	int itemId;
	String itemName;
	String itemCategory;
	String itemDescription;
	String itemPrice;
	Blob itemImage;
	
	/*public String getCafeteriaName() {
		return cafeteriaName;
	}
	public void setCafeteriaName(String cafeteriaName) {
		this.cafeteriaName = cafeteriaName;
	}*/
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}


	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	public String getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Blob getItemImage() {
		return itemImage;
	}
	public void setItemImage(Blob itemImage) {
		this.itemImage = itemImage;
	}

}
