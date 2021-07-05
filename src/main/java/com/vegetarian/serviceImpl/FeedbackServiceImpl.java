package com.vegetarian.serviceImpl;

import com.vegetarian.dao.FeedbackDao;
import com.vegetarian.entity.Feedback;
import com.vegetarian.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FeedbackServiceImpl implements FeedbackService {
    @Autowired
    private FeedbackDao feedbackDao;
    @Override
    public boolean insert(Feedback feedback) {
        return feedbackDao.insert(feedback);
    }

    @Override
    public List<Feedback> getAllFeedback(int status) {
        return feedbackDao.getAllFeedback(status);
    }

    @Override
    public Map<Float, Integer> getRatingAndCountComment(int productId) {
        return feedbackDao.getRatingAndCountComment(productId);
    }

    @Override
    public List<Feedback> getAllFeedbackProduct(int productId) {
        return feedbackDao.getAllFeedbackProduct(productId);
    }

    @Override
    public Feedback getFeedback(int id) {
       return feedbackDao.getFeedback(id);
    }

    @Override
    public boolean deleteFeedback(int id) {
        return feedbackDao.deleteFeedback(id);
    }

    @Override
    public boolean updateStatus(int status, int id) {
        return updateStatus(status,id);
    }
}
