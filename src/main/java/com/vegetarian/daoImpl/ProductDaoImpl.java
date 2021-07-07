package com.vegetarian.daoImpl;

import com.vegetarian.dao.ProductDao;
import com.vegetarian.entity.Product;
import com.vegetarian.mapper.ProductMapper;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

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
    public List<Product> getAllProductHighlight() {
        String SQL = "select * from [product] where highlight = 1";
        return jdbcTemplate.query(SQL,productMapper);
    }

    @Override
    public List<Product> getAllProductBestSeller() {
        String SQL = "select * from [product] order by sold DESC";
        return jdbcTemplate.query(SQL,productMapper);
    }

    @Override
    public List<Product> getProductSearchAjax(String text) throws EmptyResultDataAccessException {
        String query = "select * from dbo.[product] where upper(name) LIKE N'%"+text+"%'";
        return jdbcTemplate.query(query,productMapper);
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

    @Override
    public void updateQuantityProduct(LinkedHashMap<Integer,Integer> list) {
        String query = "update dbo.[product] set quantity=? where id = ?";
        // get the key set
        Set<Integer> keySet = list.keySet();
        Integer[] keyArray
                = keySet.toArray(new Integer[keySet.size()]);
        jdbcTemplate.batchUpdate(query, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setInt(1,list.get(keyArray[i]));
                ps.setInt(2,keyArray[i]);
            }
            @Override
            public int getBatchSize() {
                return list.size();
            }
        });
    }

    @Override
    public void updateQuantity(int quantity, int sold,int productId) {
        String SQL = "update [product] set quantity = ?,sold = ? where id= ?";
        Object[] inputs = new Object[]{quantity,sold,productId};
        jdbcTemplate.update(SQL,inputs);
    }

    @Override
    public int totalProduct() throws EmptyResultDataAccessException{
        String SQL = "select count(id) from [product]";
        return jdbcTemplate.queryForObject(SQL,Integer.class);
    }

    @Override
    public List<Product> getAllProductSaleOff() throws EmptyResultDataAccessException{
        String SQL = "select * from [product] where sale_price > 0";
        return jdbcTemplate.query(SQL,productMapper);
    }
}
