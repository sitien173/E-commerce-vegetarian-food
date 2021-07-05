package com.vegetarian.api.home;

import com.google.gson.Gson;
import com.vegetarian.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/feedback")
public class FeedbackAPI {
    @Autowired
    private FeedbackService feedbackService;
    @GetMapping(value = "/rating-comment/{productId}",produces = "text/plain;charset=UTF-8")
    public String getAvgRatingTotalComment(@PathVariable("productId") int productId){
        Map<Float,Integer> map = feedbackService.getRatingAndCountComment(productId);
        return new Gson().toJson(map.entrySet().toArray());
    }
    @GetMapping(value = "/list/{productId}",produces = "text/plain;charset=UTF-8")
    public String getAllFeedback(@PathVariable("productId") int productId){
        return new Gson().toJson(feedbackService.getAllFeedbackProduct(productId));
    }
    @GetMapping(value = "/list/{status}",produces = "text/plain;charset=UTF-8")
    public String getAllFeedbackByStatus(@PathVariable("status") int status){
        return new Gson().toJson(feedbackService.getAllFeedback(status));
    }

}
