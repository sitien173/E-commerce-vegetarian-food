package com.vegetarian.daoImpl;

import com.vegetarian.dao.CategoryDao;
import com.vegetarian.entity.Category;
import com.vegetarian.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDaoImpl implements CategoryDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public void insert(Category categories) {
        String SQL = "insert into[categories](name,slug) values(?,?)";
        Object []inputs = new Object[]{categories.getName(),categories.getSlug()};
        jdbcTemplate.update(SQL,inputs);
    }

    @Override
    public List<Category> getAllCategory() throws EmptyResultDataAccessException {
        String SQL = "select * from [categories]";
        return jdbcTemplate.query(SQL,categoryMapper);
    }

    @Override
    public Category getCategory(int id) throws EmptyResultDataAccessException{
        String SQL = "select * from [categories] where id=?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{id},categoryMapper);
    }

    @Override
    public boolean deleteCategory(int id) {
        String SQL = "delete from [categories] where id=?";
        Object []inputs = new Object[]{id};
       return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public boolean updateCategory(Category category) {
        String SQL = "update [categories] set name=?,slug=? where id=?";
        Object []inputs = new Object[]{
                category.getName(),
                category.getSlug(),
                category.getId(),
        };
        return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public int totalCategories() throws EmptyResultDataAccessException {
       String SQL = "select count(id) from [categories]";
       return jdbcTemplate.queryForObject(SQL,Integer.class);
    }
}
