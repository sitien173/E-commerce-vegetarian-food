package com.vegetarian.mapper;

import com.vegetarian.daoImpl.ProvinceDao;
import com.vegetarian.entity.District;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class DistrictMapper implements RowMapper<District> {
        @Autowired
        private ProvinceDao provinceDao;
    public District mapRow(ResultSet rs, int rowNum) throws SQLException {
            District district = new District();
            district.setDistrictId(rs.getInt("district_id"));
            district.setDistrictName(rs.getString("district_name"));
            district.setDistrictPrefix(rs.getString("district_prefix"));
            district.setProvince(provinceDao.getProvince(rs.getInt("province_id")));
            return district;
        }

}
