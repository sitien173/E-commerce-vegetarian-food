package com.vegetarian.daoImpl;


import com.vegetarian.entity.Ward;
import com.vegetarian.mapper.WardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class WardDao{
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private WardMapper wardMapper;

    /* ---------------------------  Get Ward By ID ---------------------------------------*/
    public Ward getWard(int id){
        String SQL = "select * from [ward] where ward_id = ?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{id},wardMapper);
    }

    /* ---------------------------  Get All Ward By District ID ---------------------------------------*/
    public List<Ward> getAllWard(int districtId){
        String SQL = "select  * from [ward] where district_id = ?";
        return jdbcTemplate.query(SQL,new Object[]{districtId},wardMapper);
    }

    /* ---------------------------  Get All Ward By Province ID ---------------------------------------*/
    public List<Ward> getAllWardByProvinceId(int provinceId){
        String SQL = "select  * from [ward] where province_id = ?";
        return jdbcTemplate.query(SQL,new Object[]{provinceId},wardMapper);
    }

    /* ---------------------------  Get All Ward ---------------------------------------*/

    public List<Ward> getAllWard(){
        String query = "select * from [ward]";
        return jdbcTemplate.query(query,wardMapper);
    }

}
