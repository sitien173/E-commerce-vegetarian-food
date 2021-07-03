package com.vegetarian.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class DashBoardController {
    @GetMapping(value = {"","home","dashboard"})
    private String showDashboard(){
        return "admin/dashboard";
    }
}
