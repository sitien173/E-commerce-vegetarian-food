package com.vegetarian.daoImpl;

import com.vegetarian.dao.ItemDao;
import com.vegetarian.entity.Item;
import com.vegetarian.mapper.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ItemDaoImpl implements ItemDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private ItemMapper itemMapper;
    @Override
    public void insertItem(List<Item> items, int invoiceId) {
        String SQL = "insert into[item](invoice_id,quantity,product_id,sub_total) " +
                "values(?,?,?,?)";
        jdbcTemplate.batchUpdate(SQL, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setInt(1,invoiceId);
                ps.setInt(2,items.get(i).getQuantity());
                ps.setInt(3,items.get(i).getProduct().getId());
                ps.setDouble(4,items.get(i).getSubTotal());
            }

            @Override
            public int getBatchSize() {
                return items.size();
            }
        });

    }

    @Override
    public List<Item> getAllItemByInvoiceId(int invoiceId) throws EmptyResultDataAccessException {
        String SQL = "select * from [item] where invoice_id = ?";
        return jdbcTemplate.query(SQL,new Object[]{invoiceId},itemMapper);
    }
}
