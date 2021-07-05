package com.vegetarian.mapper;

import com.vegetarian.dao.ItemDao;
import com.vegetarian.dao.UserDao;
import com.vegetarian.entity.Invoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

@Component
public class InvoiceMapper implements RowMapper<Invoice> {
    @Autowired
    private ItemDao itemDao;
    @Autowired
    private UserDao userDao;
    @Override
    public Invoice mapRow(ResultSet rs, int rowNum) throws SQLException {
        Invoice invoice = new Invoice();
        invoice.setId(rs.getInt("id"));
        invoice.setUser(userDao.getUserByUserName(rs.getString("username")));
        Timestamp timestamp = rs.getTimestamp("created_at");
        invoice.setCreatedAt(timestamp.toLocalDateTime());
        invoice.setDescription(rs.getString("description"));
        invoice.setPayMethod(rs.getString("pay_method"));
        invoice.setSubTotal(rs.getDouble("sub_total"));
        invoice.setTotal(rs.getDouble("total"));
        invoice.setStatus(rs.getInt("status"));
        invoice.setItems(itemDao.getAllItemByInvoiceId(rs.getInt("id")));
        return invoice;
    }
}
