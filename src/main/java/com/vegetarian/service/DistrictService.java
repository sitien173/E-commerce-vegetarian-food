package com.vegetarian.service;

import com.vegetarian.entity.District;

import java.util.List;

public interface DistrictService {
    List<District> getAllDistrict();
    List<District> getAllDistrict(int provinceId);
}
