/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegetarian.entity;

import java.io.Serializable;

/**
 *
 * @author ngosi
 */
public class District implements Serializable {
    private static final long serialVersionUID = -5440372534300871944L;
    private int districtId ;
    private String districtName;
    private String districtPrefix;
    private Province province;

    public District() {
    }

    public District(int districtId, String districtName, String districtPrefix, Province province) {
        this.districtId = districtId;
        this.districtName = districtName;
        this.districtPrefix = districtPrefix;
        this.province = province;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictPrefix() {
        return districtPrefix;
    }

    public void setDistrictPrefix(String districtPrefix) {
        this.districtPrefix = districtPrefix;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }


}
