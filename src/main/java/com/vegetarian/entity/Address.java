package com.vegetarian.entity;

import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;

public class Address implements Serializable {
    private static final long serialVersionUID = -5440372534300871944L;
    private int id;
    @NotBlank(message = "Address not null or empty")
    private String addr;
    private Ward Ward;


    public Address(String addr, com.vegetarian.entity.Ward ward) {
        this.addr = addr;
        Ward = ward;
    }

    public Address() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Ward getWard() {
        return Ward;
    }

    public void setWard(Ward ward) {
        Ward = ward;
    }

}
