package com.vegetarian.daoImpl;

import com.vegetarian.dao.UserDao;
import com.vegetarian.entity.Address;
import com.vegetarian.entity.User;
import com.vegetarian.mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

@Repository
public class AddressDaoImpl  {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private AddressMapper addressMapper;

    public List<Address> getAddressByUsername(String username){
        String SQL = "select * from [address] where username = ?";
        return jdbcTemplate.query(SQL,new Object[]{username},addressMapper);
    }

    public int[] insertAddress(List<Address> list,String username){
        String SQL = "insert into [address](username,ward_id,addr) values(?,?,?)";
      return jdbcTemplate.batchUpdate(SQL, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1,username);
                ps.setInt(2,list.get(i).getWard().getWardId());
                ps.setString(3,list.get(i).getAddr());
            }
            @Override
            public int getBatchSize() {
                return list.size();
            }
        });
    }
}
