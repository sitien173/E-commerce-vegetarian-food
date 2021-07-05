package com.vegetarian.api.admin;

import com.vegetarian.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/api/feedback")
public class AdminFeedbackAPI {
    @Autowired
    private FeedbackService feedbackService;
    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") int id){
        if(feedbackService.deleteFeedback(id)) return ResponseEntity.ok().build();
        else return ResponseEntity.badRequest().build();
    }
    @GetMapping("/update/{id}/{status}")
    public ResponseEntity<?> updateStatus(@PathVariable("id") int id,
                                          @PathVariable("status") int status){
        if(feedbackService.updateStatus(status,id)) return ResponseEntity.ok().build();
        else return ResponseEntity.badRequest().build();
    }
}
