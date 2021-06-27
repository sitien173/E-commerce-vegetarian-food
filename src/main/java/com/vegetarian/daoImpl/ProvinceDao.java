package com.vegetarian.daoImpl;

import com.vegetarian.entity.Province;
import com.vegetarian.mapper.ProvinceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class ProvinceDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private ProvinceMapper provinceMapper;

    /* ---------------------------  Get District By Province ID ---------------------------------------*/
    public List<Province> getAllProvince(){
        String SQL = "select * from dbo.[province]";
        return jdbcTemplate.query(SQL,provinceMapper);
    }

    /* ---------------------------  Get Province By Province ID ---------------------------------------*/
    public Province getProvince(int id){
        String query = "select * from dbo.[province] where province_id = ?";
        return jdbcTemplate.queryForObject(query,new Object[]{id},provinceMapper);
    }
}
