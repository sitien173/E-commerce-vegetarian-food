package com.vegetarian.serviceImpl;

import com.vegetarian.daoImpl.AddressDaoImpl;
import com.vegetarian.daoImpl.UserDaoImpl;
import com.vegetarian.entity.User;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDaoImpl userDao;
    @Autowired
    private AddressDaoImpl addressDao;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Transactional(rollbackFor = SQLException.class)
    @Override
    public boolean insertUser(User user) throws SQLException {
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_USER");
        Set<SimpleGrantedAuthority> authorizes = new HashSet<>();
        authorizes.add(authority);
        user.setGrantedAuthorities(authorizes);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        if(!userDao.insertUser(user)){
            throw new SQLException("Insert user failed!");
        }else {
            if(addressDao.insertAddress(user.getAddress(),user.getUsername()).length < user.getAddress().size())
                throw new SQLException("Insert address failed!");

            // insert authorizes
            if(userDao.insertAuthorizeUser(user.getUsername(),user.getAuthorities()).length < user.getAuthorities().size())
                throw new SQLException(("Insert authorizes failed!"));
        }
        return true;
    }

    @Override
    public User getUserByUserName(String username) {
        return userDao.getUserByUserName(username);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
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
