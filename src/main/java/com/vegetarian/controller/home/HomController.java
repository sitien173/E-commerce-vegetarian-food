package com.vegetarian.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomController {
    @GetMapping(value = {"","home","index"})
    public String showViewHome(){
        return "index";
    }
    @GetMapping("admin/test")
    public String showViewDashBoard(){
        return "admin/dashboard";
    }
}
