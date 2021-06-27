package com.vegetarian.serviceImpl;

import com.vegetarian.daoImpl.AddressDaoImpl;
import com.vegetarian.daoImpl.UserDaoImpl;
import com.vegetarian.entity.User;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {

    @Autowired
    private UserDaoImpl userDao;
    @Autowired
    private AddressDaoImpl addressDao;
    @Transactional(rollbackFor = SQLException.class)
    @Override
    public int insertUser(User user) throws SQLException {
        // insert address
        if(addressDao.insertAddress(user.getAddress(),user.getUsername()).length < user.getAddress().size())
            throw new SQLException("Insert address failed!");

        // insert authorizes
        if(userDao.insertAuthorizeUser(user.getUsername(),user.getAuthorities()).length < user.getAuthorities().size())
            throw new SQLException(("Insert authorizes failed!"));
        // insert appUser
        return userDao.insertUser(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.getUserByUserName(username);
        // Nếu không tìm thấy User thì mình thông báo lỗi
        if (user == null)
            throw new UsernameNotFoundException(String.format("Username %s not found",username));
        return user;
    }
}
