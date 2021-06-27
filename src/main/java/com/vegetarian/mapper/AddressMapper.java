package com.vegetarian.mapper;

import com.vegetarian.daoImpl.DistrictDao;
import com.vegetarian.daoImpl.ProvinceDao;
import com.vegetarian.daoImpl.WardDao;
import com.vegetarian.entity.Address;
import com.vegetarian.entity.District;
import com.vegetarian.entity.Province;
import com.vegetarian.entity.Ward;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class AddressMapper implements RowMapper<Address> {
    @Autowired
    private WardDao wardDao;
    @Autowired
    private ProvinceDao provinceDao;
    @Autowired
    private DistrictDao districtDao;
    @Override
    public Address mapRow(ResultSet rs, int rowNum) throws SQLException {
        Address address = new Address();
        Ward ward = wardDao.getWard(rs.getInt("ward_id"));
        Province province = provinceDao.getProvince(rs.getInt("province_id"));
        District district = districtDao.getDistrict(rs.getInt("district_id"));
        address.setWard(ward);
        address.getWard().setProvince(province);
        address.getWard().setDistrict(district);
        address.setAddr(rs.getString("addr"));
        return address;
    }
}
