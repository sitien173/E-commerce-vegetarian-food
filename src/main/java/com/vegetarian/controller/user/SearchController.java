package com.vegetarian.controller.user;

import com.google.gson.Gson;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private ProductService productService;

    @GetMapping(value = "/query",produces = "text/plain;charset=UTF-8")
    public String getProductSearchAjax(@RequestParam("q") String text, Model model){
        model.addAttribute("products",productService.getProductSearchAjax(text));
        return "search";
    }
}
