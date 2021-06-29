package com.vegetarian.daoImpl;

import com.vegetarian.dao.UserDao;
import com.vegetarian.entity.User;
import com.vegetarian.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private UserMapper userMapper;
    
    @Override
    public User getUserByEmailL(String email) {
        String SQL = "select * from [appUser] " +
                "where appUser.email = ?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{email},userMapper);
    }

    @Override
    public User getUserByUserName(String username) {
        String SQL = "select * from [appUser] " +
                "where appUser.username = ?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{username},userMapper);
    }

    @Override
    public User getUserByPhone(String phone) {
        String SQL = "select * from [appUser] " +
                "where appUser.phone = ?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{phone},userMapper);
    }

    @Override
    public boolean insertUser(User user) {
        String SQL = "insert into [appUser](username,password,name,avatar,email,phone) " +
                     "values(?,?,?,?,?,?)";
        Object[] inputs = new Object[]{
                user.getUsername(),
                user.getPassword(),
                user.getName(),
                user.getAvatar(),
                user.getEmail(),
                user.getPhone(),
        };
       return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public boolean updateUser(User user) {
        String SQL = "UPDATE [appUser] set password=?," +
                "name=?," +
                "avatar=?," +
                "email=?," +
                "phone=?," +
                "isEnable=?," +
                "created_at=? where username = ?";
        Object[] inputs = new  Object[]{
                user.getPassword(),
                user.getName(),
                user.getAvatar(),
                user.getEmail(),
                user.getPhone(),
                user.isEnabled(),
                user.getCreatedAt(),
                user.getUsername()
        };
        return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public int[] insertAuthorizeUser(String username, Set<SimpleGrantedAuthority> grantedAuthorities) {
        String SQL = "insert into [authorizes](username,authority) values(?,?)";
        List<SimpleGrantedAuthority> authorities = new ArrayList<>(grantedAuthorities);
        return jdbcTemplate.batchUpdate(SQL, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1,username);
                ps.setString(2,authorities.get(i).getAuthority());
            }
            @Override
            public int getBatchSize() {
                return authorities.size();
            }
        });
    }

    @Override
    public Set<SimpleGrantedAuthority> getAuthorizesByUserName(String username) {
        String SQL = "select authority from [authorizes] where username = ?";
        Set<SimpleGrantedAuthority> authorities = new HashSet<>();
        jdbcTemplate.query(SQL,new Object []{username}, rs -> {
            authorities.add(new SimpleGrantedAuthority(rs.getString("authority")));
        });
        return authorities;
    }
}
