package com.vegetarian.mapper;

import com.vegetarian.dao.ProductDao;
import com.vegetarian.dao.UserDao;
import com.vegetarian.entity.Feedback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class FeedbackMapper implements RowMapper<Feedback> {
    @Autowired
    private UserDao userDao;
    @Autowired
    private ProductDao productDao;
    @Override
    public Feedback mapRow(ResultSet rs, int rowNum) throws SQLException {
        Feedback feedback = new Feedback();
        feedback.setId(rs.getInt("id"));
        feedback.setUser(userDao.getUserByUserName(rs.getString("username")));
        feedback.setProduct(productDao.getProduct(rs.getInt("product_id")));
        feedback.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        feedback.setRated(rs.getInt("rated"));
        feedback.setStatus(rs.getInt("status"));
        feedback.setComment(rs.getString("comment"));
        return feedback;
    }
}
