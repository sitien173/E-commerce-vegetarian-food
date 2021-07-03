package com.vegetarian.controller.home;

import com.vegetarian.serviceImpl.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URISyntaxException;

@Controller
@RequestMapping("/")
public class HomController {



    @GetMapping("/api/home")
    @ResponseBody
    public String Test(){
        return " ";
    }

    @GetMapping(value = {"","home","index"})
    public String showViewHome(){
        return "index";
    }

    @GetMapping("/test")
    public String showTest(){
        return "test";
    }

}
