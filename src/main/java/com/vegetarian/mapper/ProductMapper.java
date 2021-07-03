package com.vegetarian.mapper;

import com.vegetarian.dao.CategoryDao;
import com.vegetarian.dao.ImageDao;
import com.vegetarian.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class ProductMapper implements RowMapper<Product> {
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private ImageDao imageDao;

    @Override
    public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setSold(rs.getInt("sold"));
        product.setQuantity(rs.getInt("quantity"));
        product.setPrice(rs.getFloat("price"));
        product.setSalePrice(rs.getFloat("sale_price"));
        product.setCategories(categoryDao.getCategory(rs.getInt("category_id")));
        product.setDescription(rs.getString("description"));
        product.setHighlight(rs.getBoolean("highlight"));
        product.setImages(imageDao.getAllImage(product.getId()));
        return product;
    }
}
