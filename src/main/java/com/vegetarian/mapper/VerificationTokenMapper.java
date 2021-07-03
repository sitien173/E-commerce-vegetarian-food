package com.vegetarian.mapper;


import com.vegetarian.dao.UserDao;
import com.vegetarian.entity.VerificationToken;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
@Component
public class VerificationTokenMapper implements RowMapper<VerificationToken> {
    @Autowired
    private UserDao userService;
    @Override
    public VerificationToken mapRow(ResultSet rs, int rowNum) throws SQLException {
        VerificationToken verificationToken = new VerificationToken();
        verificationToken.setId(rs.getInt("id"));
        verificationToken.setToken(rs.getString("token"));
        verificationToken.setUser(userService.getUserByUserName(rs.getString("username")));
        Timestamp timestamp = rs.getTimestamp("expiryDate");
        verificationToken.setExpiryDate(timestamp.toLocalDateTime());
        return verificationToken;
    }
}
