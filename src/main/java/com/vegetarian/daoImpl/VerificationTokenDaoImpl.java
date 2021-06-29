package com.vegetarian.daoImpl;

import com.vegetarian.dao.VerificationTokenDao;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.mapper.VerificationTokenMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
public class VerificationTokenDaoImpl implements VerificationTokenDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private VerificationTokenMapper verificationTokenMapper;
    @Override
    public void insertVerificationToken(String username, String token) {
        String SQL = "insert into [verificationToken](username,token,expiryDate) values(?,?,?)";
        Object[]  inputs= new Object[]{
                username,
                token,
                LocalDateTime.now()
        };
        jdbcTemplate.update(SQL,inputs);
    }



    @Override
    public VerificationToken getVerificationToken(String token) {
        String SQL = "select * from [verificationToken] where token = ?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{token},verificationTokenMapper);
    }

    @Override
    public boolean deleteVerificationToken(int id, String username) {
        String SQL = "delete from [verificationToken] where id=? and username = ?";
        Object []inputs = new Object[]{id,username};
        return jdbcTemplate.update(SQL,inputs) > 0 ;
    }
}
