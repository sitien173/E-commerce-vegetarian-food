package com.vegetarian.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/feedback")
public class AdminFeedbackController {
    @GetMapping("/list")
    public String showViewFeedback(){
        return "admin/feedback";
    }
}
