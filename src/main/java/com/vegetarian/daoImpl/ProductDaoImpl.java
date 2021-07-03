package com.vegetarian.daoImpl;

import com.vegetarian.dao.ProductDao;
import com.vegetarian.entity.Product;
import com.vegetarian.mapper.ProductMapper;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private ProductMapper productMapper;
    @Override
    public int insert(Product product) {
        String SQL = "INSERT INTO [product](name, sold, quantity, price, sale_price, category_id, description, highlight) " +
                "values(?,?,?,?,?,?,?,?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {
            @NotNull
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(
                        SQL, new String[]{"id"});
                ps.setString(1, product.getName());
                ps.setInt(2, product.getSold());
                ps.setInt(3, product.getQuantity());
                ps.setFloat(4, product.getPrice());
                ps.setFloat(5, product.getSalePrice());
                ps.setInt(6, product.getCategories().getId());
                ps.setString(7, product.getDescription());
                ps.setBoolean(8, product.isHighlight());
                return ps;
            }
            },keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public List<Product> getAllProduct(int cateId) throws EmptyResultDataAccessException {
        String SQL = "select * from [product] where category_id = ?";
        return jdbcTemplate.query(SQL,new Object[]{cateId},productMapper);
    }

    @Override
    public Product getProduct(int id) throws EmptyResultDataAccessException{
        String SQL = "select * from [product] where id=?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{id},productMapper);
    }

    @Override
    public boolean update(Product product) {
        String SQL = "update [product] set name=?,sold=?,quantity=?,price=?,sale_price=?,category_id=?,description=?,highlight=? where id=?";
        Object []inputs = new Object[]{
                product.getName(),
                product.getSold(),
                product.getQuantity(),
                product.getPrice(),
                product.getSalePrice(),
                product.getCategories().getId(),
                product.getDescription(),
                product.isHighlight(),
                product.getId(),
        };
        return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public boolean delete(int id) {
       String SQL = "delete from [product] where id=?";
       return jdbcTemplate.update(SQL,new Object[]{id}) > 0;
    }
}
