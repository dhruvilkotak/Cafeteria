package com.model;

import java.sql.Blob;

public class CartItemList {
	int id;
	int itemId;
	String qty;
	String itemName;
	String itemCategory;
	String itemDescription;
	String itemPrice;
	Blob itemImage;
	int srNo;
	String cafeteriaName;
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public String getCafeteriaName() {
		return cafeteriaName;
	}
	public void setCafeteriaName(String cafeteriaName) {
		this.cafeteriaName = cafeteriaName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
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

    @Override
    public String toString() {
        return "CartItemList{" + "id=" + id + ", itemId=" + itemId + ", qty=" + qty + ", itemName=" + itemName + ", itemCategory=" + itemCategory + ", itemDescription=" + itemDescription + ", itemPrice=" + itemPrice + ", itemImage=" + itemImage + '}';
    }
}
