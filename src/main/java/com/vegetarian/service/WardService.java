package com.vegetarian.service;

import com.vegetarian.entity.Ward;

import java.util.List;

public interface WardService {
    Ward getWard(int wardId);
    List<Ward> getAllWardByDistrictId(int districtId);
}
