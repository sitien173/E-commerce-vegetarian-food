package com.vegetarian.service;


import com.vegetarian.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.sql.SQLException;

public interface UserService extends UserDetailsService {
    boolean insertUser(User user) throws SQLException;
    User getUserByUserName(String username);
    boolean updateUser(User user);
}
