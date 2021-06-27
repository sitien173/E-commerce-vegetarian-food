package com.vegetarian.daoImpl;

import com.vegetarian.entity.District;
import com.vegetarian.mapper.DistrictMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class DistrictDao  {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private DistrictMapper districtMapper;

    /* ---------------------------  Get District By ID ---------------------------------------*/
    public District getDistrict(int id){
        String SQL = "select * from [district] where district_id = ?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{id},districtMapper);
    }

    /* ---------------------------  Get All District By Province ID ---------------------------------------*/
    public List<District> getAllDistrict(int provinceId){
       String SQL = "select  * from [district] where province_id = ?";
        return jdbcTemplate.query(SQL,new Object[]{provinceId},districtMapper);
    }

    /* ---------------------------  Get All District ---------------------------------------*/

    public List<District> getAllDistrict(){
        String SQL = "select * from [district]";
        return jdbcTemplate.query(SQL,districtMapper);
    }
}
