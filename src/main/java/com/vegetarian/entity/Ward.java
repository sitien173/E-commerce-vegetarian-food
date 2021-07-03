/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegetarian.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Min;
import java.io.Serializable;

/**
 *
 * @author ngosi
 */
public class Ward implements Serializable {
    private static final long serialVersionUID = -5440372534300871944L;
    @NotBlank
    @Min(1)
    private int wardId;
    private String wardName;
    private String wardPrefix;
    private Province province;
    private District district;

    public Ward() {
    }

    public Ward(int wardId, String wardName, String wardPrefix, Province province, District district) {
        this.wardId = wardId;
        this.wardName = wardName;
        this.wardPrefix = wardPrefix;
        this.province = province;
        this.district = district;
    }

    public int getWardId() {
        return wardId;
    }

    public void setWardId(int wardId) {
        this.wardId = wardId;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public String getWardPrefix() {
        return wardPrefix;
    }

    public void setWardPrefix(String wardPrefix) {
        this.wardPrefix = wardPrefix;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }
    
    
}
