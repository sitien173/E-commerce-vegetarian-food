package com.vegetarian.api.home;

import com.google.gson.Gson;
import com.vegetarian.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    @RequestMapping(value = "/list/{productId}",
                    method = RequestMethod.GET,
                    produces = "text/plain;charset=UTF-8")
    public String getAllFeedback(@PathVariable("productId") int productId){
        return new Gson().toJson(feedbackService.getAllFeedbackProduct(productId));
    }

    @RequestMapping(value = "/list/status/{status}",
                    method = RequestMethod.GET,
                    produces = "text/plain;charset=UTF-8")
    public String getAllFeedbackByStatus(@PathVariable("status") int status){
        return new Gson().toJson(feedbackService.getAllFeedback(status));
    }

}
