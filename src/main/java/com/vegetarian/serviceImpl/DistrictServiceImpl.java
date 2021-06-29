package com.vegetarian.serviceImpl;

import com.vegetarian.daoImpl.DistrictDao;
import com.vegetarian.entity.District;
import com.vegetarian.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistrictServiceImpl implements DistrictService {
    @Autowired
    private DistrictDao districtDao;

    @Override
    public List<District> getAllDistrict() {
        return districtDao.getAllDistrict();
    }

    @Override
    public List<District> getAllDistrict(int provinceId) {
        return districtDao.getAllDistrict(provinceId);
    }
}
