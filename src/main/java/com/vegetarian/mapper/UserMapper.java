package com.vegetarian.mapper;

import com.vegetarian.dao.AddressDao;
import com.vegetarian.dao.UserDao;
import com.vegetarian.daoImpl.AddressDaoImpl;
import com.vegetarian.daoImpl.UserDaoImpl;
import com.vegetarian.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class UserMapper implements RowMapper<User> {
    @Autowired
    private AddressDao addressDao;
    @Autowired
    private UserDao userDao;
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setName(rs.getString("name"));
        user.setUsername(rs.getString("username"));
        user.setAddress(addressDao.getAddressByUsername(user.getUsername()));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setAvatar(rs.getString("avatar"));
        user.setPassword(rs.getString("password"));
        user.setCreatedAt(rs.getDate("created_at"));
        user.setEnable(rs.getBoolean("isEnable"));
        user.setGrantedAuthorities(userDao.getAuthorizesByUserName(user.getUsername()));
        return user;
    }
}
