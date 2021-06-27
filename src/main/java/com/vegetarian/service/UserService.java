package com.vegetarian.service;


import com.vegetarian.entity.User;

import java.sql.SQLException;

public interface UserService {
    int insertUser(User user) throws SQLException;
}
