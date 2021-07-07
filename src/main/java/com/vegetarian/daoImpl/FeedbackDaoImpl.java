package com.vegetarian.daoImpl;

import com.vegetarian.dao.FeedbackDao;
import com.vegetarian.entity.Feedback;
import com.vegetarian.mapper.FeedbackMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FeedbackDaoImpl implements FeedbackDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private FeedbackMapper feedbackMapper;
    @Override
    public boolean insert(Feedback feedback) {
        String SQL = "insert into [feedback](username,product_id,rated,comment) " +
                " values(?,?,?,?)";
        Object[] inputs = new Object[]{
                feedback.getUser().getUsername(),
                feedback.getProduct().getId(),
                feedback.getRated(),
                feedback.getComment(),
        };
        return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public List<Feedback> getAllFeedback(int status) throws EmptyResultDataAccessException {
        String SQL = "select * from [feedback] where status = ?";
        return jdbcTemplate.query(SQL,new Object[]{status},feedbackMapper);
    }

    @Override
    public List<Feedback> getAllFeedbackProduct(int productId) {
        String SQL = "select * from [feedback] where status = 1 and product_id = ?";
        return jdbcTemplate.query(SQL,new Object[]{productId},feedbackMapper);
    }

    @Override
    public Map<Float, Integer> getRatingAndCountComment(int productId) {
        String SQL = "select avg(rated) as rated,count(id) as comment from [feedback] where product_id = "+productId+"";
        Map<Float,Integer> lhm = new HashMap<>();
       jdbcTemplate.query(SQL,rs -> {lhm.put(rs.getFloat("rated"),rs.getInt("comment")); });
        return lhm;
    }

    @Override
    public Feedback getFeedback(int id) throws EmptyResultDataAccessException{
        String SQL = "select * from [feedback] where id=?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{id},feedbackMapper);
    }

    @Override
    public boolean deleteFeedback(int id) {
       String SQL = "delete from [feedback] where id=?";
       return jdbcTemplate.update(SQL,new Object[]{id}) >0;
    }

    @Override
    public boolean updateStatus(int status,int id) {
        String SQL = "update [feedback] set status = ? where id = ?";
        Object[] inputs = new Object[]{status,id};
        return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public int totalFeedback() throws EmptyResultDataAccessException{
        String SQL = "select count(id) from [feedback]";
        return jdbcTemplate.queryForObject(SQL,Integer.class);
    }
}
