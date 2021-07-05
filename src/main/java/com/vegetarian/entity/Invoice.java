package com.vegetarian.entity;

import javax.swing.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Invoice {
    private int id;
    private User user;
    private LocalDateTime createdAt;
    private String description;
    private int status; // 0 đang chờ xử lí 1 đã xử lí 2 đang giao 3 đã giao 4 yêu cầu huỷ đơn 5 xác nhận huỷ đơn
    private String payMethod;
    private Double subTotal;
    private Double total;
    private List<Item> items = new ArrayList<>();

    public Invoice() {
    }

    public Invoice(User user, LocalDateTime createdAt, String description, int status, String payMethod, Double subTotal, Double total, List<Item> items) {
        this.user = user;
        this.createdAt = createdAt;
        this.description = description;
        this.status = status;
        this.payMethod = payMethod;
        this.subTotal = subTotal;
        this.total = total;
        this.items = items;
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Invoice{" +
                "id=" + id +
                ", user=" + user +
                ", createdAt=" + createdAt +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", payMethod='" + payMethod + '\'' +
                ", subTotal=" + subTotal +
                ", total=" + total +
                ", items=" + items +
                '}';
    }
}
