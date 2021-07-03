package com.vegetarian.entity;

import java.math.BigInteger;

public class Image {
    private int id;
    private String location;

    public Image() {
    }

    public Image(String location) {
        this.location = location;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
