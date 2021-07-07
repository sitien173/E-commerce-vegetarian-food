package com.vegetarian.service;

import com.vegetarian.entity.Feedback;

import java.util.List;
import java.util.Map;

public interface FeedbackService {
    boolean insert(Feedback feedback);
    List<Feedback> getAllFeedback(int status);
    Map<Float,Integer> getRatingAndCountComment(int productId);
    List<Feedback> getAllFeedbackProduct(int productId);
    Feedback getFeedback(int id);
    boolean deleteFeedback(int id);
    boolean updateStatus(int status,int id);
    int totalFeedback();
}
