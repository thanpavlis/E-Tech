package com.example.Eshop.dto;

public class PDFInfoDto {

    private String orderID;
    private String address;
    private String orderDateTime;

    public PDFInfoDto(String orderID, String address, String orderDateTime) {
        this.orderID = orderID;
        this.address = address;
        this.orderDateTime = orderDateTime;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrderDateTime() {
        return orderDateTime;
    }

    public void setOrderDateTime(String orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("PDFInfoDto{orderID=").append(orderID);
        sb.append(", address=").append(address);
        sb.append(", orderDateTime=").append(orderDateTime);
        sb.append('}');
        return sb.toString();
    }

}
