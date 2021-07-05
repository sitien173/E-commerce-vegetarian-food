package com.vegetarian.mapper;

import com.vegetarian.dao.ProductDao;
import com.vegetarian.entity.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class ItemMapper implements RowMapper<Item> {
    @Autowired
    private ProductDao productDao;
    @Override
    public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
       Item item = new Item();
       item.setProduct(productDao.getProduct(rs.getInt("product_id")));
       item.setSubTotal(rs.getDouble("sub_total"));
       item.setQuantity(rs.getInt("quantity"));
       return item;
    }
}
