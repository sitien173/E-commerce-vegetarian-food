package com.vegetarian.service;
import com.vegetarian.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.sql.SQLException;
import java.util.List;

public interface UserService extends UserDetailsService {
    boolean insertUser(User user) throws SQLException;
    User getUserByUserName(String username);
    User getUserByPhone(String phone);
    User getUserByeEmail(String email);
    boolean updateUser(User user);
    boolean deleteUser(String username);
    List<User> getAllUser();
    int totalUser();
}
