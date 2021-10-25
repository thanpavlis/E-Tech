package com.example.Eshop.dto;

public class CartProductDto {

    private int id;
    private String name;
    private double price;
    private int stock;
    private String imageUrl;
    private int quantity;
    private double total;

    public CartProductDto(int id, String name, double price, int stock, String imageUrl) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.imageUrl = imageUrl;
        this.quantity = 1;
        this.total = this.quantity * this.price;
    }

    public void calcTotal() {
        this.total = this.quantity * this.price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CartProduct{id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", price=").append(price);
        sb.append(", stock=").append(stock);
        sb.append(", imageUrl=").append(imageUrl);
        sb.append(", quantity=").append(quantity);
        sb.append(", total=").append(total);
        sb.append('}');
        return sb.toString();
    }

}
