package com.vegetarian.dao;

import com.vegetarian.entity.Feedback;
import java.util.List;
import java.util.Map;

public interface FeedbackDao {
    boolean insert(Feedback feedback);
    Feedback getFeedback(int id);
    List<Feedback> getAllFeedback(int status);
    List<Feedback> getAllFeedbackProduct(int productId);
    Map<Float,Integer> getRatingAndCountComment(int productId);
    boolean deleteFeedback(int id);
    boolean updateStatus(int status,int id);

}
