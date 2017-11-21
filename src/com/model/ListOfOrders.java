package com.model;

public class ListOfOrders {

    String userid;
    int itemId;
    int itemquantity;
    int orderid;
    String status;
    String itemName;
    String itemCategory;
    String itemDescription;
    String itemPrice;
    int locationId;

    public String getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(String itemPrice) {
        this.itemPrice = itemPrice;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int it) {
        this.itemId = it;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getItemquantity() {
        return itemquantity;
    }

    public void setItemquantity(int itemquantity) {
        this.itemquantity = itemquantity;
    }

    public String getItemName() {

        return itemName;

    }

    public void setItemName(String itemName) {

        this.itemName = itemName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    @Override
    public String toString() {
        return "ListOfOrders{" + "userid=" + userid + ", itemId=" + itemId + ", itemquantity=" + itemquantity + ", orderid=" + orderid + ", status=" + status + ", itemName=" + itemName + ", itemCategory=" + itemCategory + ", itemDescription=" + itemDescription + ", itemPrice=" + itemPrice + ", locationId=" + locationId + '}';
    }
}
