package com.vegetarian.entity;

public class Item {
    private int id;
    private int quantity;
    private Product product;
    private Double subTotal;

    public Item() {
    }

    public Item(int quantity, Product product, Double subTotal) {
        this.quantity = quantity;
        this.product = product;
        this.subTotal = subTotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }
}
