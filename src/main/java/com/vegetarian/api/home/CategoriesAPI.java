package com.vegetarian.api.home;

import com.google.gson.Gson;
import com.vegetarian.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/categories")
public class CategoriesAPI {
    @Autowired
    private CategoryService categoryService;
    @RequestMapping(value = "/list",
            method = RequestMethod.GET,
            produces = "text/plain;charset=UTF-8")
    private String getAllCategory(){
        return new Gson().toJson(categoryService.getAllCategory());
    }
}
