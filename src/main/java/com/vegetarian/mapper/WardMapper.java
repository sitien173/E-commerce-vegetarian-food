package com.vegetarian.mapper;


import com.vegetarian.daoImpl.DistrictDao;
import com.vegetarian.daoImpl.ProvinceDao;
import com.vegetarian.entity.Ward;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class WardMapper implements RowMapper<Ward> {
    @Autowired
    private DistrictDao districtDao;
    @Autowired
    private ProvinceDao provinceDao;
    public Ward mapRow(ResultSet rs, int rowNum) throws SQLException {
        Ward ward = new Ward();
        ward.setWardId(rs.getInt("ward_id"));
        ward.setWardName(rs.getString("ward_name"));
        ward.setWardPrefix(rs.getString("ward_prefix"));
        ward.setDistrict(districtDao.getDistrict(rs.getInt("district_id")));
        ward.setProvince(provinceDao.getProvince(rs.getInt("province_id")));
        return ward;
    }
}
