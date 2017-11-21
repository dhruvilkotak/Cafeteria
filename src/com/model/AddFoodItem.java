package com.model;

import java.sql.Blob;

public class AddFoodItem {

	int ItemId;
	String FoodItemName;
	String ItemCategory;
	String ItemDescription;
	String ItemPrice;
	Blob ItemImage;
	int srNo;
        public int getSrNo() {
                return srNo;
        }
        public void setSrNo(int srNo) {
                this.srNo = srNo;
        }
	public int getItemId() {
		return ItemId;
	}
	
	public void setItemId(int ItemId) {
		this.ItemId = ItemId;
	}
	public String getFoodItemName() {
		return FoodItemName;
	}
	
	public void setFoodItemName(String FoodItemName) {
		this.FoodItemName = FoodItemName;
	}
	
	
	public String getItemCategory() {
		return ItemCategory;
	}
	
	public void setItemCategory(String ItemCategory) {
		this.ItemCategory = ItemCategory;
	}
	
	
	
	public String getItemDescription() {
		return ItemDescription;
	}
	
	public void setItemDescription(String ItemDescription) {
		this.ItemDescription = ItemDescription;
	}
	
	
	
	
	
	
	public String getItemPrice() {
		return ItemPrice;
	}
	
	public void setItemPrice(String ItemPrice) {
		this.ItemPrice = ItemPrice;
	}
	
	
	
	
	
	public Blob getItemImage() {
		return ItemImage;
	}
	
	public void setItemImage(Blob ItemImage) {
		this.ItemImage = ItemImage;
	}
	
}
