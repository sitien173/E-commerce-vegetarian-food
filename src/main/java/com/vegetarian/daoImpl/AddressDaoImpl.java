package com.vegetarian.daoImpl;

import com.vegetarian.dao.AddressDao;
import com.vegetarian.entity.Address;
import com.vegetarian.mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AddressDaoImpl implements AddressDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private AddressMapper addressMapper;

    public Address getAddressByUsername(String username) throws EmptyResultDataAccessException {
        String SQL = "select * from [address] where username = ?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{username},addressMapper);
    }

    @Override
    public void insertAddress(Address address,String username) {
        String SQL = "insert into[address](username,ward_id,addr) values(?,?,?)";
        Object []inputs = new Object[]{
                username,
                address.getWard().getWardId(),
                address.getAddr()
        };
        jdbcTemplate.update(SQL,inputs);
    }

    @Override
    public void updateAddress(Address address, String username) {
        String SQL  = "update [address] set ward_id = ?,addr = ? where username=?";
        Object[] inputs = new Object[]{address.getWard().getWardId(),address.getAddr(),username};
        jdbcTemplate.update(SQL,inputs);
    }

}
