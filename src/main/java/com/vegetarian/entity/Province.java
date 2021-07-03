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
public class Province implements Serializable {
    private static final long serialVersionUID = -5440372534300871944L;
    @NotBlank
    @Min(1)
    private int provinceId;
    private String provinceName;
    private String provinceCode;

    public Province() {
    }
    public Province(int provinceId, String provinceName, String provinceCode) {
        this.provinceId = provinceId;
        this.provinceName = provinceName;
        this.provinceCode = provinceCode;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }
    
    
}
