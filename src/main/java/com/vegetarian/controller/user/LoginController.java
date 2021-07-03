package com.vegetarian.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user/login")
public class LoginController {
    @GetMapping(value = {"/",""})
    private String showViewLogin(HttpServletRequest request){
        System.out.println(request.getContextPath());
        return "user/login";
    }
}
