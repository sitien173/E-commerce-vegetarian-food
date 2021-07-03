package com.vegetarian.entity;

import java.time.LocalDateTime;

public class Feedback {
    private int id;
    private User user;
    private Product product;
    private LocalDateTime createdAt;
    private int rated;
    private int status; // 0 đang chờ duyệt 1 đã duyệt
    private String comment;

    public Feedback() {
    }

    public Feedback(User user, Product product, LocalDateTime createdAt, int rated, int status, String comment) {
        this.user = user;
        this.product = product;
        this.createdAt = createdAt;
        this.rated = rated;
        this.status = status;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public int getRated() {
        return rated;
    }

    public void setRated(int rated) {
        this.rated = rated;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
