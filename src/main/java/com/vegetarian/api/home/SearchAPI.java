package com.vegetarian.api.home;

import com.google.gson.Gson;
import com.vegetarian.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/search")
public class SearchAPI {
    @Autowired
    private ProductService productService;
    @GetMapping(value = "/query",produces = "text/plain;charset=UTF-8")
    public String getProductSearchAjax(@RequestParam("q") String text){
        return new Gson().toJson(productService.getProductSearchAjax(text));
    }
}
