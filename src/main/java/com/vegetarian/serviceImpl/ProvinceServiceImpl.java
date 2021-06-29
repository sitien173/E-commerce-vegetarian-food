package com.vegetarian.serviceImpl;

import com.vegetarian.daoImpl.ProvinceDao;
import com.vegetarian.entity.Province;
import com.vegetarian.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceServiceImpl implements ProvinceService {
    @Autowired
    private ProvinceDao provinceDao;
    @Override
    public List<Province> getAllProvince() {
        return provinceDao.getAllProvince();
    }
}
