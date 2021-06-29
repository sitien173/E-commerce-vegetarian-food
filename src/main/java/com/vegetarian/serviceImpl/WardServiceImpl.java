package com.vegetarian.serviceImpl;

import com.vegetarian.daoImpl.WardDao;
import com.vegetarian.entity.Ward;
import com.vegetarian.service.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WardServiceImpl implements WardService {
    @Autowired
    private WardDao wardDao;

    @Override
    public Ward getWard(int wardId) {
        return wardDao.getWard(wardId);
    }

    @Override
    public List<Ward> getAllWard() {
        return wardDao.getAllWard();
    }

    @Override
    public List<Ward> getAllWardByDistrictId(int districtId) {
        return wardDao.getAllWard(districtId);
    }

    @Override
    public List<Ward> getAllWardByProvinceId(int provinceId) {
        return wardDao.getAllWardByProvinceId(provinceId);
    }
}
