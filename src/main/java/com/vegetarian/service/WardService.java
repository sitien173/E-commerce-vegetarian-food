package com.vegetarian.service;

import com.vegetarian.entity.Ward;

import java.util.List;

public interface WardService {
    Ward getWard(int wardId);
    List<Ward> getAllWard();
    List<Ward> getAllWardByDistrictId(int districtId);
    List<Ward> getAllWardByProvinceId(int provinceId);

}
