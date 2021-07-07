package com.vegetarian.serviceImpl;

import com.vegetarian.dao.AddressDao;
import com.vegetarian.dao.UserDao;
import com.vegetarian.daoImpl.AddressDaoImpl;
import com.vegetarian.entity.User;
import com.vegetarian.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private AddressDao addressDao;

    @Transactional(rollbackFor = SQLException.class)
    @Override
    public boolean insertUser(User user) throws SQLException {
        if(!userDao.insertUser(user)){
            throw new SQLException("Insert user failed!");
        }else {
            addressDao.insertAddress(user.getAddress(),user.getUsername());
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
    public User getUserByeEmail(String email) {
        return userDao.getUserByEmailL(email);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public boolean deleteUser(String username) {
        return userDao.deleteUser(username);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.getUserByUserName(username);
        // Nếu không tìm thấy User thì mình thông báo lỗi
        if (user == null)
            throw new UsernameNotFoundException(String.format("Username %s not found",username));
        return user;
    }

    @Override
    public int totalUser() {
        return userDao.totalUser();
    }
}
