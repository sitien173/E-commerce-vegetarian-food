package com.vegetarian.mapper;

import com.vegetarian.entity.Province;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class ProvinceMapper implements RowMapper<Province> {
    public Province mapRow(ResultSet rs, int rowNum) throws SQLException {
        Province province = new Province();
        province.setProvinceId(rs.getInt("province_id"));
        province.setProvinceName(rs.getString("province_name"));
        province.setProvinceCode(rs.getString("province_code"));
        return province;
    }
}
