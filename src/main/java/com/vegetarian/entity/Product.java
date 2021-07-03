package com.vegetarian.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Min;
import java.util.List;

public class Product {
    private int id;
    @NotBlank(message = "Name not empty")
    private String name;
    private float price;
    private float salePrice;
    private int sold = 0;
    private boolean isHighlight = false;
    private int quantity;
    private String description;
    private Category categories;
    private List<Image> images;

    public Product() {
    }

    public Product(String name, float price, float salePrice, int sold, boolean isHighlight, int quantity, String description, Category categories, List<Image> images) {
        this.name = name;
        this.price = price;
        this.salePrice = salePrice;
        this.sold = sold;
        this.isHighlight = isHighlight;
        this.quantity = quantity;
        this.description = description;
        this.categories = categories;
        this.images = images;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public boolean isHighlight() {
        return isHighlight;
    }

    public void setHighlight(boolean highlight) {
        isHighlight = highlight;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategories() {
        return categories;
    }

    public void setCategories(Category categories) {
        this.categories = categories;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", salePrice=" + salePrice +
                ", sold=" + sold +
                ", isHighlight=" + isHighlight +
                ", quantity=" + quantity +
                ", description='" + description + '\'' +
                ", categories=" + categories +
                ", images=" + images +
                '}';
    }
}
