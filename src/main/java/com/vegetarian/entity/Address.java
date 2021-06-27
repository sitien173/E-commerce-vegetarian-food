package com.vegetarian.entity;

import java.io.Serializable;

public class Address implements Serializable {
    private static final long serialVersionUID = -5440372534300871944L;
    private String addr;
    private Ward Ward;


    public Address(String addr, Ward ward) {
        this.addr = addr;
        Ward = ward;
    }

    public Address() {
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
